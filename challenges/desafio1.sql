DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE IF NOT EXISTS SpotifyClone.planos (
  plano_id INT AUTO_INCREMENT PRIMARY KEY,
  nome_plano VARCHAR(45) NOT NULL,
  valor DECIMAL(3,2) NOT NULL);

CREATE TABLE IF NOT EXISTS SpotifyClone.pessoas_usuarias (
  pessoa_usuaria_id INT AUTO_INCREMENT PRIMARY KEY,
  nome_pessoa_usuaria VARCHAR(45) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  data_assinatura DATE NOT NULL,
  CONSTRAINT fk_idx_plano_id
	FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos(plano_id)
    ON DELETE CASCADE ON UPDATE CASCADE);
    
CREATE TABLE IF NOT EXISTS SpotifyClone.artistas (
  artista_id INT AUTO_INCREMENT PRIMARY KEY,
  artista VARCHAR(45) NOT NULL);


CREATE TABLE IF NOT EXISTS SpotifyClone.albuns (
  album_id INT AUTO_INCREMENT PRIMARY KEY,
  artista_id INT NOT NULL,
  album VARCHAR(45) NOT NULL,
  CONSTRAINT fk_idx_artista_id
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id)
    ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS SpotifyClone.cancoes (
  cancao_id INT AUTO_INCREMENT PRIMARY KEY,
  album_id INT NOT NULL,
  cancao VARCHAR(45) NOT NULL,
  duracao_segundos INT NOT NULL,
  ano_lancamento YEAR NOT NULL,
  CONSTRAINT fk_idx_album_id
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id)
    ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS SpotifyClone.reproducoes (
  pessoa_usuaria_id INT,
  cancao_id INT,
  data_reproducao DATETIME NOT NULL,
  PRIMARY KEY (pessoa_usuaria_id, cancao_id),
  CONSTRAINT fk_idx_pessoa_usuaria_id
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.pessoas_usuarias(pessoa_usuaria_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_idx_cancao_id
    FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(cancao_id)
    ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS SpotifyClone.seguindo_artistas (
  pessoa_usuaria_id INT,
  artista_id INT,
  PRIMARY KEY(pessoa_usuaria_id, artista_id),
  CONSTRAINT fk_idx_pessoa_usuaria_id_2 
	FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.pessoas_usuarias(pessoa_usuaria_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_idx_artista_id_2
	FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id)
    ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO SpotifyClone.planos(plano_id, nome_plano, valor) 
VALUES
	(1, 'gratuito', 0),
	(2, 'familiar', 7.99),
	(3, 'universitário', 5.99),
	(4, 'pessoal', 6.99);

INSERT INTO SpotifyClone.pessoas_usuarias(pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) 
VALUES
	(1, 'Barbara Liskov', 82, 1, '2019-10-20'),
	(2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
	(3, 'Ada Lovelace', 37, 2, '2017-12-30'),
	(4, 'Martin Fowler', 46, 2, '2017-01-17'),
	(5, 'Sandi Metz', 58, 2, '2018-04-29'),
	(6, 'Paulo Freire', 19, 3, '2018-02-14'),
	(7, 'Bell Hooks', 26, 3, '2018-01-05'),
	(8, 'Christopher Alexander', 85, 4, '2019-06-05'),
	(9, 'Judith Butler', 45, 4, '2020-05-13'),
	(10, 'Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO SpotifyClone.artistas(artista_id, artista)
VALUES
	(1, 'Beyoncé'),
	(2, 'Queen'),
	(3, 'Elis Regina'),
	(4, 'Baco Exu do Blues'),
	(5, 'Blind Guardian'),
	(6, 'Nina Simone');

INSERT INTO SpotifyClone.albuns(album_id, artista_id, album)
VALUES
	(1, 1, 'Renaissance'),
	(2, 2, 'Jazz'),
	(3, 2, 'Hot Space'),
	(4, 3, 'Falso Brilhante'),
	(5, 3, 'Vento de Maio'),
	(6, 4, 'QVVJFA?'),
	(7, 5, 'Somewhere Far Beyond'),
	(8, 6, 'I Put A Spell On You');

INSERT INTO SpotifyClone.cancoes(cancao_id, album_id, cancao, duracao_segundos, ano_lancamento) 
VALUES
	(1, 1, 'BREAK MY SOUL', 279, 2022),
	(2, 1, "VIRGO'S GROOVE", 369, 2022),
	(3, 1, 'ALIEN SUPERSTAR', 116, 2022),
	(4, 2, "Don't Stop Me Now", 203, 1978),
	(5, 3, 'Under Pressure', 152, 1982),
	(6, 4, 'Como Nossos Pais', 105, 1998),
	(7, 5, 'O Medo de Amar é o Medo de Ser Livre', 207, 2001),
	(8, 6, 'Samba em Paris', 267, 2003),
	(9, 7, "The Bard's Song", 244, 2007),
	(10, 8, 'Feeling Good', 100, 2012);

INSERT INTO SpotifyClone.reproducoes(pessoa_usuaria_id, cancao_id, data_reproducao)
VALUES
	(1, 8, '2022-02-28 10:45:55'),
	(1, 2, '2020-05-02 05:30:35'),
	(1, 10, '2020-03-06 11:22:33'),
	(2, 10, '2022-08-05 08:05:17'),
	(2, 7, '2020-01-02 07:40:33'),
	(3, 10, '2020-11-13 16:55:13'),
	(3, 2, '2020-12-05 18:38:30'),
	(4, 8, '2021-08-15 17:10:10'),
	(5, 8, '2022-01-09 01:44:33'),
	(5, 5, '2020-08-06 15:23:43'),
	(6, 7, '2017-01-24 00:31:17'),
	(6, 1, '2017-10-12 12:35:20'),
	(7, 4, '2011-12-15 22:30:49'),
	(8, 4, '2012-03-17 14:56:41'),
	(9, 9, '2022-02-24 21:14:22'),
	(10, 3, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.seguindo_artistas(pessoa_usuaria_id, artista_id)
VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 6),
	(6, 1),
	(7, 6),
	(9, 3),
	(10, 2);
