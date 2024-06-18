import { Request, Response } from "express";
import { CreatePatientUseCase } from "../../2 - Application/useCases/patient/CreatePatientUseCase";
import { GetPatientUseCase } from "../../2 - Application/useCases/patient/GetPatientUseCase";
import { GetAllPatientUseCase } from "../../2 - Application/useCases/patient/GetAllPatientUseCase";
import { UpdatePatientUseCase } from "../../2 - Application/useCases/patient/UpdatePatientUseCase";
import { DeletePatientUseCase } from "../../2 - Application/useCases/patient/DeletePatientUseCase";
import { PatientRepository } from "../../4 - Infrastructure/persistence/prisma/repositories/PatientRepository";

export class PatientController {
  private createPatientUseCase: CreatePatientUseCase;
  private getPatientUseCase: GetPatientUseCase;
  private getAllPatientUseCase: GetAllPatientUseCase;
  private updatePatientUseCase: UpdatePatientUseCase;
  private deletePatientUseCase: DeletePatientUseCase;
  constructor() {
    const patientRepository = new PatientRepository();
    this.createPatientUseCase = new CreatePatientUseCase(patientRepository);
    this.getPatientUseCase = new GetPatientUseCase(patientRepository);
    this.getAllPatientUseCase = new GetAllPatientUseCase(patientRepository);
    this.updatePatientUseCase = new UpdatePatientUseCase(patientRepository);
    this.deletePatientUseCase = new DeletePatientUseCase(patientRepository);
  }

  async create(req: Request, res: Response) {
    const {
      patientId,
      name,
      cpfPatient,
      phone,
      address,
      gender,
      birthday,
      email,
    } = req.body;

    try {
      const patient = await this.createPatientUseCase.execute({
        patientId,
        name,
        cpfPatient,
        phone,
        address,
        gender,
        birthday,
        email,
      });
      return res.status(201).json(patient);
    } catch (error) {
      if (error instanceof Error) {
        return res.status(400).json({ error: error.message });
      }
      return res.status(400).json({ error: "Unknown error" });
    }
  }

  async get(req: Request, res: Response) {
    const { patientId } = req.params;

    try {
      const Patient = await this.getPatientUseCase.execute(Number(patientId));

      if (!Patient) {
        return res.status(404).json({ error: "Patient not found" });
      }

      return res.status(200).json(Patient);
    } catch (error) {
      if (error instanceof Error) {
        return res.status(400).json({ error: error.message });
      }
      return res.status(400).json({ error: "Unknown error" });
    }
  }

  async getAll(req: Request, res: Response) {
    try {
      const Patient = await this.getAllPatientUseCase.execute();
      return res.status(200).json(Patient);
    } catch (error) {
      if (error instanceof Error) {
        return res.status(500).json({ error: error.message });
      }
      return res.status(500).json({ error: "Failed to fetch patients" });
    }
  }

  async update(req: Request, res: Response) {
    const { patientId } = req.params;
    const { name, cpfPatient, phone, address, gender, birthday, email } =
      req.body;

    try {
      const Patient = await this.updatePatientUseCase.execute({
        patientId: Number(patientId),
        name,
        cpfPatient,
        phone,
        address,
        gender,
        birthday,
        email,
      });
      return res.status(200).json(Patient);
    } catch (error) {
      if (error instanceof Error) {
        return res.status(400).json({ error: error.message });
      }
      return res.status(400).json({ error: "Unknown error" });
    }
  }

  async delete(req: Request, res: Response) {
    const { patientId } = req.params;

    try {
      await this.deletePatientUseCase.execute(Number(patientId));
      return res.status(200).json({ message: "Patient deleted" });
    } catch (error) {
      if (error instanceof Error) {
        return res.status(400).json({ error: error.message });
      }
      return res.status(400).json({ error: "Unknown error" });
    }
  }
}
