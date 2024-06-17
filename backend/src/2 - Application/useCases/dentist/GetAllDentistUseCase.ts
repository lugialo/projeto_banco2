import { DentistRepository } from "../../../4 - Infrastructure/persistence/prisma/repositories/DentistRepository";

export class GetAllDentistUseCase {
    constructor(private DentistRepository: DentistRepository) {}

    async execute() {
        return this.DentistRepository.findAll();
    }
}