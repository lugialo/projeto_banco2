create table log_pagamento
(
    id_log                           int auto_increment
        primary key,
    tipo_acao                        varchar(10)                         not null,
    id_pagamento                     int                                 not null,
    tipo_pagamento_id_tipo_pagamento int                                 null,
    valor_pago                       int                                 null,
    data_pagamento                   datetime                            null,
    DataHoraOperacao                 timestamp default CURRENT_TIMESTAMP null,
    ExecutedBy                       varchar(100)                        null
);

create table odontologista
(
    id_odontologista   int auto_increment
        primary key,
    nome_odontologista varchar(100) null,
    especialidade      varchar(100) null,
    cro                varchar(20)  null
);

create table paciente
(
    id_paciente   int auto_increment
        primary key,
    nome_paciente varchar(100) null,
    cpf_paciente  varchar(11)  null,
    telefone      varchar(15)  null,
    endereco      varchar(200) null,
    genero        char         null,
    data_nasc     date         null,
    email         varchar(100) null
);

create table agendamento
(
    id_agendamento                 int auto_increment
        primary key,
    data_agendamento               datetime     null,
    status_agendamento             varchar(100) null,
    paciente_id_paciente           int          not null,
    odontologista_id_odontologista int          not null,
    constraint fk_agendamento_odontologista1
        foreign key (odontologista_id_odontologista) references odontologista (id_odontologista),
    constraint fk_agendamento_paciente1
        foreign key (paciente_id_paciente) references paciente (id_paciente)
);

create table consulta
(
    id_consulta                int auto_increment
        primary key,
    data_hora                  datetime null,
    diagnostico                longtext null,
    tratamento                 longtext null,
    agendamento_id_agendamento int      not null,
    constraint fk_consulta_agendamento1
        foreign key (agendamento_id_agendamento) references agendamento (id_agendamento)
);

create table procedimento
(
    id_procedimento        int auto_increment
        primary key,
    nome_procedimento      varchar(100) null,
    descricao_procedimento varchar(100) null,
    procedimentocol        varchar(45)  null
);

create table consulta_procedimento
(
    id_consulta_procedimento     int auto_increment,
    consulta_id_consulta         int not null,
    procedimento_id_procedimento int not null,
    primary key (id_consulta_procedimento, consulta_id_consulta, procedimento_id_procedimento),
    constraint fk_consulta_procedimento_consulta1
        foreign key (consulta_id_consulta) references consulta (id_consulta),
    constraint fk_consulta_procedimento_procedimento1
        foreign key (procedimento_id_procedimento) references procedimento (id_procedimento)
);

create table tipo_pagamento
(
    id_tipo_pagamento        int auto_increment
        primary key,
    descricao_tipo_pagamento varchar(100) null
);

create table pagamento
(
    id_pagamento                     int auto_increment,
    valor_pago                       decimal(10, 2) null,
    data_pagamento                   datetime       null,
    tipo_pagamento_id_tipo_pagamento int            not null,
    consulta_id_consulta             int            not null,
    primary key (id_pagamento, tipo_pagamento_id_tipo_pagamento, consulta_id_consulta),
    constraint fk_pagamento_consulta1
        foreign key (consulta_id_consulta) references consulta (id_consulta),
    constraint fk_pagamento_tipo_pagamento
        foreign key (tipo_pagamento_id_tipo_pagamento) references tipo_pagamento (id_tipo_pagamento)
);