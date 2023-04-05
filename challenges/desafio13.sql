SELECT 
    CASE
        WHEN P.idade <= 30 THEN 'Até 30 anos'
        WHEN P.idade >= 31 AND P.idade <= 60 THEN 'Entre 31 e 60 anos'
        ELSE 'Maior de 60 anos'
    END AS faixa_etaria,
    COUNT(DISTINCT P.pessoa_usuaria_id) AS total_pessoas_usuarias,
    COUNT(CF.cancao_id) AS total_favoritadas
FROM
    SpotifyClone.pessoas_usuarias P
        LEFT JOIN
    SpotifyClone.cancoes_favoritas CF ON CF.pessoa_usuaria_id = P.pessoa_usuaria_id
GROUP BY faixa_etaria
ORDER BY faixa_etaria;
