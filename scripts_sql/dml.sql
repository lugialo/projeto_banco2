INSERT INTO paciente (nome_paciente, cpf_paciente, telefone, endereco, genero, data_nasc) VALUES
('Alice Silva', '12345678900', '(11) 1111-1111', 'Rua A, 123', 'F', '1990-01-01'),
('Bruno Souza', '12345678901', '(11) 1111-1112', 'Rua B, 234', 'M', '1991-02-01'),
('Carlos Lima', '12345678902', '(11) 1111-1113', 'Rua C, 345', 'M', '1992-03-01'),
('Daniela Alves', '12345678903', '(11) 1111-1114', 'Rua D, 456', 'F', '1993-04-01'),
('Eduardo Pereira', '12345678904', '(11) 1111-1115', 'Rua E, 567', 'M', '1994-05-01'),
('Fernanda Costa', '12345678905', '(11) 1111-1116', 'Rua F, 678', 'F', '1995-06-01'),
('Gustavo Martins', '12345678906', '(11) 1111-1117', 'Rua G, 789', 'M', '1996-07-01'),
('Helena Rocha', '12345678907', '(11) 1111-1118', 'Rua H, 890', 'F', '1997-08-01'),
('Igor Ribeiro', '12345678908', '(11) 1111-1119', 'Rua I, 901', 'M', '1998-09-01'),
('Juliana Fernandes', '12345678909', '(11) 1111-1120', 'Rua J, 012', 'F', '1999-10-01');

INSERT INTO procedimento (nome_procedimento, descricao_procedimento) VALUES
('Limpeza', 'Limpeza dentária completa'),
('Extração', 'Extração de dente'),
('Canal', 'Tratamento de canal'),
('Clareamento', 'Clareamento dental'),
('Implante', 'Implante dentário'),
('Ortodontia', 'Aparelho ortodôntico'),
('Prótese', 'Prótese dentária'),
('Restauração', 'Restauração dentária'),
('Consulta inicial', 'Consulta de avaliação'),
('Raio-X', 'Exame de Raio-X');

INSERT INTO odontologista (nome_odontologista, especialidade, cro) VALUES
('Dr. Pedro', 'Ortodontia', 'CRO-12345'),
('Dr. Ana', 'Implantes', 'CRO-12346'),
('Dr. Luiz', 'Cirurgia', 'CRO-12347'),
('Dra. Carla', 'Estética', 'CRO-12348'),
('Dr. Marcos', 'Prótese', 'CRO-12349'),
('Dra. Fernanda', 'Clínico Geral', 'CRO-12350'),
('Dr. Ricardo', 'Endodontia', 'CRO-12351'),
('Dra. Julia', 'Pediatria', 'CRO-12352'),
('Dr. Felipe', 'Periodontia', 'CRO-12353'),
('Dra. Sofia', 'Radiologia', 'CRO-12354');

INSERT INTO agendamento (data_agendamento, status_agendamento, paciente_id_paciente, odontologista_id_odontologista) VALUES
('2024-06-15 09:00:00', 'Agendado', 1, 1),
('2024-06-15 10:00:00', 'Agendado', 2, 2),
('2024-06-15 11:00:00', 'Agendado', 3, 3),
('2024-06-15 12:00:00', 'Agendado', 4, 4),
('2024-06-15 13:00:00', 'Agendado', 5, 5),
('2024-06-15 14:00:00', 'Agendado', 6, 6),
('2024-06-15 15:00:00', 'Agendado', 7, 7),
('2024-06-15 16:00:00', 'Agendado', 8, 8),
('2024-06-15 17:00:00', 'Agendado', 9, 9),
('2024-06-15 18:00:00', 'Agendado', 10, 10);

INSERT INTO consulta (data_hora, diagnostico, tratamento, agendamento_id_agendamento) VALUES
('2024-06-15 09:00:00', 'Cárie detectada', 'Tratamento de restauração', 1),
('2024-06-15 10:00:00', 'Necessidade de extração', 'Extração do dente afetado', 2),
('2024-06-15 11:00:00', 'Canal necessário', 'Início do tratamento de canal', 3),
('2024-06-15 12:00:00', 'Manchas nos dentes', 'Clareamento dentário', 4),
('2024-06-15 13:00:00', 'Dente ausente', 'Colocação de implante', 5),
('2024-06-15 14:00:00', 'Aparelho necessário', 'Colocação de aparelho ortodôntico', 6),
('2024-06-15 15:00:00', 'Necessidade de prótese', 'Confecção de prótese dentária', 7),
('2024-06-15 16:00:00', 'Restauração danificada', 'Restauração do dente', 8),
('2024-06-15 17:00:00', 'Primeira consulta', 'Avaliação inicial', 9),
('2024-06-15 18:00:00', 'Checar dente', 'Exame de Raio-X', 10);

INSERT INTO tipo_pagamento (descricao_tipo_pagamento) VALUES
('Cartão de Crédito'),
('Cartão de Débito'),
('Dinheiro'),
('Boleto');

INSERT INTO pagamento (valor_pago, data_pagamento, tipo_pagamento_id_tipo_pagamento, consulta_id_consulta) VALUES
(100.00, '2024-06-15 09:30:00', 1, 1),
(200.00, '2024-06-15 10:30:00', 2, 2),
(500.00, '2024-06-15 11:30:00', 3, 3),
(300.00, '2024-06-15 12:30:00', 4, 4),
(1500.00, '2024-06-15 13:30:00', 1, 5),
(1000.00, '2024-06-15 14:30:00', 2, 6),
(1200.00, '2024-06-15 15:30:00', 3, 7),
(250.00, '2024-06-15 16:30:00', 4, 8),
(150.00, '2024-06-15 17:30:00', 1, 9),
(80.00, '2024-06-15 18:30:00', 2, 10);

INSERT INTO consulta_procedimento (consulta_id_consulta, procedimento_id_procedimento) VALUES
(1, 8),  -- Tratamento de restauração -> Restauração
(2, 2),  -- Extração do dente afetado -> Extração
(3, 3),  -- Início do tratamento de canal -> Canal
(4, 4),  -- Clareamento dentário -> Clareamento
(5, 5),  -- Colocação de implante -> Implante
(6, 6),  -- Colocação de aparelho ortodôntico -> Ortodontia
(7, 7),  -- Confecção de prótese dentária -> Prótese
(8, 8),  -- Restauração do dente -> Restauração
(9, 9),  -- Avaliação inicial -> Consulta inicial
(10, 10);  -- Exame de Raio-X -> Raio-X


