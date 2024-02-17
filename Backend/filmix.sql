drop database if exists railway;
create database railway;
use railway;

CREATE TABLE tb_pais (
id_pais INT AUTO_INCREMENT PRIMARY KEY,
nom_pais VARCHAR(99)
);

CREATE TABLE tb_genero (
id_genero INT AUTO_INCREMENT PRIMARY KEY,
nom_gen VARCHAR(255)
);

CREATE TABLE tb_director (
id_director INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255),
fecha_nacimiento DATE,
id_pais int,
FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais)
);

CREATE TABLE tb_actor (
id_actor INT AUTO_INCREMENT PRIMARY KEY,
nom_actor VARCHAR(255)
);

CREATE TABLE tb_administrador (
id_admin INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
apellido VARCHAR(255) NOT NULL,
correo_electronico VARCHAR(255) UNIQUE NOT NULL,
contrasena VARCHAR(255) NOT NULL,
direccion VARCHAR(255) NOT NULL,
id_pais int,
FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais)
);

CREATE TABLE tb_pelicula (
id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(255),
descripcion VARCHAR(499),
anio INT,
duracion INT,
productora VARCHAR(255),
idioma VARCHAR(99),
trailer VARCHAR(400),
video VARCHAR(400),
imagen VARCHAR(255),
servidor VARCHAR(99),
id_genero INT,
id_director INT,
id_pais INT,
id_actor INT,
FOREIGN KEY (id_genero) REFERENCES tb_genero(id_genero),
FOREIGN KEY (id_director) REFERENCES tb_director(id_director),
FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais),
FOREIGN KEY (id_actor) REFERENCES tb_actor(id_actor)
);

CREATE TABLE tb_usuario (
id_usu INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255),
email VARCHAR(255) UNIQUE,
contrasena VARCHAR(255),
avatar VARCHAR(255)
);

CREATE TABLE tb_comentario (
id_comentario INT AUTO_INCREMENT PRIMARY KEY,
comentario VARCHAR(255),
id_usu INT,
id_pelicula INT,
FOREIGN KEY (id_usu) REFERENCES tb_usuario(id_usu),
FOREIGN KEY (id_pelicula) REFERENCES tb_pelicula(id_pelicula)
);

INSERT INTO tb_genero (nom_gen) VALUES
('Ação, Aventura, Comédia'),
('Drama, Ficção Científica, Terror'),
('Romance, Fantasia, Animação'),
('Documentário, Mistério, Crime'),
('História, Musical, Suspense'),
('Thriller, Guerra'),
('Biografia, Esporte'),
('Ação, Drama'),
('Comédia romântica'),
('Aventura, Fantasia, Animação');

INSERT INTO tb_pais (nom_pais) VALUES
('Estados Unidos'),('Canadá'),('Reino Unido'),('Alemanha'),('França'),('Japão'),('Austrália'),('Brasil'), ('China'),
('Índia'),('México'),('Itália'),('Espanha'),('Argentina'),('Rússia'),('Coreia do Sul'),('África do Sul'), ('Colômbia'),('Chile'),
('Egito'),('Peru'),('Canadá'),('Nova Zelândia'),('Holanda'),('Portugal'),('Suíça'),('Suécia'), ('Noruega'),('Grécia'),
('Irlanda'),('Singapura');

INSERT INTO tb_actor (nom_actor) VALUES
('John Smith, Alice Johnson, Michael Brown, Ava DuVernay'),
('Emily Davis, Robert Wilson'),
('Luis Pérez, Juan González, Lucas Rodríguez'),
('Julian Martínez, John Alex Johnson'),
('Tom Cruise, Nicole Kidman, Brad Pitt'),
('Jennifer Aniston, Matt LeBlanc, Courteney Cox'),
('Leonardo DiCaprio, Kate Winslet'),
('Meryl Streep, Denzel Washington, Julia Roberts'),
('Robert De Niro, Al Pacino, Joe Pesci'),
('Scarlett Johansson, Chris Evans, Mark Ruffalo');

