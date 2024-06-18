import { IPatientRepository } from "../../../3 - Domain/repositories/IPatientRepository";

export class GetPatientUseCase {
    constructor(private PatientRepository: IPatientRepository) {}

    async execute(id: number) {
        return await this.PatientRepository.findById(id);
    }
}