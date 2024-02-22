/*
===============================================================================

Título: Exercício de Normalização de Banco de Dados:

Objetivo: Este exercício tem como objetivo praticar a normalização de um  banco 
de dados relacional em três etapas: 1º Forma  Normal  (1NF),  2º  Forma  Normal 
(2NF) e 3º Forma Normal (3NF).

Considere uma aplicação de gerenciamento de biblioteca. 
Você foi designado para projetar o banco de dados  que  armazenará  informações
sobre os livros e os autores. 
Inicialmente, você recebeu uma  única  tabela  chamada  livros  que  contém  as
seguintes informações:

===============================================================================
*/

CREATE TABLE livros (
    livro_id INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    genero VARCHAR(255),
    ano_publicacao INT
);

/*
===============================================================================

Parte 1: 1º Forma Normal (1NF)

O objetivo da 1º Forma Normal é garantir que cada  coluna  da  tabela  contenha
apenas valores atômicos, ou seja, valores indivisíveis. 
Para isso, você deve criar uma nova tabela  chamada  "autores"  que  armazenará 
informações sobre os autores dos livros.

Tabela Resultante da 1º Forma Normal (1NF):

===============================================================================
*/

CREATE TABLE autores (
    autor_id INT PRIMARY KEY,
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

CREATE TABLE livros (
    livro_id INT PRIMARY KEY,
    titulo VARCHAR(255),
    genero VARCHAR(255),
    ano_publicacao INT
);

/*
===============================================================================

Parte 2: 2º Forma Normal (2NF)

O objetivo da 2º Forma Normal é eliminar a dependência parcial dos atributos em
relação à chave primária.
Neste caso, a chave primária da tabela "livros"  é  "livro_id",  mas  a  coluna 
"autor" depende apenas parcialmente dessa chave.
Você deve criar uma nova tabela chamada  "livros_autores"  para  resolver  essa 
dependência parcial.

Tabelas Resultantes da 2º Forma Normal (2NF):

===============================================================================
*/

CREATE TABLE livros_autores (
    livro_id INT,
    autor_id INT,
    PRIMARY KEY (livro_id, autor_id),
    FOREIGN KEY (livro_id) REFERENCES livros(livro_id),
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id)
);

/*
===============================================================================

Parte 3: 3º Forma Normal (3NF)

O objetivo da 3º Forma Normal é eliminar a dependência transitiva dos atributos
em relação à chave primária.
Neste caso, a coluna "genero" depende da coluna "livro_id".
Você  deve  criar  uma  nova  tabela  chamada  "generos"  para  resolver   essa
dependência transitiva.

Tabelas Resultantes da 3º Forma Normal (3NF):

===============================================================================
*/

CREATE TABLE livros (
    livro_id INT PRIMARY KEY,
    titulo VARCHAR(255),
    ano_publicacao INT
);

CREATE TABLE autores (
    autor_id INT PRIMARY KEY,
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

CREATE TABLE generos (
    genero_id INT PRIMARY KEY,
    genero VARCHAR(255)
);

CREATE TABLE livros_autores (
    livro_id INT,
    autor_id INT,
    PRIMARY KEY (livro_id, autor_id),
    FOREIGN KEY (livro_id) REFERENCES livros(livro_id),
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id)
);

CREATE TABLE livros_generos (
    livro_id INT,
    genero_id INT,
    PRIMARY KEY (livro_id, genero_id),
    FOREIGN KEY (livro_id) REFERENCES livros(livro_id),
    FOREIGN KEY (genero_id) REFERENCES generos(genero_id)
);

/*
===============================================================================

Instruções:

1º - Execute os comandos SQL para criar as tabelas resultantes da 1º, 2º  e  3º
Forma Normal no seu banco de dados MySQL.

2º - Popule as tabelas com dados de exemplo  (livros,  autores,  gêneros)  para
testar a estrutura normalizada.

3º - Certifique-se de que cada tabela atende aos  requisitos  da  forma  normal
correspondente.

===============================================================================
*/

