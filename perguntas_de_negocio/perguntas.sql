-- 1.Qual a especialidade dos ortodontistas com maior quantidade de agendamentos nos últimos 4 meses?

CREATE INDEX idx_agendamento_data ON agendamento (data_agendamento); -- filtrar agendamento pela coluna data_agendamento
CREATE INDEX idx_agendamento_odontologista ON agendamento (odontologista_id_odontologista); -- unir agendamento com odontologista
CREATE INDEX idx_consulta_procedimento_consulta ON consulta_procedimento (consulta_id_consulta); -- unir consulta_procedimento com consulta
CREATE INDEX idx_consulta_agendamento ON consulta (agendamento_id_agendamento); -- unir consulta e agendamento
CREATE INDEX idx_odontologista_especialidade ON odontologista (especialidade); -- necessário para melhorar o desempenho do filtro por especialidade
CREATE INDEX idx_procedimento_nome ON procedimento (nome_procedimento); -- necessário para melhorar o desempenho da agregação por nome_procedimento


-- Remover o procedimento armazenado existente
DROP PROCEDURE IF EXISTS especialidade_agendamento_ultimos_4_meses;

-- Criar o procedimento armazenado
CREATE PROCEDURE especialidade_agendamento_ultimos_4_meses()
BEGIN
    DECLARE top_especialidade VARCHAR(255);
    
    -- Subquery para achar a maior quantidade de especialidades
    SELECT 
        o.especialidade
    INTO
        top_especialidade
    FROM 
        agendamento a
    JOIN 
        odontologista o ON a.odontologista_id_odontologista = o.id_odontologista
    WHERE 
        a.data_agendamento >= DATE_SUB(CURDATE(), INTERVAL 4 MONTH)
    GROUP BY 
        o.especialidade
    ORDER BY 
        COUNT(a.id_agendamento) DESC
    LIMIT 1;
    
    -- Query principal para achar a maior quantidade de procedimentos para a maior quantidade de especialidades 
    SELECT 
        p.nome_procedimento, 
        COUNT(cp.procedimento_id_procedimento) AS total_procedimentos
    FROM 
        consulta_procedimento cp
    JOIN 
        consulta c ON cp.consulta_id_consulta = c.id_consulta
    JOIN 
        agendamento a ON c.agendamento_id_agendamento = a.id_agendamento
    JOIN 
        odontologista o ON a.odontologista_id_odontologista = o.id_odontologista
    JOIN 
        procedimento p ON cp.procedimento_id_procedimento = p.id_procedimento
    WHERE 
        o.especialidade = top_especialidade
    GROUP BY 
        p.nome_procedimento
    ORDER BY 
        total_procedimentos DESC
    LIMIT 1;
END 

-- Rodar a procedure
CALL especialidade_agendamento_ultimos_4_meses();

--------------------------------------------------------------------------------------------------------------------------------------


-- 2 - Qual é a melhor abordagem para implementar uma função que verifique eficientemente a existência de um agendamento ativo para um paciente específico, considerando a otimização de desempenho em um banco de dados relacional?

CREATE INDEX idx_agendamento_paciente_status
ON agendamento (paciente_id_paciente, status_agendamento); -- Otimizar queries que buscam agendamentos por paciente ou por status.

CREATE INDEX idx_pagamento_consulta_tipo_pagamento
ON pagamento (consulta_id_consulta, tipo_pagamento_id_tipo_pagamento); -- Otimizar queries que buscam pagamentos associados a consultas ou tipos de pagamentos específicos.

CREATE FUNCTION verifica_agendamento_ativo(
    paciente_id INT
) RETURNS BOOLEAN
BEGIN
    DECLARE count_agendamentos INT;

    SELECT COUNT(*) INTO count_agendamentos
    FROM agendamento
    WHERE paciente_id_paciente = paciente_id
    AND status_agendamento = 'Agendado';

    IF count_agendamentos > 0 THEN
        RETURN TRUE; -- Já existe um agendamento ativo para o paciente
    ELSE
        RETURN FALSE; -- Nenhum agendamento ativo para o paciente
    END IF;
END

-- Utilizando a função para verificar se há agendamentos ativos para o paciente
SELECT verifica_agendamento_ativo(id_paciente) AS tem_agendamento_ativo;


