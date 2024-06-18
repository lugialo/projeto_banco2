import express from 'express';
import DentistRouter from './DentistRoutes';
import PatientRouter from './PatientRoutes';

const router = express.Router();

router.use('', DentistRouter);
router.use('', PatientRouter);

export default router;
