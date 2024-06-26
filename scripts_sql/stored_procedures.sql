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

--------------------------------------------------------------------------------------------

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

---------------------------------------------------------------------------------------


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

