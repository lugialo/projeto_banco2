import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  await prisma.$queryRaw`
    CREATE TRIGGER AfterInsertPagamento
    AFTER INSERT ON Pagamento
    FOR EACH ROW
    BEGIN
        INSERT INTO LogPagamento (ActionType, PagamentoID, ConsultaID, TipoPagamentoID, Valor, DataPagamento, ExecutedBy)
        VALUES ('INSERT', NEW.PagamentoID, NEW.ConsultaID, NEW.TipoPagamentoID, NEW.Valor, NEW.DataPagamento, USER());
    END;
  `;

  await prisma.$queryRaw`
    CREATE TRIGGER AfterUpdatePagamento
    AFTER UPDATE ON Pagamento
    FOR EACH ROW
    BEGIN
        INSERT INTO LogPagamento (ActionType, PagamentoID, ConsultaID, TipoPagamentoID, Valor, DataPagamento, ExecutedBy)
        VALUES ('UPDATE', NEW.PagamentoID, NEW.ConsultaID, NEW.TipoPagamentoID, NEW.Valor, NEW.DataPagamento, USER());
    END;
  `;

  await prisma.$queryRaw`
    CREATE TRIGGER AfterDeletePagamento
    AFTER DELETE ON Pagamento
    FOR EACH ROW
    BEGIN
        INSERT INTO LogPagamento (ActionType, PagamentoID, ConsultaID, TipoPagamentoID, Valor, DataPagamento, ExecutedBy)
        VALUES ('DELETE', OLD.PagamentoID, OLD.ConsultaID, OLD.TipoPagamentoID, OLD.Valor, OLD.DataPagamento, USER());
    END;
  `;
}