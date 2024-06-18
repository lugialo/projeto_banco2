import { Patient } from "../entities/Patient";

export interface IPatientRepository {
    create(patient: Patient): Promise<Patient>;
    findById(id: number): Promise<Patient | null>;
    findAll(): Promise<Patient[]>;
    update(patient: Patient): Promise<Patient>;
    delete(id: number): Promise<void>;
}