/*
===============================================================================

Título: Exercício de Normalização de Banco de Dados (Parte 2)

Objetivo: Este exercício tem como objetivo praticar a normalização de um  banco 
de dados relacional em três etapas: 1º Forma  Normal  (1NF),  2º  Forma  Normal 
(2NF) e 3º Forma Normal (3NF).

Descrição do Cenário:

Imagine um sistema de gerenciamento de estudantes e cursos em uma universidade.
Inicialmente, você recebeu uma  única  tabela  chamada "estudantes_cursos"  que
contém as seguintes informações:

===============================================================================
*/

CREATE TABLE estudantes_cursos (
    estudante_id INT PRIMARY KEY,
    nome_estudante VARCHAR(255),
    curso_id INT,
    nome_curso VARCHAR(255),
    professor VARCHAR(255),
    data_inscricao DATE
);

/*
===============================================================================

Parte 1: 1º Forma Normal (1NF)

O objetivo da 1º Forma Normal é garantir que cada  coluna  da  tabela  contenha
apenas valores atômicos, ou seja, valores indivisíveis.

Tabelas Resultantes da 1º Forma Normal (1NF):

===============================================================================
*/

-- Maria Luiza Passo Silva 2º DS manhã

CREATE TABLE estudantes(
    estudante_id INT PRIMARY KEY,
    nome_estudante VARCHAR(255),
    data_inscricao DATE
);

CREATE TABLE cursos(
    curso_id INT PRIMARY KEY,
    nome_curso VARCHAR(255),
    professor VARCHAR(255)
);

/*
===============================================================================

Parte 2: 2º Forma Normal (2NF)

O objetivo da 2º Forma Normal é eliminar a dependência parcial dos atributos em
relação à chave primária. Neste caso,  a  coluna  "nome_curso"  depende  apenas
parcialmente da chave primária.

Tabelas Resultantes da 2º Forma Normal (2NF):

===============================================================================
*/

CREATE TABLE estudantes_cursos(
    estudante_id INT,
    curso_id INT,
    PRIMARY KEY (estudante_id, curso_id),
    FOREIGN KEY (estudante_id) REFERENCES estudantes(estudante_id),
    FOREIGN KEY (curso_id) REFERENCES cursos(curso_id)
);

/*
===============================================================================

Parte 3: 3º Forma Normal (3NF)

O objetivo da 3º Forma Normal é eliminar a dependência transitiva dos atributos
em relação à chave primária.

Tabelas Resultantes da 3º Forma Normal (3NF):

===============================================================================
*/

CREATE TABLE estudantes(
    estudante_id INT PRIMARY KEY,
    nome_estudante VARCHAR(255),
    data_inscricao DATE
);

CREATE TABLE cursos(
    curso_id INT PRIMARY KEY,
    nome_curso VARCHAR(255),
    professor VARCHAR(255)
);

CREATE TABLE professores(
    professor_id INT PRIMARY KEY,
    nome_professor VARCHAR(255),
    data_contratacao DATE
);

CREATE TABLE estudantes_cursos(
    estudante_id INT,
    curso_id INT,
    PRIMARY KEY (estudante_id, curso_id),
    FOREIGN KEY (estudante_id) REFERENCES estudantes(estudante_id),
    FOREIGN KEY (curso_id) REFERENCES cursos(curso_id)
);

CREATE TABLE cursos_professores(
    curso_id INT,
    professor_id INT,
    PRIMARY KEY  (curso_id, professor_id),
    FOREIGN KEY (curos_id) REFERENCES cursos(curso_id),
    FOREIGN KEY (professor_id) REFERENCES professores(curso_id)
);

/*
===============================================================================

Instruções:

1º - Execute os comandos SQL para criar as tabelas resultantes da 1º, 2º  e  3º
Forma Normal no seu banco de dados MySQL.

2º - Popule as tabelas com dados de exemplo  (livros,  autores,  gêneros)  para
testar a estrutura normalizada.

3º - Certifique-se de que cada tabela atende aos  requisitos  da  forma  normal
correspondente.

===============================================================================
*/