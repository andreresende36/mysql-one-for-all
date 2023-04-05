SELECT 
    A.artista AS artista,
    AL.album AS album
FROM
    SpotifyClone.albuns AL
        INNER JOIN
    SpotifyClone.artistas A ON A.artista_id = AL.artista_id
WHERE A.artista = 'Elis Regina'
ORDER BY album;