INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, telefone, endereco, genero, data_nasc) VALUES
(1, 'Alice Silva', '12345678900', '(11) 1111-1111', 'Rua A, 123', 'F', '1990-01-01'),
(2, 'Bruno Souza', '12345678901', '(11) 1111-1112', 'Rua B, 234', 'M', '1991-02-01'),
(3, 'Carlos Lima', '12345678902', '(11) 1111-1113', 'Rua C, 345', 'M', '1992-03-01'),
(4, 'Daniela Alves', '12345678903', '(11) 1111-1114', 'Rua D, 456', 'F', '1993-04-01'),
(5, 'Eduardo Pereira', '12345678904', '(11) 1111-1115', 'Rua E, 567', 'M', '1994-05-01'),
(6, 'Fernanda Costa', '12345678905', '(11) 1111-1116', 'Rua F, 678', 'F', '1995-06-01'),
(7, 'Gustavo Martins', '12345678906', '(11) 1111-1117', 'Rua G, 789', 'M', '1996-07-01'),
(8, 'Helena Rocha', '12345678907', '(11) 1111-1118', 'Rua H, 890', 'F', '1997-08-01'),
(9, 'Igor Ribeiro', '12345678908', '(11) 1111-1119', 'Rua I, 901', 'M', '1998-09-01'),
(10, 'Juliana Fernandes', '12345678909', '(11) 1111-1120', 'Rua J, 012', 'F', '1999-10-01');

INSERT INTO procedimento (id_procedimento, nome_procedimento, descricao_procedimento) VALUES
(1, 'Limpeza', 'Limpeza dentária completa'),
(2, 'Extração', 'Extração de dente'),
(3, 'Canal', 'Tratamento de canal'),
(4, 'Clareamento', 'Clareamento dental'),
(5, 'Implante', 'Implante dentário'),
(6, 'Ortodontia', 'Aparelho ortodôntico'),
(7, 'Prótese', 'Prótese dentária'),
(8, 'Restauração', 'Restauração dentária'),
(9, 'Consulta inicial', 'Consulta de avaliação'),
(10, 'Raio-X', 'Exame de Raio-X');

INSERT INTO odontologista (id_odontologista, nome_odontologista, especialidade, cro) VALUES
(1, 'Dr. Pedro', 'Ortodontia', 'CRO-12345'),
(2, 'Dr. Ana', 'Implantes', 'CRO-12346'),
(3, 'Dr. Luiz', 'Cirurgia', 'CRO-12347'),
(4, 'Dra. Carla', 'Estética', 'CRO-12348'),
(5, 'Dr. Marcos', 'Prótese', 'CRO-12349'),
(6, 'Dra. Fernanda', 'Clínico Geral', 'CRO-12350'),
(7, 'Dr. Ricardo', 'Endodontia', 'CRO-12351'),
(8, 'Dra. Julia', 'Pediatria', 'CRO-12352'),
(9, 'Dr. Felipe', 'Periodontia', 'CRO-12353'),
(10, 'Dra. Sofia', 'Radiologia', 'CRO-12354');

INSERT INTO agendamento (id_agendamento, data_agendamento, status_agendamento, paciente_id_paciente, odontologista_id_odontologista) VALUES
(1, '2024-06-15 09:00:00', 'Agendado', 1, 1),
(2, '2024-06-15 10:00:00', 'Agendado', 2, 2),
(3, '2024-06-15 11:00:00', 'Agendado', 3, 3),
(4, '2024-06-15 12:00:00', 'Agendado', 4, 4),
(5, '2024-06-15 13:00:00', 'Agendado', 5, 5),
(6, '2024-06-15 14:00:00', 'Agendado', 6, 6),
(7, '2024-06-15 15:00:00', 'Agendado', 7, 7),
(8, '2024-06-15 16:00:00', 'Agendado', 8, 8),
(9, '2024-06-15 17:00:00', 'Agendado', 9, 9),
(10, '2024-06-15 18:00:00', 'Agendado', 10, 10);

INSERT INTO consulta (id_consulta, data_hora, diagnostico, tratamento, agendamento_id_agendamento) VALUES
(1, '2024-06-15 09:00:00', 'Cárie detectada', 'Tratamento de restauração', 1),
(2, '2024-06-15 10:00:00', 'Necessidade de extração', 'Extração do dente afetado', 2),
(3, '2024-06-15 11:00:00', 'Canal necessário', 'Início do tratamento de canal', 3),
(4, '2024-06-15 12:00:00', 'Manchas nos dentes', 'Clareamento dentário', 4),
(5, '2024-06-15 13:00:00', 'Dente ausente', 'Colocação de implante', 5),
(6, '2024-06-15 14:00:00', 'Aparelho necessário', 'Colocação de aparelho ortodôntico', 6),
(7, '2024-06-15 15:00:00', 'Necessidade de prótese', 'Confecção de prótese dentária', 7),
(8, '2024-06-15 16:00:00', 'Restauração danificada', 'Restauração do dente', 8),
(9, '2024-06-15 17:00:00', 'Primeira consulta', 'Avaliação inicial', 9),
(10, '2024-06-15 18:00:00', 'Checar dente', 'Exame de Raio-X', 10);

INSERT INTO tipo_pagamento (id_tipo_pagamento, descricao_tipo_pagamento) VALUES
(1, 'Cartão de Crédito'),
(2, 'Cartão de Débito'),
(3, 'Dinheiro'),
(4, 'Boleto');

INSERT INTO pagamento (id_pagamento, valor_pago, data_pagamento, tipo_pagamento_id_tipo_pagamento, consulta_id_consulta) VALUES
(1, 100.00, '2024-06-15 09:30:00', 1, 1),
(2, 200.00, '2024-06-15 10:30:00', 2, 2),
(3, 500.00, '2024-06-15 11:30:00', 3, 3),
(4, 300.00, '2024-06-15 12:30:00', 4, 4),
(5, 1500.00, '2024-06-15 13:30:00', 1, 5),
(6, 1000.00, '2024-06-15 14:30:00', 2, 6),
(7, 1200.00, '2024-06-15 15:30:00', 3, 7),
(8, 250.00, '2024-06-15 16:30:00', 4, 8),
(9, 150.00, '2024-06-15 17:30:00', 1, 9),
(10, 80.00, '2024-06-15 18:30:00', 2, 10);

