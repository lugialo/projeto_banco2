import express from 'express';
import DentistRouter from './DentistRoutes';

const router = express.Router();

router.use('', DentistRouter);

export default router;
