import os
import requests
import zipfile
from bs4 import BeautifulSoup


BASE_URL = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"


DOWNLOAD_DIR = "downloads"
os.makedirs(DOWNLOAD_DIR, exist_ok=True)


def download_file(url, save_path):
    # Função para baixar um arquivo em partes por isso o uso do STREAM=True
    # wb => abre no modo binario dado bruto bom para PDF
    # ele baixa o arquivos em chunks para economizar memoria e gravando aos poucos no disco
    response = requests.get(url, stream=True)
    if response.status_code == 200:
        with open(save_path, "wb") as file:
            for chunk in response.iter_content(1024):
                file.write(chunk)
        print(f"Download concluído: {save_path}")
    else:
        print(f"Erro ao baixar {url}")


# pegar o HTML da pagina para manusiar
response = requests.get(BASE_URL)
if response.status_code != 200:
    print("Erro ao acessar a página principal")
    exit()

# var que permiti a extracao de dados
soup = BeautifulSoup(response.text, "html.parser")


# pegar os links dentro da <ol>
# percorre todos os LI que tem no html, busca os Arquivos Anexos 1 e 2 e adiciona no pdflinks array
pdf_links = []
for li in soup.find_all("li"):
    for a in li.find_all("a", href=True):
        href = a["href"]
        if "Anexo_I" in href or "Anexo_II" in href:
            pdf_links.append(
                href if href.startswith("http") else f"https://www.gov.br{href}"
            )

# Baixar os arquivos do PDF_LINKS
pdf_files = []
for pdf_url in pdf_links:
    # baixa todos os arquivos PDF a partir do pdf_links, salva  no diretório dowloads e armazena os caminhos dos arquivos na lista
    pdf_name = pdf_url.split("/")[-1]
    pdf_path = os.path.join(DOWNLOAD_DIR, pdf_name)
    download_file(pdf_url, pdf_path)
    pdf_files.append(pdf_path)

# Compactar os arquivos baixados
zip_path = "anexos_ans.zip"
with zipfile.ZipFile(zip_path, "w") as zipf:
    for file in pdf_files:
        zipf.write(file, os.path.basename(file))
        print(f"Arquivo compactado: {file}")

print(f"Download feito ! Arquivos compactados em {zip_path}")
