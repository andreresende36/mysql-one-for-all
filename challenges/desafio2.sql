SELECT 
    COUNT(*) AS cancoes,
    (SELECT 
            COUNT(*) AS artistas
        FROM
            SpotifyClone.artistas) AS artistas,
	(SELECT 
            COUNT(*) AS albuns
        FROM
            SpotifyClone.albuns) AS albuns
FROM
    SpotifyClone.cancoes;
