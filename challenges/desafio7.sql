SELECT 
    A.artista,
    AL.album AS album,
    COUNT(SA.pessoa_usuaria_id) AS pessoas_seguidoras
FROM
    SpotifyClone.albuns AL
        INNER JOIN
    SpotifyClone.artistas A ON A.artista_id = AL.artista_id
        INNER JOIN
    SpotifyClone.seguindo_artistas SA ON SA.artista_id = AL.artista_id
GROUP BY album, artista
ORDER BY pessoas_seguidoras DESC, artista, album;