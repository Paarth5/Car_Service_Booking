import sql, { RowDataPacket } from "mysql2";

const db = sql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "carservice",
  waitForConnections: true,
});

async function updateUserBooking(user_id: number, booking_id: string) {
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
      for (let i = 0; i < history.length; i++) {
        if (history[i].booking_id === parseInt(booking_id)) {
          history[i].status =
            history[i].status === "pending" ? "resolved" : "pending";
        }
      }
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
async function addBookingHistory(
  user_id: number,
  date: string,
  type: string,
  vehicle: string,
  booking_id: number
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

      history.push({ booking_id, date, type, vehicle, status: "pending" });

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

export { addBookingHistory, updateUserBooking };
