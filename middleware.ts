import { Request, Response, NextFunction, RequestHandler } from "express";
import jwt, { JwtPayload } from "jsonwebtoken";

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
      if (err) {
        if (err.name === "TokenExpiredError") {
          return res.status(401).json({ msg: "Token expired" });
        } else {
          return res.status(403).json({ msg: "Invalid token" });
        }
      }

      if (user && typeof user !== "string" && "id" in user) {
        const newUser = user as JwtPayload;

        if (newUser.type_of_user === "banned") {
          return res.status(403).json({ msg: "Unauthorized User" });
        } else {
          next();
        }
      } else {
        return res.status(403).json({ msg: "Invalid User" });
      }
    }
  );
};

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
      if (err) {
        if (err.name === "TokenExpiredError") {
          return res.status(401).json({ msg: "Token expired" });
        } else {
          return res.status(403).json({ msg: "Invalid token" });
        }
      }

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

const checkExecutive: RequestHandler = (
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
    async function (err, booking) {
      if (err) {
        if (err.name === "TokenExpiredError") {
          return res.status(401).json({ msg: "Token expired" });
        } else {
          return res.status(403).json({ msg: "Invalid token" });
        }
      }

      if (booking && typeof booking !== "string" && "id" in booking) {
        const newUser = booking as JwtPayload;

        if (newUser.type_of_user === "executive") {
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

export { checkAdmin, checkBanned, checkExecutive };
