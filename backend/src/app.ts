import 'dotenv/config';
import server from './1 - Presentation/config/server';

server.listen(process.env.PORT || 8099, () => {
  // eslint-disable-next-line no-console
  console.log('\n\n\n 🚀️ Server is running 🚀️ \n\n\n');
});