SELECT 
    A.artista AS artista,
    CASE COUNT(DISTINCT CF.pessoa_usuaria_id, CF.cancao_id)
        WHEN 0 THEN '-'
        WHEN 3 THEN 'B'
        WHEN 4 THEN 'B'
        WHEN 1 THEN 'C'
        WHEN 2 THEN 'C'
        ELSE 'A'
    END AS ranking
FROM
    SpotifyClone.cancoes_favoritas CF
        INNER JOIN
    SpotifyClone.cancoes C ON C.cancao_id = CF.cancao_id
        INNER JOIN
    SpotifyClone.albuns AL ON AL.album_id = C.album_id
        RIGHT JOIN
    SpotifyClone.artistas A ON A.artista_id = AL.artista_id
GROUP BY artista
ORDER BY REPLACE(ranking, '-', 'Z'), artista;