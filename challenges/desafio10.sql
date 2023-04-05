CREATE TABLE SpotifyClone.cancoes_favoritas (
    pessoa_usuaria_id INT,
    cancao_id INT,
    CONSTRAINT PRIMARY KEY (pessoa_usuaria_id , cancao_id),
    FOREIGN KEY (pessoa_usuaria_id)
        REFERENCES SpotifyClone.pessoas_usuarias (pessoa_usuaria_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (cancao_id)
        REFERENCES SpotifyClone.cancoes (cancao_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO SpotifyClone.cancoes_favoritas(pessoa_usuaria_id, cancao_id)
VALUES
	('1', '3'),
	('1', '6'),
	('1', '10'),
	('2', '4'),
	('3', '1'),
	('3', '3'),
	('4', '7'),
	('4', '4'),
	('5', '10'),
	('5', '2'),
	('8', '4'),
	('9', '7'),
	('10', '3');
