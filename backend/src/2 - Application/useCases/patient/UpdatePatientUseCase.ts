import { IPatientRepository } from "../../../3 - Domain/repositories/IPatientRepository";
import { Patient } from "../../../3 - Domain/entities/Patient";
import { PatientDTO } from "../../dtos/PatientDTO";

export class UpdatePatientUseCase {
    constructor(private PatientRepository: IPatientRepository) {}

    async execute(data: PatientDTO) {
        const patient = new Patient(
            data.patientId,
            data.name,
            data.cpfPatient,
            data.phone,
            data.address,
            data.gender,
            data.birthday,
            data.email
        );
        return await this.PatientRepository.update(patient);
    }
}