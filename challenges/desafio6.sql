SELECT 
    MIN(valor) AS faturamento_minimo,
    MAX(valor) AS faturamento_maximo,
    ROUND(AVG(PL.valor), 2) AS faturamento_medio, 
    SUM(PL.valor) AS faturamento_total
FROM
    SpotifyClone.planos PL
        INNER JOIN
    SpotifyClone.pessoas_usuarias P ON P.plano_id = PL.plano_id;