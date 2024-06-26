CREATE INDEX idx_agendamento_data ON agendamento (data_agendamento); -- filtrar agendamento pela coluna data_agendamento

CREATE INDEX idx_consulta_agendamento ON consulta (agendamento_id_agendamento); -- unir consulta e agendamento

CREATE INDEX idx_odontologista_especialidade ON odontologista (especialidade); -- necessário para melhorar o desempenho do filtro por especialidade

CREATE INDEX idx_procedimento_nome ON procedimento (nome_procedimento); -- necessário para melhorar o desempenho da agregação por nome_procedimento

CREATE INDEX idx_agendamento_paciente_status
ON agendamento (paciente_id_paciente, status_agendamento); -- Otimizar queries que buscam agendamentos por paciente ou por status.

CREATE INDEX idx_pagamento_consulta_tipo_pagamento
ON pagamento (consulta_id_consulta, tipo_pagamento_id_tipo_pagamento); -- Otimizar queries que buscam pagamentos associados a consultas ou tipos de pagamentos específicos.

CREATE INDEX idx_paciente_data_nasc ON paciente (data_nasc); -- Melhora a performance de consultas que filtram ou ordenam pacientes por data de nascimento.

CREATE INDEX idx_consulta_data_hora ON consulta (data_hora); -- Útil para queries que filtram ou ordenam consultas por data e hora.

CREATE INDEX fk_agendamento_odontologista1_id on agendamento (odontologista_id_odontologista); -- Acelera as consultas que buscam todos os agendamentos por um odontologista específico.

CREATE INDEX fk_agendamento_paciente1_idx ON agendamento (paciente_id_paciente); -- Acelera as consultas que buscam todos os agendamentos por um paciente específico.

CREATE INDEX fk_consulta_agendamento1_idx ON consulta (agendamento_id_agendamento); -- Acelera as queries que buscam por um agendamento específico.

CREATE INDEX fk_consulta_procedimento_consulta1_idx ON consulta_procedimento (consulta_id_consulta); -- Acelera as consultas que buscam todos os procedimentos associados a uma consulta específica.

CREATE INDEX fk_consulta_procedimento_procedimento1_idx ON consulta_procedimento (procedimento_id_procedimento); -- Acelera as consultas que buscam todos os procedimentos associados a um procedimento específico.

CREATE INDEX fk_pagamento_consulta1_idx ON pagamento (consulta_id_consulta); -- Acelera as consultas que buscam todos os pagamentos associados a uma consulta específica.

CREATE INDEX fk_pagamento_tipo_pagamento1_idx ON pagamento (tipo_pagamento_idtipo_pagamento); -- Acelera as consultas que buscam todos os pagamentos associados a um tipo de pagamento específico.