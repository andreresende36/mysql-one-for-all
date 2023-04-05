SELECT 
    P.nome_pessoa_usuaria AS pessoa_usuaria,
    IF((SUM(IF(YEAR(R.data_reproducao) >= 2021,
            1,
            0))) = 1,
        'Ativa',
        'Inativa') AS status_pessoa_usuaria
FROM
    SpotifyClone.reproducoes R
        INNER JOIN
    SpotifyClone.pessoas_usuarias P ON P.pessoa_usuaria_id = R.pessoa_usuaria_id
GROUP BY P.nome_pessoa_usuaria
ORDER BY P.nome_pessoa_usuaria;