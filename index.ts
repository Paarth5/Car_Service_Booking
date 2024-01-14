import express from "express";
import sql from "mysql2";
import bodyParser from "body-parser";
import cors from "cors";
import dotenv from "dotenv";
import helmet from "helmet";
import morgan from "morgan";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { RowDataPacket } from "mysql2";
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
  password: process.env.DB_PASSWORD,
  database: "carService",
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
      "INSERT INTO users (email, password, phone_number, booking_history) VALUES (?, ?, ?, ?)";
    db.query(
      query,
      [email, passwordHash, phone_number, "[]"],
      (err, result) => {
        if (err) {
          throw err;
        }
        const token = jwt.sign(
          {
            email,
            phone_number,
          },
          process.env.JWT_SECRET as string,
          {
            expiresIn: "24h",
          }
        );
        console.log(result);
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

app.get("/carServices/:type", (req, res) => {
  try {
    const type = req.params.type;
    const query = "Select * from car_services where type_of_service = (?)";
    db.query(query, [type], (err, result) => {
      if (err) {
        throw err;
      }
      const data = (result as RowDataPacket[])[0];
      res.status(200).json({ ...data });
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

app.get("/carShopping/:type", (req, res) => {
  try {
    const type1 = req.params.type;
    const query =
      "SELECT id, name, price, img_path FROM car_Shopping WHERE type = (?)";
    db.query(query, [type1], (err, result) => {
      if (err) {
        throw err;
      }
      const data = result as RowDataPacket[];
      res.status(200).json({ ...data });
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

app.get("/carPart/:id", (req, res) => {
  try {
    const id = req.params.id;
    const query = "SELECT * FROM car_Shopping WHERE id = ?";
    console.log("hello", id);

    db.query(query, [id], (err, result) => {
      if (err) {
        throw err;
      }
      const data = result as RowDataPacket[];
      if (data.length > 0) {
        const data1 = data[0];
        res.status(200).json({ ...data1 });
      } else {
        res.status(404).json({ msg: "No data found for the given ID" });
      }
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

app.listen(PORT, () => {
  console.log(`Listening on Port ${PORT}`);
});

// const query = "INSERT INTO users (email, password, booking_history) VALUES (?, ?, ?)";
// const email = "parth12@gmail.com";
// const password = "parth123";
// const bookingHistory = "[]";

// db.query(query, [email, password, bookingHistory], (err, result) => {
//   if (err) {
//     console.error(err);
//   }
//   console.log("Entry Added Successfully!");
//   console.log(result);
// });
// async function match() {
//   const isMatch = await bcrypt.compare(
//     "1256217a",
//     "$2b$10$7zR1bOVtdn9U7g44ZGKTPuENvayAjN.6cBzRSIqC.wyY4OSJJTbU6"
//   );
//   console.log(isMatch);
// }
// match();
