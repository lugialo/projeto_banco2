export interface PatientDTO {
    patientId: number;
    name: string | null;
    cpfPatient: string | null;
    phone: string | null;
    address: string | null;
    gender: string | null;
    birthday: Date | null;
    email: string | null;
}