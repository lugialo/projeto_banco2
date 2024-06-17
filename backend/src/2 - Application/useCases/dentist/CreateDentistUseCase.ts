import { Dentist } from "../../../3 - Domain/entities/Dentist";
import { IDentistRepository } from "../../../3 - Domain/repositories/IDentistRepository";
import { DentistDTO } from "../../dtos/DentistDTO";

export class CreateDentistUseCase {
  constructor(private DentistRepository: IDentistRepository) {}

  async execute(data: DentistDTO) {
    const dentist = new Dentist(
      data.dentistId,
      data.name,
      data.specialty,
      data.cro
    );

    return this.DentistRepository.create(dentist);
  }
}
