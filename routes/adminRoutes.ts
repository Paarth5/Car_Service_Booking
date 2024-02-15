import express, { Router, Request, Response } from "express";
import sql from "mysql2";
import { RowDataPacket } from "mysql2";
import { checkAdmin } from "../middleware";
const db = sql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "carservice",
  waitForConnections: true,
});
const router: Router = express.Router();

router.post("/ban/:userId", checkAdmin, async (req, res) => {
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
        } else if (type === "executive") {
          return res.status(403).json({ msg: "Cannot Ban an executive" });
        } else {
          type = "user";
        }

        db.execute("UPDATE users SET type_of_user = ? WHERE id = ?", [
          type,
          userId,
        ]);
      } else {
        res.status(404).json({ msg: "No user Found with the following Id." });
      }

      res.status(200).json({ msg: "User status updated successfully" });
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

router.get("/users", checkAdmin, async (req, res) => {
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

export default router;