INSERT INTO tb_director (nombre, fecha_nacimiento, id_pais) VALUES
('James Cameron', '1954-08-16', 1),
('Steven Spielberg', '1946-12-18', 2),
('Christopher Nolan', '1970-07-30', 3),
('Quentin Tarantino', '1963-03-27', 4),
('Martin Scorsese', '1942-11-17', 5),
('Ridley Scott', '1937-11-30', 6),
('Greta Gerwig', '1983-08-04', 7),
('Bong Joon-ho', '1969-09-14', 8),
('Pedro Almodóvar', '1949-09-25', 9),
('Denis Villeneuve', '1967-10-03', 10),
('Wes Anderson', '1969-05-01', 11),
('Jordan Peele', '1979-02-21', 12),
('Taika Waititi', '1975-08-16', 13),
('Patty Jenkins', '1971-07-24', 14),
('Chloé Zhao', '1982-03-31', 15),
('Ava DuVernay', '1972-08-24', 16),
('Gus Van Sant', '1952-07-24', 17),
('Spike Lee', '1957-03-20', 18),
('Alfonso Cuarón', '1961-11-28', 19),
('David Fincher', '1962-08-28', 20);

INSERT INTO tb_pelicula (titulo, descripcion, anio, duracion, productora, idioma, trailer, video, imagen, servidor, id_genero, id_director, id_pais, id_actor) VALUES
('Avengers: Endgame', 'Os super-heróis da Marvel se unem para enfrentar o vilão Thanos e restaurar o equilíbrio do universo.', 2019, 181, 'Marvel Studios', 'Español Latino', 'https://www.youtube.com/embed/znk2OICHbjY?si=_JGScI1F98kY03SY', 'https://mega.nz/embed/qzJnlASD#cjW2_YeEm7b4qhKApTYfGK5yyNxPv30L2nrGWkRRKig', 'https://i.ibb.co/ZcGRhZh/2428965.jpg', 'Mega', 1, 7, 6, 1),
('The Godfather', 'A história da família Corleone, uma das famílias do crime organizado mais poderosas de Nova York.', 1972, 175, 'Paramount Pictures', 'Español Latino', 'https://www.youtube.com/embed/gCVj1LeYnsc?si=u4JQeOX76WvvFGD8', 'https://mega.nz/embed/SrBggSiC#yjzO1aEQGTSyi-R6KjW8h4v3NT9WjSPoeUsJQs27lK8', 'b727f523-c253-45bb-bd13-40895c86c718_godfather.jpg', 'Mega', 3, 7, 11, 3),
('Forrest Gump', 'A vida de Forrest Gump, um homem com baixo QI, mas com grande influência nos acontecimentos históricos.', 1994, 142, 'Paramount Pictures', 'Español Latino', 'https://www.youtube.com/embed/Cyh1LpxnaxI?si=EzUViWQqCd_m8hzp', 'https://mega.nz/embed/f3QBCAoK#HjKG5fdwBbkC3csu-VQO4vgQ9EGF_GgllZHA58DtolA', '1bf8c44a-629b-468a-85de-c99f39f4f51f_gump.jpg', 'Mega', 2, 2, 2, 2),
('Dragon Ball Super: Broly', 'Goku e Vegeta encontram Broly, um guerreiro Saiyan. Mas como ele sobreviveu à destruição de seu planeta e onde esteve todo esse tempo?', 2018, 142, 'Toei Animation', 'Español Latino', 'https://www.youtube.com/embed/dl3w10VVQj8?si=5UjNygW-JUjiSpR-', 'https://archive.org/embed/dragon-ball-super-broly', '21398c95-fa93-40e4-94fc-e3098442f78b_broly.png', 'Archive.org', 1, 2, 2, 2),
('Diretamente de Lugar Nenhum: Scooby-Doo! Encontra Coragem', 'Scooby-Doo se une a Coragem, o Cão Covarde, em uma parceria inédita. Juntos, essa dupla canina tenta superar os medos e salvar o mundo de um exército de insetos.', 2021, 120, 'Warner Bros.', 'Español Latino', 'https://www.youtube.com/embed/5pBHLRTHBT8?si=I6SRgJxi3z_GlSpH', 'https://www.yourupload.com/embed/fFM22VKbVUN7', '00a84e48-bc58-4024-827f-aa3b47c784be_coraje.jpg', 'YourUpload', 4, 2, 3, 5),
('Destinos à Deriva', 'Grávida, sozinha e perdida no mar, uma mulher foge de um país totalitário. No entanto, ela acaba ficando presa em um contêiner que navega à deriva. Mesmo com medo, ela decide lutar pela sua vida e por seu bebê.', 2023, 140, 'Netflix Studios', 'Español Latino', 'https://www.youtube.com/embed/QNnsE06aBSU?si=MU6f3OLq6K_2Owu3', 'https://www.yourupload.com/embed/8842dsQ41Twp', '7a027725-66c1-480a-894f-1ed6bdde2f00_nowhere.jpg', 'YourUpload', 3, 4, 2, 5),
('Queima de Arquivo', 'Agente do governo especializado, John Kruger é encarregado de proteger uma testemunha-chave que sabe tudo sobre uma empresa de armas que pretende vender um fuzil revolucionário no mercado negro.', 1996 , 130, 'Hollywood', 'Español Latino', 'https://www.youtube.com/embed/cauMtxavBMU?si=9GLWYunrxnuJtFPl', 'https://www.yourupload.com/embed/KUIiD4n7euJQ', 'c7a8970f-bb2a-4c65-a559-bb3f74e2764d_protector.jpg', 'YourUpload', 4, 2, 1, 3),
('A Casa Amaldiçoada', 'Quando Eleanor, Theo e Luke decidem participar de um estudo sobre o sono em uma enorme mansão, recebem mais do que esperavam quando lhes contam o passado fantasmagórico da casa.', 1999, 130, 'DreamWorks', 'Español Latino', 'https://www.youtube.com/embed/J4fWI5J4bEU?si=q_gAIGc1n95yiaRJ', 'https://www.yourupload.com/embed/XRNvyuLnJQPm', 'bb3dc36b-8b45-45e7-a86f-1c943b7c795b_maldicion.jpg', 'YourUpload', 2, 3, 1, 4),
('A Fada do Dente', 'Violetta, uma fada atrevida e curiosa, acaba presa no mundo humano. Agora, a única maneira de encontrar o caminho de volta para casa é juntar-se a uma garota de 12 anos chamada Maxie.', 2022, 110, 'Seru animation', 'Español Latino', 'https://www.youtube.com/embed/duq3qAsyvfg?si=bHGSIjENv_acfdPZ', 'https://www.yourupload.com/embed/Qx0csdk72uwl', '0087875d-6b5d-46cf-b1d8-63997529c354_hada.jpg', 'YourUpload', 4, 3, 1, 4),
('Forças Especiais', 'A correspondente de guerra Elsa Cassanova é sequestrada pelo talibã e está prestes a ser executada. Numa das regiões mais hostis do mundo, uma batalha se inicia entre os raptores da jornalista e soldados que arriscam suas vidas para resgatá-la.', 2011, 140, 'Filmin', 'Español Latino', 'https://www.youtube.com/embed/hpaGKkroHP4?si=CUxxiBgVFc-aqLlV', 'https://www.yourupload.com/embed/rWx74i7ijR2C', '1ee26b7c-2fb9-47a8-9d9f-b9c3f8c26d27_fuerzas.jpg', 'YourUpload', 2, 3, 2, 4),
('Universidade Monstros', 'Mike e Sulley, alunos promissores da Universidade Monstros, são forçados a se unirem quando sua disputa acirrada pelo posto de aluno mais assustador da turma foge ao controle e eles acabam sendo expulsos da faculdade.', 2001, 220, 'Pixar, Walt Disney Pictures', 'Español Latino', 'https://www.youtube.com/embed/6-hRvF7suLM?si=2EsyiSWqW56emtzx', 'https://www.yourupload.com/embed/8i4xy3Myfu06', '5eab5e74-80f1-4143-bad8-01e161c34179_monsters.jpeg', 'YourUpload', 1, 4, 5, 2),
('Monstros S.A', 'A maior fábrica de monstros do mundo conta com James Sullivan, um dos monstros mais assustadores, que tem o pelo azul e chifres, além de seu assistente e melhor amigo Mike, um monstro verde de um olho só. Eles têm por missão assustar as crianças, que são consideradas tóxicas pelos monstros e cujo contato com eles seria catastrófico para seu mundo. Porém, ao visitar o mundo dos humanos a trabalho, Mike e Sully conhecem a garota Boo, que acaba sem querer indo parar no mundo dos monstros.', 2013, 220, 'Pixar, Walt Disney Pictures', 'Ingles', 'https://www.youtube.com/embed/uzkkh-1A_kY?si=lhC2uuv3AM0TpCWT', 'https://www.yourupload.com/embed/020UK3DC3Q6o', '26b2736e-64cb-46bf-8434-87877e066025_inc.jpg', 'YourUpload', 2, 3, 4, 2),
('Mickey e Seus Amigos: Gostosuras ou Travessuras', 'Mickey e seus amigos estão brincando de doces ou travessuras quando Donald avista a mansão mais assustadora que ele já viu e convence seus amigos a arriscar uma visita, mas o proprietário lança um feitiço que os transforma em suas fantasias.', 2023 , 21, 'Walt Disney Pictures', 'Español Latino', 'https://www.youtube.com/embed/uhjMD2-uj5c?si=AboeMz4Cdksh8lR8', 'https://www.yourupload.com/embed/02B663Gnh4EO', '4e1c0202-8f07-4372-9122-29b637b5a926_mickey.jpeg', 'Fireload', 1, 5, 3, 1),
('Missão: Impossível – Acerto De Contas', 'Ethan Hunt e sua equipe devem rastrear uma nova arma que pode ameaçar toda a humanidade se cair em mãos erradas. Com o destino do mundo em jogo, se inicia uma corrida mortal ao redor do globo.', 2023 , 190, 'Paramount Pictures', 'Español Latino', 'https://www.youtube.com/embed/3kM40dT0WdY?si=vwfAwLNTjHDku4YS', 'https://www.yourupload.com/embed/R70Xy2860cuc', 'cdd10b9a-730e-4bfd-945f-cf8ce0bdc896_mision.jpg', 'YourUpload', 6, 7, 4, 5),
('Subterrâneo', 'Maxime é um mineiro com um passado turbulento. Após uma explosão em uma de suas minas, ele encontra uma maneira de se redimir ao tentar salvar a vida de seus colegas.', 2023, 160, 'Bravo Charlie', 'Español Latino', 'https://www.youtube.com/embed/al-WDTq2WxA?si=eV43Z9C4Lb8LeITU', 'https://www.yourupload.com/embed/8L1q8rfpkLfd', 'd977246f-e815-4098-8832-176a66db5826_souterrain.jpg', 'YourUpload', 7, 6, 5, 6),
('Dragon Ball: Uma Aventura Mística', 'Goku e Kuririn treinam para um Torneio de Artes Marciais que acontecerá no país Mifan. O Imperador de Mifan, Chaos, tenta encontrar sua querida Lan Lan, que foi sequestrada.', 1988, 150, 'Toei Animation', 'Español Latino', 'https://www.youtube.com/embed/sHo-bEc1TFo?si=L-R_udyEZM6G4q3X', 'https://www.yourupload.com/embed/llHXJoWtq56H', '78a9ba34-4837-4df6-a399-e84449107d10_mistica.jpg', 'YourUpload', 5, 6, 6, 6),
('Patch Adams - O Amor É Contagioso', 'Patch Adams descobre que o humor e o carinho podem fazer maravilhas e ajudar a curar pessoas hospitalizadas, mas suas ideias entram em conflito com os defensores da medicina tradicional.', 1998, 190, 'Universal Studios', 'Español Latino', 'https://www.youtube.com/embed/BZuZGSme9_I?si=y76pEXskfTthGr_p', 'https://www.yourupload.com/embed/J24klnkxto61', '2387505e-ebc7-4448-a11c-811e682e8b5f_adams.jpg', 'YourUpload', 3, 6, 5, 6);

