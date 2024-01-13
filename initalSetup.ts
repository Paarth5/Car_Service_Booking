import mysql from "mysql2";
import dotenv from "dotenv";
dotenv.config();
const connection = (database?: string) => {
  return mysql.createConnection({
    host: "localhost",
    user: "root",
    password: process.env.DB_PASSWORD,
    ...(database ? { database: database } : {}),
    waitForConnections: true,
  });
};

const createTable = async (databaseName: string, query: string) => {
  const con = connection(databaseName);

  con.query(query, (err, rows, fields) => {
    if (err) console.log(err.message);

    console.log("The solution is: ", rows, fields);
  });
  con.end();
};
const createDatabase = async (databaseName: string) => {
  const con = connection();

  con.query(`create database IF NOT EXISTS ${databaseName} `, (err) => {
    if (err) console.log(err);
  });
  con.end();
};
(async () => {
  await createDatabase("carService");
  await createTable(
    "carService",
    `CREATE TABLE IF NOT EXISTS users (
          id INT AUTO_INCREMENT PRIMARY KEY,
          email VARCHAR(255) UNIQUE NOT NULL,
          password VARCHAR(255) NOT NULL,
          phone_number INT(45) unique,
          booking_history JSON
      )`
  );
  await createTable(
    "carService",
    `CREATE TABLE IF NOT EXISTS car_Services (
          id INT AUTO_INCREMENT PRIMARY KEY,
          type_of_service VARCHAR(255) NOT NULL,
          name VARCHAR(255) NOT NULL,
          price INT NOT NULL,
          img_path VARCHAR(255),
          details JSON,
          description JSON
      )`
  );
})();
