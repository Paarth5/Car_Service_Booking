import express, { Router, Request, Response } from "express";
import sql from "mysql2";
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

router.get("/services/:type", checkBanned, (req, res) => {
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

router.get("/shopping/:type", checkBanned, (req, res) => {
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

router.get("/part/:id", checkBanned, (req, res) => {
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

export default router;