INSERT INTO tb_usuario (nombre, email, contrasena, avatar) VALUES
('Ana Maria Schmidt', 'ana@example.com', '$2a$10$8wY6MCWP6pJ3Cc820Fzsm.NgHUZHSIsgboQaXlPZqW5I3gRokMv9m', 'avatar1.jpg'), -- contrasena1
('André Silva dos Santos', 'andre@example.com', '$2a$10$45d0CKY1tlpcFKQLkyQSxOvHiGEiLqb02nUtUowrHDK52DKTVp5IO', 'avatar2.jpg'), -- contrasena2
('Sofia Dupont Martin', 'sofia@example.com', '$2a$10$8JA2iXF7mmucKLwsvHbxG.4.3pCjJCkIebiLHtpA5ZqWnqMoaJCvK', 'avatar3.jpg'), -- contrasena3
('Pedro Cardoso Souza', 'pedro@example.com', '$2a$10$1rc.LeWCOKIVMFkUTorBD.nsor1BMw4wrWmzFVCsXy.aSmCfYSdjG', 'avatar4.jpg'), -- contrasena4
('Helena Russo Ferrari', 'helena@example.com', '$2a$10$RwB9UtbBren7IYP5Wk/JnO98Ig0R.8xbFEO9j2odUrTlVhdZeFbr2', 'avatar5.jpg'); -- contrasena5

INSERT INTO tb_administrador(nombre, apellido, correo_electronico, contrasena, direccion, id_pais) VALUES ("Jhon", "Doe", "jhon@admin.com","$2a$10$opnwdk0e/kn8VKLkI9e94eNEevArCmPE5aYasdymQPoyEPa5Mfh92", "456 Pine St", 1); -- admin

/*
select * from tb_pais;
select * from tb_genero;
select * from tb_director;
select * from tb_actor;
select * from tb_usuario;
select * from tb_administrador;
select * from tb_pelicula;
*/