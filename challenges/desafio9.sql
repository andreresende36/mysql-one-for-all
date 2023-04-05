SELECT 
    COUNT(R.cancao_id) AS musicas_no_historico
FROM
    SpotifyClone.reproducoes R
        INNER JOIN
    SpotifyClone.pessoas_usuarias P ON P.pessoa_usuaria_id = R.pessoa_usuaria_id
WHERE
    P.nome_pessoa_usuaria = 'Barbara Liskov'
GROUP BY P.nome_pessoa_usuaria;