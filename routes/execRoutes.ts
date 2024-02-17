import express, { Router } from "express";
import sql from "mysql2";
import { RowDataPacket } from "mysql2";
import { checkExecutive } from "../middleware";
import { updateUserBooking } from "../functions";
const db = sql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "carservice",
  waitForConnections: true,
});
const router: Router = express.Router();

router.get("/bookings", checkExecutive, async (req, res) => {
  try {
    const query = "SELECT * FROM bookings";
    db.query(query, async (err, result) => {
      if (err) {
        throw err;
      }

      const bookings = result as RowDataPacket[];

      res.status(200).json({ bookings });
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

router.get("/status/:booking_id", checkExecutive, async (req, res) => {
  try {
    const id = req.params.booking_id;
    const query = "SELECT * FROM `bookings` where `id` = (?)";
    db.query(query, [id], async (err, result) => {
      if (err) {
        throw err;
      }

      const data = result as RowDataPacket[];
      const booking = data[0];

      db.query(
        "UPDATE `bookings` set `status` = (?) where `id` = (?)",
        [booking.status === "pending" ? "resolved" : "pending", id],
        async (err, result) => {
          if (err) {
            throw err;
          } else {
            await updateUserBooking(booking.user_id, id);
          }
        }
      );

      res.status(200).json({ msg: "Booking Status Updated." });
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

export default router;
