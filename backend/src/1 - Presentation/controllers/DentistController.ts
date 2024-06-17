import { Request, Response } from "express";
import { CreateDentistUseCase } from "../../2 - Application/useCases/dentist/CreateDentistUseCase";
import { GetDentistUseCase } from "../../2 - Application/useCases/dentist/GetDentistUseCase";
import { GetAllDentistUseCase } from "../../2 - Application/useCases/dentist/GetAllDentistUseCase";
import { UpdateDentistUseCase } from "../../2 - Application/useCases/dentist/UpdateDentistUseCase";
import { DeleteDentistUseCase } from "../../2 - Application/useCases/dentist/DeleteDentistUseCase";
import { DentistRepository } from "../../4 - Infrastructure/persistence/prisma/repositories/DentistRepository";

export class DentistController {
  private createDentistUseCase: CreateDentistUseCase;
  private getDentistUseCase: GetDentistUseCase;
  private updateDentistUseCase: UpdateDentistUseCase;
  private deleteDentistUseCase: DeleteDentistUseCase;
  private getAllDentistUseCase: GetAllDentistUseCase;

  constructor() {
    const dentistRepository = new DentistRepository();
    this.createDentistUseCase = new CreateDentistUseCase(dentistRepository);
    this.getDentistUseCase = new GetDentistUseCase(dentistRepository);
    this.getAllDentistUseCase = new GetAllDentistUseCase(dentistRepository);
    this.updateDentistUseCase = new UpdateDentistUseCase(dentistRepository);
    this.deleteDentistUseCase = new DeleteDentistUseCase(dentistRepository);
  }
  async create(req: Request, res: Response) {
    const { dentistId, name, specialty, cro } = req.body;

    try {
      const dentist = await this.createDentistUseCase.execute({
        dentistId,
        name,
        specialty,
        cro,
      });

      return res.status(201).json(dentist);
    } catch (error) {
      if (error instanceof Error) {
        return res.status(400).json({ error: error.message });
      }
      return res.status(400).json({ error: "Unknown error" });
    }
  }

  async get(req: Request, res: Response) {
    const { id } = req.params;

    try {
      const Dentist = await this.getDentistUseCase.execute(Number(id));

      if (!Dentist) {
        return res.status(404).json({ error: "Dentist not found" });
      }

      return res.status(200).json(Dentist);
    } catch (error) {
      if (error instanceof Error) {
        return res.status(400).json({ error: error.message });
      }
      return res.status(400).json({ error: "Unknown error" });
    }
  }

  async getAll(req: Request, res: Response) {
    try {
      const dentists = await this.getAllDentistUseCase.execute();
      return res.status(200).json(dentists);
    } catch (error) {
      if (error instanceof Error) {
        return res.status(500).json({ error: error.message });
      }
      return res.status(500).json({ error: "Failed to fetch dentists" });
    }
  }


  async update(req: Request, res: Response) {
    const { id } = req.params;
    const { name, specialty, cro } = req.body;

    try {
      const Dentist = await this.updateDentistUseCase.execute({
        dentistId: Number(id),
        name,
        specialty,
        cro,
      });

      return res.status(200).json(Dentist);
    } catch (error) {
      if (error instanceof Error) {
        return res.status(400).json({ error: error.message });
      }
      return res.status(400).json({ error: "Unknown error" });
    }
  }

  async delete(req: Request, res: Response) {
    const { id } = req.params;

    try {
      await this.deleteDentistUseCase.execute(Number(id));
      return res.status(204).send();
    } catch (error) {
      if (error instanceof Error) {
        return res.status(400).json({ error: error.message });
      }
      return res.status(400).json({ error: "Unknown error" });
    }
  }
}
