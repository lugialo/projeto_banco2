import { Router } from "express";
import { PatientController } from "../controllers/PatientController";

const patientController = new PatientController();
const PatientRouter = Router();

PatientRouter.post("/patients", (req, res) => patientController.create(req, res));
PatientRouter.get("/patients/:patientId", (req, res) => patientController.get(req, res));
PatientRouter.get("/patients", (req, res) => patientController.getAll(req, res));
PatientRouter.put("/patients/:patientId", (req, res) => patientController.update(req, res));
PatientRouter.delete("/patients/:patientId", (req, res) => patientController.delete(req, res));

export default PatientRouter;