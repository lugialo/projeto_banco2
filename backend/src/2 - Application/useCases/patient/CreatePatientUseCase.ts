import { Patient } from "../../../3 - Domain/entities/Patient";
import { IPatientRepository } from "../../../3 - Domain/repositories/IPatientRepository";
import { PatientDTO } from "../../dtos/PatientDTO";

export class CreatePatientUseCase {
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

        return this.PatientRepository.create(patient);
    }
}