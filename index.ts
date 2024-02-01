import express, {
  Request,
  Response,
  NextFunction,
  RequestHandler,
} from "express";
import sql from "mysql2";
import bodyParser from "body-parser";
import cors from "cors";
import dotenv from "dotenv";
import helmet from "helmet";
import morgan from "morgan";
import bcrypt from "bcrypt";
import jwt, { JwtPayload } from "jsonwebtoken";
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
  password: "",
  database: "carservice",
  waitForConnections: true,
});

const checkBanned: RequestHandler = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const token = req.headers["authorization"];

  if (!token) {
    return res.status(401).json({ msg: "Unauthorized User" });
  }

  jwt.verify(
    token as string,
    process.env.JWT_SECRET as string,
    async function (err, user) {
      if (err) throw err;

      if (user && typeof user !== "string" && "id" in user) {
        const newUser = user as JwtPayload;

        if (
          newUser.type_of_user === "admin" ||
          newUser.type_of_user === "user"
        ) {
          next();
        } else {
          return res.status(403).json({ msg: "Unauthorized User" });
        }
      } else {
        return res.status(403).json({ msg: "Invalid User" });
      }
    }
  );
};

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
            type_of_user: "user",
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
      console.log(firstUser);
      if (isMatch) {
        const token = jwt.sign(
          {
            id: firstUser.id,
            email: firstUser.email,
            phone_number: firstUser.phone_number,
            type_of_user: firstUser.type_of_user,
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

app.get("/car/services/:type", checkBanned, (req, res) => {
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

app.get("/car/shopping/:type", checkBanned, (req, res) => {
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

app.get("/car/part/:id", checkBanned, (req, res) => {
  try {
    const id = req.params.id;
    const query = "SELECT * FROM car_Shopping WHERE id = ?";

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

// Bike API's
app.get("/bike/services/:type", checkBanned, (req, res) => {
  try {
    const type = req.params.type;
    const query = "Select * from bike_services where type_of_service = (?)";
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

app.get("/bike/shopping/:type", checkBanned, (req, res) => {
  try {
    const type1 = req.params.type;
    const query =
      "SELECT id, name, price, img_path FROM bike_Shopping WHERE type = (?)";
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

app.get("/bike/part/:id", checkBanned, (req, res) => {
  try {
    const id = req.params.id;
    const query = "SELECT * FROM bike_Shopping WHERE id = ?";

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
          await addBookingHistory(newUser.id, date, type, vehicle);
          const query =
            "INSERT INTO bookings (vehicle, type, user_id, name, phone_no, location, date) VALUES (?, ?, ?, ?, ?, ?, ?)";
          db.query(
            query,
            [vehicle, type, newUser.id, name, phone_no, location, date],
            (err, result) => {
              if (err) {
                throw err;
              } else res.status(200).json({ msg: "Booking added" });
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

async function addBookingHistory(
  user_id: number,
  date: string,
  type: string,
  vehicle: string
) {
  const query = "SELECT booking_history FROM users WHERE id = ?";
  db.query(query, [user_id], async (err, result) => {
    if (err) {
      throw err;
    }

    const rows = result as RowDataPacket[];
    if (rows.length > 0) {
      const data = rows[0];

      let history: any[] = [];

      if (data.booking_history) {
        history = JSON.parse(data.booking_history);
      }

      history.push({ date, type, vehicle });

      const updatedBookingHistory = JSON.stringify(history);

      db.execute("UPDATE users SET booking_history = ? WHERE id = ?", [
        updatedBookingHistory,
        user_id,
      ]);
    } else {
      return;
    }
  });
}

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
            } else res.status(200).json({ result });
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

//ADMIN FUNCTIONS
const checkAdmin: RequestHandler = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const token = req.headers["authorization"];

  if (!token) {
    return res.status(401).json({ msg: "Unauthorized User" });
  }

  jwt.verify(
    token as string,
    process.env.JWT_SECRET as string,
    async function (err, user) {
      if (err) throw err;

      if (user && typeof user !== "string" && "id" in user) {
        const newUser = user as JwtPayload;

        if (newUser.type_of_user === "admin") {
          next();
        } else {
          return res.status(403).json({ msg: "Unauthorized User" });
        }
      } else {
        return res.status(403).json({ msg: "Invalid User" });
      }
    }
  );
};

app.post("/admin/ban/:userId", checkAdmin, async (req, res) => {
  try {
    const userId = req.params.userId;

    const query = "SELECT type_of_user FROM users WHERE id = ?";
    db.query(query, [userId], async (err, result) => {
      if (err) {
        throw err;
      }

      const rows = result as RowDataPacket[];
      if (rows.length > 0) {
        const data = rows[0];
        let type = data.type_of_user;

        if (type === "user") {
          type = "banned";
        } else if (type === "banned") {
          type = "user";
        } else if (type === "admin") {
          return res.status(403).json({ msg: "Cannot Ban another admin" });
        } else {
          type = "user";
        }

        db.execute("UPDATE users SET type_of_user = ? WHERE id = ?", [
          type,
          userId,
        ]);
      } else {
        res.status(404).json({ msg: "No user Found wi th the following Id." });
      }

      res.status(200).json({ msg: "User status updated successfully" });
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

app.get("/admin/users", checkAdmin, async (req, res) => {
  try {
    const query =
      "SELECT id, email, phone_number, booking_history, type_of_user FROM users";
    db.query(query, async (err, result) => {
      if (err) {
        throw err;
      }

      const users = result as RowDataPacket[];

      res.status(200).json({ users });
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

app.listen(PORT, () => {
  console.log(`Listening on Port ${PORT}`);
});
