import { IPatientRepository } from "../../../3 - Domain/repositories/IPatientRepository";

export class DeletePatientUseCase {
    constructor(private PatientRepository: IPatientRepository) {}

    async execute(id: number) {
        await this.PatientRepository.delete(id);
    }
}