-----------------------------------------------------------------------------------------------------------------------------------------------

-- 3 - Como pode ser implementado um sistema para registrar as alterações de dados na tabela "pagamento", visando fins auditoriais e fiscais, que inclua não apenas os detalhes do pagamento, mas também o nome do usuário do banco responsável pela modificação?

-- Definição dos triggers para utilizar na tabela.

DROP TRIGGER IF EXISTS AfterInsertPagamento;
DROP TRIGGER IF EXISTS AfterUpdatePagamento;
DROP TRIGGER IF EXISTS AfterDeletePagamento;

-- Pra que isso possa ser alcançado, criamos uma tabela LogPagamento.

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

-----------------------------------------------------------------------------------------------------------------------------




-- 4 - Qual é o meio de pagamento mais utlizado, nos ultimos 6 meses, entre pacientes do sexo feminino na faixa etária de 18 a 55 anos, em ordem decrescente?

DROP IF EXISTS PROCEDURE RelatorioPagamentosPorGeneroIdade
-- Dropa a procedure, se existir.

CREATE PROCEDURE RelatorioPagamentosPorGeneroIdade()
BEGIN
    SELECT
        tp.descricao_tipo_pagamento AS meio_pagamento,
        COUNT(*) AS quantidade_uso
    FROM
        pagamento pg
        INNER JOIN consulta c ON pg.consulta_id_consulta = c.id_consulta
        INNER JOIN agendamento a ON c.agendamento_id_agendamento = a.id_agendamento
        INNER JOIN paciente p ON a.paciente_id_paciente = p.id_paciente
        INNER JOIN tipo_pagamento tp ON pg.tipo_pagamento_id_tipo_pagamento = tp.id_tipo_pagamento
    WHERE
        p.genero = 'F'
        AND TIMESTAMPDIFF(YEAR, p.data_nasc, CURDATE()) BETWEEN 18 AND 55
        AND pg.data_pagamento >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
    GROUP BY
        tp.descricao_tipo_pagamento
    ORDER BY
        quantidade_uso DESC;
END

CALL RelatorioPagamentosPorGeneroIdade();

-----------------------------------------------------------------------------------------

-- 5 - Qual o diagnóstico que teve a maior incidência em pacientes com idades superiores à 16 anos em ambos os gêneros durante os 6 primeiros meses do ano?

CREATE INDEX idx_paciente_data_nasc ON paciente (data_nasc); -- Melhora a performance de consultas que filtram ou ordenam pacientes por data de nascimento.
CREATE INDEX idx_consulta_data_hora ON consulta (data_hora); -- Útil para queries que filtram ou ordenam consultas por data e hora.
CREATE INDEX idx_agendamento_paciente ON agendamento (paciente_id_paciente); -- Útil para queries que precisam localizar agendamentos associados a um paciente específico.


DROP PROCEDURE IF EXISTS diagnostico_maior_incidencia_acima_16_anos  -- Dropar a procedure, se já existir.
-- Dropa a procedure, se existir.

CREATE PROCEDURE diagnostico_maior_incidencia_acima_16_anos()
BEGIN
    -- Variável para armazenar o diagnóstico com maior incidência
    DECLARE top_diagnostico VARCHAR(255);
    
    -- Selecionar o diagnóstico com maior incidência nos primeiros seis meses do ano
    SELECT 
        c.diagnostico
    INTO 
        top_diagnostico
    FROM 
        consulta c
    JOIN 
        agendamento a ON c.agendamento_id_agendamento = a.id_agendamento
    JOIN 
        paciente p ON a.paciente_id_paciente = p.id_paciente
    WHERE 
        TIMESTAMPDIFF(YEAR, p.data_nasc, CURDATE()) > 16
        AND c.data_hora BETWEEN '2024-01-01' AND '2024-06-30'
    GROUP BY 
        c.diagnostico
    ORDER BY 
        COUNT(*) DESC
    LIMIT 1;
    
    -- Exibir o resultado
    SELECT top_diagnostico AS Diagnostico_Maior_Incidencia_Acima_16_Anos;
    
END

CALL diagnostico_maior_incidencia_acima_16_anos();