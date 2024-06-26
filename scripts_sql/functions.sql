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