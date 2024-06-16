import { Router } from "express";
import { DentistController } from "../controllers/DentistController";

const dentistController = new DentistController();
const DentistRouter = Router();

DentistRouter.post("/dentists", (req, res) => dentistController.create(req, res));
DentistRouter.get("/dentists/:id", (req, res) => dentistController.get(req, res));
DentistRouter.put("/dentists/:id", (req, res) => dentistController.update(req, res));
DentistRouter.delete("/dentists/:id", (req, res) => dentistController.delete(req, res));

export default DentistRouter;
