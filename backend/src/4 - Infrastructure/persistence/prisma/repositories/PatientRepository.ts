import { Patient } from "../../../../3 - Domain/entities/Patient";
import { IPatientRepository } from "../../../../3 - Domain/repositories/IPatientRepository";

import prisma from "../PrismaClient";

export class PatientRepository implements IPatientRepository {
  async create(patient: Patient): Promise<Patient> {
    const newPatient = await prisma.paciente
      .create({
        data: {
          id_paciente: patient.patientId,
          nome_paciente: patient.name,
          cpf_paciente: patient.cpfPatient,
          telefone: patient.phone,
          endereco: patient.address,
          genero: patient.gender,
          data_nasc: patient.birthday,
          email: patient.email,
        },
      })
      .then(
        (patient) =>
          new Patient(
            patient.id_paciente,
            patient.nome_paciente,
            patient.cpf_paciente,
            patient.telefone,
            patient.endereco,
            patient.genero,
            patient.data_nasc,
            patient.email
          )
      );
    return newPatient;
  }

  async findById(patientId: number): Promise<Patient | null> {
    const patient = await prisma.paciente.findUnique({
      where: { id_paciente: patientId }, //
    });

    if (!patient) {
      throw new Error("Paciente não foi encontrado!");
    }

    return new Patient(
      patient.id_paciente,
      patient.nome_paciente,
      patient.cpf_paciente,
      patient.telefone,
      patient.endereco,
      patient.genero,
      patient.data_nasc,
      patient.email
    );
  }

  async findAll(): Promise<Patient[]> {
    const patients = await prisma.paciente.findMany();

    return patients.map(
      (patient) =>
        new Patient(
          patient.id_paciente,
          patient.nome_paciente,
          patient.cpf_paciente,
          patient.telefone,
          patient.endereco,
          patient.genero,
          patient.data_nasc,
          patient.email
        )
    );
  }

  async update(patient: Patient): Promise<Patient> {
    const updatedPatient = await prisma.paciente
      .update({
        where: { id_paciente: patient.patientId },
        data: {
          nome_paciente: patient.name,
          cpf_paciente: patient.cpfPatient,
          telefone: patient.phone,
          endereco: patient.address,
          genero: patient.gender,
          data_nasc: patient.birthday,
          email: patient.email,
        },
      })
      .then(
        (patient) =>
          new Patient(
            patient.id_paciente,
            patient.nome_paciente,
            patient.cpf_paciente,
            patient.telefone,
            patient.endereco,
            patient.genero,
            patient.data_nasc,
            patient.email
          )
      );
    return updatedPatient;
  }

  async delete(id: number): Promise<void> {
    const hasScheduling = await prisma.agendamento.findFirst({
      where: {
        paciente_id_paciente: id,
      },
    });

    if (hasScheduling) {
      throw new Error("Não é possível excluir paciente pois possui vínculos.");
    }
    
    await prisma.paciente.delete({
      where: { id_paciente: id },
    });
  }
}
