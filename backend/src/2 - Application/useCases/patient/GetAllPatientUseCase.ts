import { PatientRepository } from "../../../4 - Infrastructure/persistence/prisma/repositories/PatientRepository";

export class GetAllPatientUseCase {
    constructor(private PatientRepository: PatientRepository) {}

    async execute() {
        return this.PatientRepository.findAll();
    }
}