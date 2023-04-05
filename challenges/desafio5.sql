SELECT 
    C.cancao AS cancao,
    COUNT(R.pessoa_usuaria_id) AS reproducoes
FROM
    SpotifyClone.reproducoes R
        INNER JOIN
    SpotifyClone.cancoes C ON C.cancao_id = R.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;