INSERT INTO paciente (idpaciente, nome, cpf, telefone, endereco, genero, dataNasc) VALUES
(1, 'Alice Silva', '123.456.789-00', '(11) 1111-1111', 'Rua A, 123', 'F', '1990-01-01'),
(2, 'Bruno Souza', '123.456.789-01', '(11) 1111-1112', 'Rua B, 234', 'M', '1991-02-01'),
(3, 'Carlos Lima', '123.456.789-02', '(11) 1111-1113', 'Rua C, 345', 'M', '1992-03-01'),
(4, 'Daniela Alves', '123.456.789-03', '(11) 1111-1114', 'Rua D, 456', 'F', '1993-04-01'),
(5, 'Eduardo Pereira', '123.456.789-04', '(11) 1111-1115', 'Rua E, 567', 'M', '1994-05-01'),
(6, 'Fernanda Costa', '123.456.789-05', '(11) 1111-1116', 'Rua F, 678', 'F', '1995-06-01'),
(7, 'Gustavo Martins', '123.456.789-06', '(11) 1111-1117', 'Rua G, 789', 'M', '1996-07-01'),
(8, 'Helena Rocha', '123.456.789-07', '(11) 1111-1118', 'Rua H, 890', 'F', '1997-08-01'),
(9, 'Igor Ribeiro', '123.456.789-08', '(11) 1111-1119', 'Rua I, 901', 'M', '1998-09-01'),
(10, 'Juliana Fernandes', '123.456.789-09', '(11) 1111-1120', 'Rua J, 012', 'F', '1999-10-01');

INSERT INTO procedimento (id_procedimento, nome_procedimento, descricao_procedimento, custo_procedimento) VALUES
(1, 'Limpeza', 'Limpeza dentária completa', 100),
(2, 'Extração', 'Extração de dente', 200),
(3, 'Canal', 'Tratamento de canal', 500),
(4, 'Clareamento', 'Clareamento dental', 300),
(5, 'Implante', 'Implante dentário', 1500),
(6, 'Ortodontia', 'Aparelho ortodôntico', 1000),
(7, 'Prótese', 'Prótese dentária', 1200),
(8, 'Restauração', 'Restauração dentária', 250),
(9, 'Consulta inicial', 'Consulta de avaliação', 150),
(10, 'Raio-X', 'Exame de Raio-X', 80);

INSERT INTO odontologistas (id_odontologistas, nome_odontologista, especialidade, numero_contato, endereco) VALUES
(1, 'Dr. Pedro', 'Ortodontia', '(11) 2222-2221', 'Avenida X, 123'),
(2, 'Dr. Ana', 'Implantes', '(11) 2222-2222', 'Avenida X, 124'),
(3, 'Dr. Luiz', 'Cirurgia', '(11) 2222-2223', 'Avenida X, 125'),
(4, 'Dra. Carla', 'Estética', '(11) 2222-2224', 'Avenida X, 126'),
(5, 'Dr. Marcos', 'Prótese', '(11) 2222-2225', 'Avenida X, 127'),
(6, 'Dra. Fernanda', 'Clínico Geral', '(11) 2222-2226', 'Avenida X, 128'),
(7, 'Dr. Ricardo', 'Endodontia', '(11) 2222-2227', 'Avenida X, 129'),
(8, 'Dra. Julia', 'Pediatria', '(11) 2222-2228', 'Avenida X, 130'),
(9, 'Dr. Felipe', 'Periodontia', '(11) 2222-2229', 'Avenida X, 131'),
(10, 'Dra. Sofia', 'Radiologia', '(11) 2222-2230', 'Avenida X, 132');

INSERT INTO agendamento (idagendamento, data_agendamento, status_agendamento, id_paciente) VALUES
(1, '2024-06-15 09:00:00', 'A', 1),
(2, '2024-06-15 10:00:00', 'A', 2),
(3, '2024-06-15 11:00:00', 'A', 3),
(4, '2024-06-15 12:00:00', 'A', 4),
(5, '2024-06-15 13:00:00', 'A', 5),
(6, '2024-06-15 14:00:00', 'A', 6),
(7, '2024-06-15 15:00:00', 'A', 7),
(8, '2024-06-15 16:00:00', 'A', 8),
(9, '2024-06-15 17:00:00', 'A', 9),
(10, '2024-06-15 18:00:00', 'A', 10);

INSERT INTO consulta (idconsulta, data_hora, idpaciente, idortodontista, idprocedimento) VALUES
(1, '2024-06-15 09:00:00', 1, 1, 1),
(2, '2024-06-15 10:00:00', 2, 2, 2),
(3, '2024-06-15 11:00:00', 3, 3, 3),
(4, '2024-06-15 12:00:00', 4, 4, 4),
(5, '2024-06-15 13:00:00', 5, 5, 5),
(6, '2024-06-15 14:00:00', 6, 6, 6),
(7, '2024-06-15 15:00:00', 7, 7, 7),
(8, '2024-06-15 16:00:00', 8, 8, 8),
(9, '2024-06-15 17:00:00', 9, 9, 9),
(10, '2024-06-15 18:00:00', 10, 10, 10);

INSERT INTO tipo_pagamento (idtipo_pagamento, tipo_pagamento) VALUES
(1, 'Cartão de Crédito'),
(2, 'Cartão de Débito'),
(3, 'Dinheiro'),
(4, 'Boleto');

INSERT INTO pagamento (idpagamento, valor_pago, data_pagamento, idpaciente, id_tipo_pagamento, id_consulta) VALUES
(1, 100, '2024-06-15 09:30:00', 1, 1, 1),
(2, 200, '2024-06-15 10:30:00', 2, 2, 2),
(3, 500, '2024-06-15 11:30:00', 3, 3, 3),
(4, 300, '2024-06-15 12:30:00', 4, 4, 4),
(5, 1500, '2024-06-15 13:30:00', 5, 1, 5),
(6, 1000, '2024-06-15 14:30:00', 6, 2, 6),
(7, 1200, '2024-06-15 15:30:00', 7, 3, 7),
(8, 250, '2024-06-15 16:30:00', 8, 4, 8),
(9, 150, '2024-06-15 17:30:00', 9, 1, 9),
(10, 80, '2024-06-15 18:30:00', 10, 2, 10);
