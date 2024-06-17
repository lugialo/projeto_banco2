import { Dentist } from "../entities/Dentist";

export interface IDentistRepository {
  create(dentist: Dentist): Promise<Dentist>;
  findById(id: number): Promise<Dentist | null>;
  update(dentist: Dentist): Promise<Dentist>;
  delete(id: number): Promise<void>;
}
