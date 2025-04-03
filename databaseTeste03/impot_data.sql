
COPY demonstracoes_contabeis(data_referencia, registro_ans, cnpj, descricao, valor)
FROM 'D:/Programando/intuitiveCare/demonstracoes_contabeis/1t2024.csv'
DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY demonstracoes_contabeis(data_referencia, registro_ans, cnpj, descricao, valor)
FROM 'D:/Programando/intuitiveCare/demonstracoes_contabeis/2t2024.csv'
DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY demonstracoes_contabeis(data_referencia, registro_ans, cnpj, descricao, valor)
FROM 'D:/Programando/intuitiveCare/demonstracoes_contabeis/3t2024.csv'
DELIMITER ';' CSV HEADER ENCODING 'UTF8';

COPY demonstracoes_contabeis(data_referencia, registro_ans, cnpj, descricao, valor)
FROM 'D:/Programando/intuitiveCare/demonstracoes_contabeis/4t2024.csv'
DELIMITER ';' CSV HEADER ENCODING 'UTF8';




COPY operadoras(registro_ans, cnpj, razao_social, nome_fantasia, modalidade, logradouro, numero, complemento, bairro, cidade, uf, cep, ddd, telefone, fax, email, representante, cargo_representante, regiao_comercializacao, data_registro_ans)
FROM 'D:/Programando/intuitiveCare/dados_cadastrais/relatorio_cadop.csv'
DELIMITER ';' CSV HEADER ENCODING 'UTF8';
