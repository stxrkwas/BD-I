-- Paciente:

CREATE TABLE paciente (
  numero_paciente INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  data_nasc DATE NOT NULL,
  sexo CHAR(1) NOT NULL,
  numero_convenio INT NOT NULL,
  estado_civil VARCHAR(255) NOT NULL,
  rg VARCHAR(255) NOT NULL,
  tel_id INT NOT NULL,  
  end_id INT NOT NULL,
  PRIMARY KEY (numero_paciente),
  FOREIGN KEY (numero_convenio) REFERENCES convenio (numero_convenio),
  FOREIGN KEY (tel_id) REFERENCES telefone (tel_id),
  FOREIGN KEY (end_id) REFERENCES endereco (end_id)  
);

-- Telefone:

CREATE TABLE telefone (
  tel_id INT NOT NULL AUTO_INCREMENT,
  tipo_tel VARCHAR(255) NOT NULL,
  telefone VARCHAR(255) NOT NULL,
  PRIMARY KEY (tel_id)
);

-- Endereço:

CREATE TABLE endereco (
  end_id INT NOT NULL AUTO_INCREMENT,
  endereco VARCHAR(255) NOT NULL,
  tipo_endereco VARCHAR(255) NOT NULL,
  PRIMARY KEY (end_id)
);

-- Convenio:

CREATE TABLE convenio (
  numero_convenio INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  tipo_convenio VARCHAR(255) NOT NULL,
  cobertura VARCHAR(255) NOT NULL,
  precos VARCHAR(255) NOT NULL,
  PRIMARY KEY (numero_convenio)
);

-- Consultas:

CREATE TABLE consultas (
  numero_consulta INT NOT NULL AUTO_INCREMENT,
  data_con DATE NOT NULL,
  numero_medico INT NOT NULL,
  diagnostico VARCHAR(255) NOT NULL,
  PRIMARY KEY (numero_consulta),
  FOREIGN KEY (numero_medico) REFERENCES medico (numero_medico)
);

-- Exames:

CREATE TABLE exames (
  numero_consulta INT NOT NULL,
  exame VARCHAR(255) NOT NULL,
  data_exame DATE NOT NULL,
  resultados VARCHAR(255) NOT NULL,
  FOREIGN KEY (numero_consulta) REFERENCES consultas (numero_consulta)
);

-- Medico: 

CREATE TABLE medico (
  numero_medico INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  numero_registro VARCHAR(255) NOT NULL,
  especialidadeo VARCHAR(255) NOT NULL,
  PRIMARY KEY (numero_medico)
);
