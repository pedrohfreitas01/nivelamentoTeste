CREATE TABLE demonstracoes_contabeis (
    id SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    registro_ans VARCHAR(10) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor NUMERIC(15,2) NOT NULL,
    FOREIGN KEY (registro_ans) REFERENCES operadoras(registro_ans)
);

-- em vez de dadosCadastrais --> melhor operadoras
CREATE TABLE operadoras (
    id SERIAL PRIMARY KEY,
    registro_ans VARCHAR(10) UNIQUE NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(100),
    logradouro VARCHAR(255),
    numero VARCHAR(10),
    complemento VARCHAR(255),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf CHAR(2),
    cep VARCHAR(8),
    ddd VARCHAR(3),
    telefone VARCHAR(20),
    fax VARCHAR(20),
    email VARCHAR(255),
    representante VARCHAR(255),
    cargo_representante VARCHAR(100),
    regiao_comercializacao INT,
    data_registro DATE
);
