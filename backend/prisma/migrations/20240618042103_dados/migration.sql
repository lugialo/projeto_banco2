-- CreateTable
CREATE TABLE `agendamento` (
    `id_agendamento` INTEGER NOT NULL AUTO_INCREMENT,
    `data_agendamento` DATETIME(0) NULL,
    `status_agendamento` VARCHAR(100) NULL,
    `paciente_id_paciente` INTEGER NOT NULL,
    `odontologista_id_odontologista` INTEGER NOT NULL,

    INDEX `fk_agendamento_odontologista1_idx`(`odontologista_id_odontologista`),
    INDEX `fk_agendamento_paciente1_idx`(`paciente_id_paciente`),
    PRIMARY KEY (`id_agendamento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `consulta` (
    `id_consulta` INTEGER NOT NULL AUTO_INCREMENT,
    `data_hora` DATETIME(0) NULL,
    `diagnostico` LONGTEXT NULL,
    `tratamento` LONGTEXT NULL,
    `agendamento_id_agendamento` INTEGER NOT NULL,

    INDEX `fk_consulta_agendamento1_idx`(`agendamento_id_agendamento`),
    PRIMARY KEY (`id_consulta`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `consulta_procedimento` (
    `id_consulta_procedimento` INTEGER NOT NULL AUTO_INCREMENT,
    `consulta_id_consulta` INTEGER NOT NULL,
    `procedimento_id_procedimento` INTEGER NOT NULL,

    INDEX `fk_consulta_procedimento_consulta1_idx`(`consulta_id_consulta`),
    INDEX `fk_consulta_procedimento_procedimento1_idx`(`procedimento_id_procedimento`),
    PRIMARY KEY (`id_consulta_procedimento`, `consulta_id_consulta`, `procedimento_id_procedimento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `odontologista` (
    `id_odontologista` INTEGER NOT NULL AUTO_INCREMENT,
    `nome_odontologista` VARCHAR(100) NULL,
    `especialidade` VARCHAR(100) NULL,
    `cro` VARCHAR(20) NULL,

    PRIMARY KEY (`id_odontologista`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `paciente` (
    `id_paciente` INTEGER NOT NULL AUTO_INCREMENT,
    `nome_paciente` VARCHAR(100) NULL,
    `cpf_paciente` VARCHAR(11) NULL,
    `telefone` VARCHAR(15) NULL,
    `endereco` VARCHAR(200) NULL,
    `genero` CHAR(1) NULL,
    `data_nasc` DATE NULL,
    `email` VARCHAR(100) NULL,

    PRIMARY KEY (`id_paciente`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pagamento` (
    `id_pagamento` INTEGER NOT NULL AUTO_INCREMENT,
    `valor_pago` DECIMAL(10, 2) NULL,
    `data_pagamento` DATETIME(0) NULL,
    `tipo_pagamento_id_tipo_pagamento` INTEGER NOT NULL,
    `consulta_id_consulta` INTEGER NOT NULL,

    INDEX `fk_pagamento_consulta1_idx`(`consulta_id_consulta`),
    INDEX `fk_pagamento_tipo_pagamento_idx`(`tipo_pagamento_id_tipo_pagamento`),
    PRIMARY KEY (`id_pagamento`, `tipo_pagamento_id_tipo_pagamento`, `consulta_id_consulta`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `procedimento` (
    `id_procedimento` INTEGER NOT NULL AUTO_INCREMENT,
    `nome_procedimento` VARCHAR(100) NULL,
    `descricao_procedimento` VARCHAR(100) NULL,
    `procedimentocol` VARCHAR(45) NULL,

    PRIMARY KEY (`id_procedimento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tipo_pagamento` (
    `id_tipo_pagamento` INTEGER NOT NULL AUTO_INCREMENT,
    `descricao_tipo_pagamento` VARCHAR(100) NULL,

    PRIMARY KEY (`id_tipo_pagamento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `agendamento` ADD CONSTRAINT `fk_agendamento_odontologista1` FOREIGN KEY (`odontologista_id_odontologista`) REFERENCES `odontologista`(`id_odontologista`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `agendamento` ADD CONSTRAINT `fk_agendamento_paciente1` FOREIGN KEY (`paciente_id_paciente`) REFERENCES `paciente`(`id_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `consulta` ADD CONSTRAINT `fk_consulta_agendamento1` FOREIGN KEY (`agendamento_id_agendamento`) REFERENCES `agendamento`(`id_agendamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `consulta_procedimento` ADD CONSTRAINT `fk_consulta_procedimento_consulta1` FOREIGN KEY (`consulta_id_consulta`) REFERENCES `consulta`(`id_consulta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `consulta_procedimento` ADD CONSTRAINT `fk_consulta_procedimento_procedimento1` FOREIGN KEY (`procedimento_id_procedimento`) REFERENCES `procedimento`(`id_procedimento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `pagamento` ADD CONSTRAINT `fk_pagamento_consulta1` FOREIGN KEY (`consulta_id_consulta`) REFERENCES `consulta`(`id_consulta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `pagamento` ADD CONSTRAINT `fk_pagamento_tipo_pagamento` FOREIGN KEY (`tipo_pagamento_id_tipo_pagamento`) REFERENCES `tipo_pagamento`(`id_tipo_pagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;
