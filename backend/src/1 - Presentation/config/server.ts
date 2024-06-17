import express, { json } from 'express';
import routes from '../routes';
import 'express-async-errors';

const server = express();

server.use(json());

server.use('/api', routes);


export default server;
