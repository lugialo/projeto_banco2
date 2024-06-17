import { Dentist } from "../../../../3 - Domain/entities/Dentist";
import { IDentistRepository } from "../../../../3 - Domain/repositories/IDentistRepository";
import prisma from "../PrismaClient";

export class DentistRepository implements IDentistRepository {
  async create(dentist: Dentist): Promise<Dentist> {
    const newDentist = await prisma.odontologista
      .create({
        data: {
          id_odontologista: dentist.dentistId,
          nome_odontologista: dentist.name,
          especialidade: dentist.specialty,
          cro: dentist.cro,
        },
      })
      .then(
        (dentist) =>
          new Dentist(
            dentist.id_odontologista,
            dentist.nome_odontologista,
            dentist.especialidade,
            dentist.cro
          )
      );

    return newDentist;
  }

  async findById(id: number): Promise<Dentist | null> {
    const dentist = await prisma.odontologista.findUnique({
      where: { id_odontologista: id },
    });

    if (!dentist) {
      throw new Error("Odontologista não foi encontrado!");
    }

    return new Dentist(
      dentist.id_odontologista,
      dentist.nome_odontologista,
      dentist.especialidade,
      dentist.cro
    );
  }

  async findAll(): Promise<Dentist[]> {
    const dentists = await prisma.odontologista.findMany();
  
    return dentists.map(dentist => new Dentist(
      dentist.id_odontologista,
      dentist.nome_odontologista,
      dentist.especialidade,
      dentist.cro
    ));
  }
  

  async update(dentist: Dentist): Promise<Dentist> {
    const updatedDentist = await prisma.odontologista
      .update({
        where: { id_odontologista: dentist.dentistId },
        data: {
          nome_odontologista: dentist.name,
          especialidade: dentist.specialty,
          cro: dentist.cro,
        },
      })
      .then(
        (dentist) =>
          new Dentist(
            dentist.id_odontologista,
            dentist.nome_odontologista,
            dentist.especialidade,
            dentist.cro
          )
      );

    return updatedDentist;
  }

  async delete(id: number): Promise<void> {
    await prisma.odontologista.delete({
      where: { id_odontologista: id },
    });
  }
}
