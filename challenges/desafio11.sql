SELECT 
    AL.album AS album,
    COUNT(CF.pessoa_usuaria_id) AS favoritadas
FROM
    SpotifyClone.cancoes_favoritas CF
        INNER JOIN
    SpotifyClone.cancoes C ON C.cancao_id = CF.cancao_id
		INNER JOIN
	SpotifyClone.albuns AL ON AL.album_id = C.album_id
GROUP BY album
ORDER BY favoritadas DESC
LIMIT 3;