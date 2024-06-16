import { IDentistRepository } from "../../../3 - Domain/repositories/IDentistRepository";

export class GetDentistUseCase {
  constructor(private DentistRepository: IDentistRepository) {}

  async execute(id: number) {
    return this.DentistRepository.findById(id);
  }
}
