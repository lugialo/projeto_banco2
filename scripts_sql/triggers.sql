CREATE TRIGGER AfterInsertPagamento
    AFTER INSERT ON pagamento
    FOR EACH ROW
    BEGIN
        INSERT INTO LogPagamento (ActionType, id_pagamento, consulta_id_consulta, tipo_pagamento_id_tipo_pagamento, valor_pago, data_pagamento, ExecutedBy)
        VALUES ('INSERT', NEW.id_pagamento, NEW.consulta_id_consulta, NEW.tipo_pagamento_id_tipo_pagamento, NEW.valor_pago, NEW.data_pagamento, USER());
    END;
    
CREATE TRIGGER AfterUpdatePagamento
    AFTER UPDATE ON pagamento
    FOR EACH ROW
    BEGIN
        INSERT INTO LogPagamento (ActionType, id_pagamento, consulta_id_consulta, tipo_pagamento_id_tipo_pagamento, valor_pago, data_pagamento, ExecutedBy)
        VALUES ('UPDATE', NEW.id_pagamento, NEW.consulta_id_consulta, NEW.tipo_pagamento_id_tipo_pagamento, NEW.valor_pago, NEW.data_pagamento, USER());
    END;
    
CREATE TRIGGER AfterDeletePagamento
    AFTER DELETE ON pagamento
    FOR EACH ROW
    BEGIN
        INSERT INTO LogPagamento (ActionType, id_pagamento, consulta_id_consulta, tipo_pagamento_id_tipo_pagamento, valor_pago, data_pagamento, ExecutedBy)
        VALUES ('DELETE', OLD.id_pagamento, OLD.consulta_id_consulta, OLD.tipo_pagamento_id_tipo_pagamento, OLD.valor_pago, OLD.data_pagamento, USER());
    END;