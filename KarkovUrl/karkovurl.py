# ============================================
#      Desenvolvido por: Kenteni Alves
#   GitHub: @jkenteni | Instagram: @jkenteni
# ============================================
#  Fique à vontade para usar, modificar e compartilhar!
#  No entanto, peço que mantenha os créditos. 
#  Agradeço pelo apoio! 
# ============================================

import requests
import re

def validate_url(url):
    regex = re.compile(
        r'^(?:http|ftp)s?://' # http:// ou https://
        r'(?:(?:[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?\.)+(?:[A-Z]{2,6}\.?|[A-Z0-9-]{2,}\.?)|'  # Domínios
        r'localhost|'  # localhost
        r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}|'  # ou IP
        r'\[?[A-F0-9]*:[A-F0-9:]+\]?)'  # ou IPv6
        r'(?::\d+)?'  # Porto
        r'(?:/?|[/?]\S+)$', re.IGNORECASE)
    
    return re.match(regex, url) is not None

def shorten_url(malicious_url):
    try:
        response = requests.get(f"http://tinyurl.com/api-create.php?url={malicious_url}")
        if response.status_code == 200:
            return response.text
        else:
            raise Exception("Erro ao encurtar a URL.")
    except Exception as e:
        print(f"Erro ao conectar-se à API do TinyURL: {e}")
        return None

def mask_url(original_url, mask_text):

    if not validate_url(original_url):
        print("A URL fornecida não é válida. Tente novamente.")
        return None

    short_url = shorten_url(original_url)
    if not short_url:
        return None

    masked_url = f"https://{mask_text}@{short_url[8:]}"  # Remove o "https://" da URL encurtada
    return masked_url



def main():
    print("""

██ ▄█▀▄▄▄       ██▀███   ██ ▄█▀ ▒█████   ██▒   █▓      █    ██  ██▀███   ██▓    
██▄█▒▒████▄    ▓██ ▒ ██▒ ██▄█▒ ▒██▒  ██▒▓██░   █▒      ██  ▓██▒▓██ ▒ ██▒▓██▒    
▓███▄░▒██  ▀█▄  ▓██ ░▄█ ▒▓███▄░ ▒██░  ██▒ ▓██  █▒░     ▓██  ▒██░▓██ ░▄█ ▒▒██░    
▓██ █▄░██▄▄▄▄██ ▒██▀▀█▄  ▓██ █▄ ▒██   ██░  ▒██ █░░     ▓▓█  ░██░▒██▀▀█▄  ▒██░    
▒██▒ █▄▓█   ▓██▒░██▓ ▒██▒▒██▒ █▄░ ████▓▒░   ▒▀█░   ██▓ ▒▒█████▓ ░██▓ ▒██▒░██████▒
▒ ▒▒ ▓▒▒▒   ▓▒█░░ ▒▓ ░▒▓░▒ ▒▒ ▓▒░ ▒░▒░▒░    ░ ▐░   ▒▓▒ ░▒▓▒ ▒ ▒ ░ ▒▓ ░▒▓░░ ▒░▓  ░
░ ░▒ ▒░ ▒   ▒▒ ░  ░▒ ░ ▒░░ ░▒ ▒░  ░ ▒ ▒░    ░ ░░   ░▒  ░░▒░ ░ ░   ░▒ ░ ▒░░ ░ ▒  ░
░ ░░ ░  ░   ▒     ░░   ░ ░ ░░ ░ ░ ░ ░ ▒       ░░   ░    ░░░ ░ ░   ░░   ░   ░ ░   
░  ░        ░  ░   ░     ░  ░       ░ ░        ░    ░     ░        ░         ░  ░
                                              ░     ░                            
          
                                |Projeto Karkov|
    Créditos: Tropa da Turquia | Dev: Kenteni Alves | GitHub: @jkenteni
    """)
    
    malicious_url = input("Digite a URL maliciosa (com http:// ou https://): ").strip()
    mask_text = input("Digite o texto de máscara (ex: google-login): ").strip()

    masked_url = mask_url(malicious_url, mask_text)
    if masked_url:
        print("\nURL mascarada gerada:")
        print(masked_url)
    else:
        print("Erro ao gerar a URL mascarada.")

if __name__ == "__main__":
    main()
