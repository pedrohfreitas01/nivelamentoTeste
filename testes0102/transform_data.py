import os
import zipfile
import pandas as pd
import pdfplumber

# nome dos arquivos novos & caminhos para usar como var
DOWNLOAD_DIR = "downloads"
ANEXO_I_PDF = os.path.join(DOWNLOAD_DIR, "Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf")
CSV_FILE = "Rol_Procedimentos.csv"
ZIP_FILE = f"Teste_Pedro.zip" 

# verifica se o PDF existe antes de continuar
if not os.path.exists(ANEXO_I_PDF):
    print(f"Erro: Arquivo {ANEXO_I_PDF} não encontrado. Execute o script de download primeiro.")
    exit()

# lista para os dados 
data = []



# abre o anexo e extrai as tabelas
with pdfplumber.open(ANEXO_I_PDF) as pdf:
    for page in pdf.pages:
        tables = page.extract_table()
        if tables:
            for row in tables:
                data.append(row)



# DataFrame com os dados extraídos transforma os dados em uma tabela organizada
df = pd.DataFrame(data)

# Remover possíveis linhas vazias
df.dropna(how="all", inplace=True)

# Substituir abreviações OD e AMB
substituicoes = {
    "OD": "Procedimentos Odontológicos",
    "AMB": "Procedimentos Ambulatoriais"
}
df.replace(substituicoes, inplace=True)

# Salvar em CSV
df.to_csv(CSV_FILE, index=False, encoding="utf-8")




# Compactar o CSV
with zipfile.ZipFile(ZIP_FILE, "w") as zipf:
    zipf.write(CSV_FILE, os.path.basename(CSV_FILE))

print(f"Transformação concluída! Arquivo compactado salvo como {ZIP_FILE}")
