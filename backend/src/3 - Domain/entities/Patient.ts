export class Patient {
    constructor(
        public patientId: number,
        public name: string | null,
        public cpfPatient: string | null,
        public phone: string | null,
        public address: string | null,
        public gender: string | null,
        public birthday: Date | null,
        public email: string | null
    ) {}
}