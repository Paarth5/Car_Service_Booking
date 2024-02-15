import express, { Router } from "express";
import sql from "mysql2";

import jwt, { JwtPayload } from "jsonwebtoken";
import { RowDataPacket } from "mysql2";
import { checkBanned } from "../middleware";
const db = sql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "carservice",
  waitForConnections: true,
});
const router: Router = express.Router();

router.get("/:booking_id", checkBanned, async (req, res) => {
  try {
    const token = req.headers["authorization"];
    const booking_id = req.params.booking_id;
    const data = { booking_data: {}, user_data: {}, service_info: {} };
    jwt.verify(
      token as string,
      process.env.JWT_SECRET as string,
      async function (err, booking) {
        if (err) {
          if (err.name === "TokenExpiredError") {
            return res.status(401).json({ msg: "Token expired" });
          } else {
            return res.status(403).json({ msg: "Invalid token" });
          }
        }

        if (booking && typeof booking !== "string" && "id" in booking) {
          const user = booking as JwtPayload;
          const query = "SELECT * FROM `bookings` where `id` = (?)";
          db.query(query, [booking_id], async (err, result) => {
            if (err) {
              throw err;
            }
            const temp = result as RowDataPacket[];
            if (temp.length > 0) {
              const booking_data = temp[0];
              const user_id = booking_data.user_id;
              if (user.id !== user_id) {
                return res
                  .status(403)
                  .json({ msg: "The booking does not belong to the User." });
              }
              data.booking_data = booking_data;
              // Getting User information
              db.query(
                "Select email, phone_number from users where id=(?)",
                [user_id],
                async (err, result) => {
                  if (err) {
                    throw err;
                  } else {
                    const user_data = (result as RowDataPacket[])[0];
                    if (user_data) {
                      data.user_data = user_data;
                      // Getting information about the service booked
                      db.query(
                        `select * from ${booking_data.vehicle}_services where type_of_service=(?)`,
                        [booking_data.type],
                        async (err, result) => {
                          if (err) {
                            throw err;
                          } else {
                            const service_info = (result as RowDataPacket[])[0];
                            data.service_info = service_info;
                            res.status(200).json(data);
                          }
                        }
                      );
                    } else {
                      res.status(404).json({ msg: "User not Found" });
                    }
                  }
                }
              );
            } else {
              res.status(404).json({ msg: "Booking not found." });
            }
          });
        }
      }
    );
  } catch (err) {
    res.status(500).json({ err });
  }
});

export default router;
