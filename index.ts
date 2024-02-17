import express from "express";
import sql from "mysql2";
import bodyParser from "body-parser";
import cors from "cors";
import dotenv from "dotenv";
import helmet from "helmet";
import morgan from "morgan";
import bcrypt from "bcrypt";
import jwt, { JwtPayload } from "jsonwebtoken";
import { RowDataPacket } from "mysql2";
import { checkBanned } from "./middleware";
import { addBookingHistory } from "./functions";
import carRoutes from "./routes/carRoutes";
import bikeRoutes from "./routes/bikeRoutes";
import adminRoutes from "./routes/adminRoutes";
import execRoutes from "./routes/execRoutes";
import invoiceRoutes from "./routes/invoiceRoutes";

dotenv.config();
const app = express();
app.use(express.json());
app.use(helmet());
app.use(helmet.crossOriginResourcePolicy({ policy: "cross-origin" }));
app.use(morgan("common"));
app.use(bodyParser.json({}));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());
const PORT = process.env.PORT || 3001;

const db = sql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "carservice",
  waitForConnections: true,
});

app.get("/", (req, res) => {
  res.send("hello");
});

app.post("/register", async (req, res) => {
  try {
    const { email, password, phone_number } = req.body;
    const salt = await bcrypt.genSalt();
    const passwordHash = await bcrypt.hash(password, salt);

    const query =
      "INSERT INTO users (email, password, phone_number, booking_history, type_of_user) VALUES (?, ?, ?, ?, ?)";
    db.query(
      query,
      [email, passwordHash, phone_number, "[]", "user"],
      (err, result) => {
        if (err) {
          throw err;
        }
        const userId = (result as any).insertId;

        const token = jwt.sign(
          {
            id: userId,
            email,
            phone_number,
          },
          process.env.JWT_SECRET as string,
          {
            expiresIn: "24h",
          }
        );
        res.status(201).json({ token });
      }
    );
  } catch (err) {
    res.status(500).json({ err });
  }
});

app.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    const query = "SELECT * FROM users WHERE email = ?";

    const result = await new Promise<RowDataPacket[]>((resolve, reject) => {
      db.query(query, [email], (err, result) => {
        if (err) {
          console.error(err);
          reject(err);
          return;
        }
        resolve(result as RowDataPacket[]);
      });
    });

    if (result.length > 0) {
      const firstUser = result[0];
      const isMatch = await bcrypt.compare(password, firstUser.password);
      if (isMatch) {
        const token = jwt.sign(
          {
            id: firstUser.id,
            email: firstUser.email,
            phone_number: firstUser.phone_number,
          },
          process.env.JWT_SECRET as string,
          {
            expiresIn: "24h",
          }
        );

        res.status(200).json({ token });
      } else {
        res.status(400).json({ msg: "Invalid credentials." });
      }
    } else {
      res.status(400).json({ msg: "User does not exist." });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: "Internal server error." });
  }
});

// Car Routes
app.use("/car", carRoutes);

// Bike Routes
app.use("/bike", bikeRoutes);

//ADMIN Routes
app.use("/admin", adminRoutes);

// Executive API's
app.use("/exec", execRoutes);

// Bill Generation
app.use("/invoice", invoiceRoutes);

app.post("/booking/:vehicle/:type", checkBanned, async (req, res) => {
  try {
    const type = req.params.type;
    const vehicle = req.params.vehicle;
    const { name, phone_no, location, date } = req.body;
    const token = req.headers["authorization"];
    if (!token) {
      return res.status(401).json({ msg: "Unauthorized User" });
    }

    jwt.verify(
      token,
      process.env.JWT_SECRET as string,
      async function (err, user) {
        if (err) return res.status(403).json({ msg: "Invalid User" });
        if (user && typeof user !== "string" && "id" in user) {
          const newUser = user as JwtPayload;

          const query =
            "INSERT INTO bookings (vehicle, type, user_id, name, phone_no, location, date, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
          db.query(
            query,
            [
              vehicle,
              type,
              newUser.id,
              name,
              phone_no,
              location,
              date,
              "pending",
            ],
            async (err, result) => {
              if (err) {
                throw err;
              } else {
                const booking_id = (result as any).insertId;

                await addBookingHistory(
                  newUser.id,
                  date,
                  type,
                  vehicle,
                  booking_id
                );
                res.status(200).json({ msg: "Booking added" });
              }
            }
          );
        } else {
          return res.status(403).json({ msg: "Invalid User" });
        }
      }
    );
  } catch (err) {
    res.status(500).json({ err });
  }
});

app.get("/bookings", checkBanned, async (req, res) => {
  try {
    const token = req.headers["authorization"];
    if (!token) {
      return res.status(401).json({ msg: "Unauthorized User" });
    }

    jwt.verify(
      token,
      process.env.JWT_SECRET as string,
      async function (err, user) {
        if (err) return res.status(403).json({ msg: "Invalid User" });
        if (user && typeof user !== "string" && "id" in user) {
          const newUser = user as JwtPayload;

          const query = "Select booking_history FROM users where id = (?)";
          db.query(query, [newUser.id], (err, result) => {
            if (err) {
              throw err;
            } else {
              const data = (result as RowDataPacket[])[0];
              res.status(200).json({ ...data });
            }
          });
        } else {
          return res.status(403).json({ msg: "Invalid User" });
        }
      }
    );
  } catch (err) {
    res.status(500).json({ err });
  }
});

app.listen(PORT, () => {
  console.log(`Listening on Port ${PORT}`);
});
