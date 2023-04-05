SELECT 
    P.nome_pessoa_usuaria AS pessoa_usuaria,
    COUNT(R.cancao_id) AS musicas_ouvidas,
    SUM(ROUND(C.duracao_segundos/60, 2)) AS total_minutos
FROM
    SpotifyClone.pessoas_usuarias P
        INNER JOIN
    SpotifyClone.reproducoes R ON P.pessoa_usuaria_id = R.pessoa_usuaria_id
		INNER JOIN
	SpotifyClone.cancoes C ON R.cancao_id = C.cancao_id
GROUP BY P.nome_pessoa_usuaria
ORDER BY P.nome_pessoa_usuaria;