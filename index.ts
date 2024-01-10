import express from "express";
import sql from "mysql2";
import bodyParser from "body-parser";
import cors from "cors";
import dotenv from "dotenv";
import helmet from "helmet";
import morgan from "morgan";

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

app.get("/", (req, res) => {
  res.send("hello");
});

app.listen(PORT, () => {
  console.log(`Listening on Port ${PORT}`);
});
