import { IDentistRepository } from "../../../3 - Domain/repositories/IDentistRepository";

export class DeleteDentistUseCase {
  constructor(private DentistRepository: IDentistRepository) {}

  async execute(id: number) {
    await this.DentistRepository.delete(id);
  }
}
