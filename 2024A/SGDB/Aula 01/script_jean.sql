/* 2. Criação de tabelas */

CREATE TABLE usuario (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100),
    situacao VARCHAR(1)
);

CREATE TABLE tipo (
    id INT PRIMARY KEY,
    descricao VARCHAR(100),
    situacao VARCHAR(1)
);

CREATE TABLE estado (
    id INT PRIMARY KEY,
    descricao VARCHAR(50)
);

CREATE TABLE cidade (
    id INT PRIMARY KEY,
    descricao VARCHAR(100),
    estado_id INT,
    FOREIGN KEY (estado_id) REFERENCES estado(id)
);

CREATE TABLE empresa (
    id INT PRIMARY KEY,
    nome VARCHAR(200),
    e_mail VARCHAR(100),
    telefone_um VARCHAR(20),
    telefone_dois VARCHAR(20),
    cnpj VARCHAR(20),
    data_ultimo_contato VARCHAR(20),
    fazer_novo_contato VARCHAR(1),
    situacao VARCHAR(1),
    cidade_id INT,
    FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

CREATE TABLE ocorrencias (
    id INT PRIMARY KEY,
    descricao VARCHAR(800),
    encaminhamento VARCHAR(800),
    data_hora VARCHAR(45),
    contato_pessoa VARCHAR(50),
    situacao VARCHAR(1),
    empresa_id INT,
    tipo_id INT,
    usuario_id INT,
    FOREIGN KEY (empresa_id) REFERENCES empresa(id),
    FOREIGN KEY (tipo_id) REFERENCES tipo(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

/* 3. Inserção de registros */

INSERT INTO
    estado (id, descricao)
VALUES
    (1, 'Rio Grande do Sul'),
    (2, 'Santa Catarina');

INSERT INTO
    cidade (id, descricao, estado_id)
VALUES
    (1, 'Lajeado', 1),
    (2, 'Estrela', 1),
    (3, 'Arroio do Meio', 1),
    (4, 'Santa Clara do Sul', 1),
    (5, 'Venâncio Aires', 1),
    (6, 'Porto Alegre', 1),
    (7, 'Florianópolis', 2),
    (8, 'Blumenau', 2),
    (9, 'Joinville', 2),
    (10, 'Palhoça', 2);

INSERT INTO
    usuario (id, nome, email, senha, situacao)
VALUES
    (1, 'Jean', 'jean@teste.br', 'teste12345', 'A'),
    (2, 'Pessoa 2', 'pessoa2@teste.br', '123', 'A'),
    (3, 'Pessoa 3', 'pessoa3@teste.br', '123', 'A');

INSERT INTO
    tipo (id, descricao, situacao)
VALUES
    (1, 'Reclamação', 'A'),
    (2, 'Sugestão', 'A'),
    (3, 'Elogio', 'A'),
    (4, 'Outros', 'A');

INSERT INTO 
    empresa (id, nome, e_mail, telefone_um, telefone_dois, cnpj, data_ultimo_contato, fazer_novo_contato, situacao, cidade_id)
VALUES
    (1, 'ac leo pellentesque ultrices mattis', 'dlober0@craigslist.org', '9136091487', '7314105676', '11964394000114', '8/1/2023', 'S', 'F', 10),
    (2, 'etiam vel augue', 'cgrubb1@yellowbook.com', '8894330429', '7831079845', '38607568000148', '2/5/2024', 'N', 'P', 3),
    (3, 'purus sit amet', 'nranson2@boston.com', '9157516236', '1467519609', '95129947000103', '7/12/2023', 'N', 'A', 3),
    (4, 'lorem ipsum dolor sit amet', 'sjenoure3@google.com.au', '9164464598', '9128049263', '30558507000126', '11/3/2023', 'S', 'P', 7),
    (5, 'eu felis fusce posuere', 'vwillimont4@artisteer.com', '8064036866', '5067743422', '86363172000145', '1/29/2024', 'N', 'F', 5),
    (6, 'scelerisque mauris sit amet eros', 'bsimonds5@nps.gov', '2128714684', '9338709121', '49874436000107', '3/2/2023', 'S', 'P', 4),
    (7, 'id justo sit', 'hcardwell6@cnn.com', '1474039566', '3391714422', '30900072000156', '11/26/2023', 'N', 'F', 8),
    (8, 'dictumst maecenas ut', 'psweetzer7@smh.com.au', '5867868687', '4528004509', '41252913000182', '8/1/2023', 'N', 'P', 10),
    (9, 'vel dapibus at diam nam', 'ydicarli8@blogs.com', '2247719573', '1482965137', '30213004000119', '7/1/2023', 'N', 'F', 1),
    (10, 'faucibus orci luctus', 'bceles9@theglobeandmail.com', '5048021992', '1282800374', '55061033000133', '12/17/2023', 'S', 'A', 1);

INSERT INTO 
    ocorrencias (id, descricao, encaminhamento, data_hora, contato_pessoa, situacao, empresa_id, tipo_id, usuario_id)
VALUES
    (1, 'ultrices mattis', 'posuere cubilia curae', '2023-05-17 06:39:20', 'Flory Derrick', 'F', 9, 1, 3),
    (2, 'quis orci eget orci', 'donec', '2024-02-27 23:39:18', 'Collin Rennels', 'P', 8, 1, 2),
    (3, 'sit amet', 'habitasse platea', '2023-04-04 10:09:28', 'Sascha Raye', 'A', 8, 1, 2),
    (4, 'lorem ipsum dolor sit amet', 'sed vestibulum sit', '2023-09-06 19:54:00', 'Kingston Bottrell', 'P', 4, 2, 2),
    (5, 'nunc vestibulum ante', 'duis aliquam', '2023-08-01 17:37:55', 'Alana Kondratenya', 'P', 3, 1, 3),
    (6, 'aenean fermentum donec', 'pretium', '2023-04-11 11:14:06', 'Sherwood Hartegan', 'F', 8, 1, 1),
    (7, 'in felis eu sapien', 'dolor', '2023-05-31 08:05:21', 'Dael Queyos', 'F', 10, 2, 1),
    (8, 'in', 'sed tristique in', '2023-06-02 02:49:13', 'Raphaela Goodbarr', 'A', 1, 1, 3),
    (9, 'pulvinar nulla pede ullamcorper', 'quisque erat eros', '2023-11-02 07:58:24', 'Shirlee McCullouch', 'A', 9, 1, 1),
    (10, 'erat quisque erat eros viverra', 'condimentum id', '2023-05-14 18:30:20', 'Cathleen Smallcombe', 'P', 9, 1, 2),
    (11, 'etiam', 'sed', '2023-05-06 13:02:11', 'Granthem Undrill', 'F', 1, 2, 3),
    (12, 'nulla ultrices', 'eros elementum', '2023-07-06 09:39:10', 'Danice Akers', 'P', 3, 2, 1),
    (13, 'suscipit nulla', 'ut dolor', '2023-05-20 21:52:05', 'Dolly Jossum', 'P', 10, 1, 1),
    (14, 'ligula pellentesque ultrices', 'a', '2023-03-23 12:55:26', 'Holly McAlarney', 'F', 1, 1, 2),
    (15, 'ligula suspendisse ornare', 'vel', '2023-05-29 16:51:50', 'Bobby Topp', 'P', 3, 1, 1),
    (16, 'arcu libero', 'metus', '2023-09-04 14:58:56', 'Fina Getcliffe', 'F', 9, 1, 2),
    (17, 'eu magna vulputate luctus', 'id', '2023-09-22 17:55:43', 'Lurette Frear', 'A', 1, 1, 1),
    (18, 'maecenas tincidunt lacus', 'libero', '2023-07-17 05:15:03', 'Corella Pattingson', 'P', 1, 1, 1),
    (19, 'platea dictumst', 'velit nec nisi', '2024-01-24 10:56:34', 'Nate Horsted', 'P', 8, 2, 1),
    (20, 'tincidunt', 'quis orci eget', '2023-09-16 21:35:37', 'Abe Medhurst', 'A', 9, 1, 1),
    (21, 'justo eu massa', 'ultrices', '2023-03-21 13:39:22', 'Jill McKniely', 'P', 10, 1, 1),
    (22, 'interdum', 'nascetur ridiculus mus', '2023-10-22 03:51:41', 'Dorotea Mealing', 'A', 2, 1, 1),
    (23, 'lacinia aenean sit amet', 'luctus', '2023-07-17 22:15:53', 'Arlan Bissatt', 'A', 9, 1, 1),
    (24, 'id', 'vivamus', '2023-06-28 11:02:45', 'Alexia Vousden', 'F', 8, 2, 2),
    (25, 'dolor quis', 'risus dapibus', '2023-03-02 16:35:12', 'Alys Olivazzi', 'F', 7, 2, 3),
    (26, 'risus dapibus', 'quis', '2024-02-19 22:02:40', 'Lela Moorey', 'F', 4, 1, 1),
    (27, 'ut volutpat sapien arcu', 'curae donec', '2023-11-17 19:23:59', 'Rhea Naismith', 'F', 3, 2, 2),
    (28, 'ac', 'quis orci eget', '2024-01-02 02:57:47', 'Ketti Dewberry', 'P', 2, 1, 2),
    (29, 'erat volutpat in congue', 'consequat lectus', '2023-07-23 10:57:25', 'Esma Headech', 'A', 2, 1, 1),
    (30, 'rutrum nulla tellus in sagittis', 'integer ac', '2024-02-28 09:44:15', 'Maurice Yersin', 'F', 5, 1, 2);

/* 4. Consultas */

/* 4. a) Listar as ocorrências da empresa com id = 1 */ 

SELECT *
    FROM ocorrencias
    WHERE empresa_id = 1;

/* 4. b) Listar a quantidade de ocorrências da empresa com id = 1 */

SELECT COUNT(*)
    FROM ocorrencias
    WHERE empresa_id = 1;

/* 4. c) Listar as ocorrências registradas pelo usuário com id = 1*/

SELECT *
    FROM ocorrencias
    WHERE usuario_id = 1;

/* 4. d) Listar as ocorrências do tipo id = 1*/

SELECT *
    FROM ocorrencias
    WHERE tipo_id = 1;

/* 4. e) Listar as ocorrências das empresas da cidade de id = 1 */

SELECT *
    FROM ocorrencias
    WHERE empresa_id IN (SELECT id FROM empresa WHERE cidade_id = 1);