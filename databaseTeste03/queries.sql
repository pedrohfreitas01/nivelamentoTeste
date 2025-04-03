-- Pegando as 10 operadoras com maiores despesas no último trimestre
SELECT o.nome_fantasia,  
       SUM(d.valor) AS total_despesas  
FROM demonstracoes_contabeis d  
JOIN operadoras o ON d.registro_ans = o.registro_ans  
WHERE d.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'  
AND d.data_referencia >= CURRENT_DATE - INTERVAL '3 months'  
GROUP BY o.nome_fantasia  
ORDER BY total_despesas DESC  
LIMIT 10;


-- Pegando as 10 operadoras com maiores despesas no último ano
SELECT 
    o.nome_fantasia, 
    SUM(d.valor) AS total_despesas
FROM demonstracoes_contabeis d
JOIN operadoras o ON d.registro_ans = o.registro_ans
WHERE d.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
AND d.data_referencia >= (CURRENT_DATE - INTERVAL '12 months')
GROUP BY o.nome_fantasia
ORDER BY total_despesas DESC
LIMIT 10;
