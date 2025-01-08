url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] URL inválida. Por favor, use http ou https.\e[0m"
            exit 1
        fi
    fi
}

echo -e "\n\e[1;31;42m######┌──────────────────────────┐##### \e[0m"
echo -e "\e[1;31;42m######│██ ▄█▀▄▄▄       ██▀███   ██ ▄█▀ ▒█████   ██▒   █▓│##### \e[0m"
echo -e "\e[1;31;42m######│██▄█▒▒████▄    ▓██ ▒ ██▒ ██▄█▒ ▒██▒  ██▒▓██░   █▒│##### \e[0m"
echo -e "\e[1;31;42m######│▓███▄░▒██  ▀█▄  ▓██ ░▄█ ▒▓███▄░ ▒██░  ██▒ ▓██  █▒░│##### \e[0m"
echo -e "\e[1;31;42m######│▓██ █▄░██▄▄▄▄██ ▒██▀▀█▄  ▓██ █▄ ▒██   ██░  ▒██ █░░│##### \e[0m"
echo -e "\e[1;31;42m######│▒██▒ █▄▓█   ▓██▒░██▓ ▒██▒▒██▒ █▄░ ████▓▒░   ▒▀█░ │##### \e[0m"
echo -e "\e[1;31;42m######│▒ ▒▒ ▓▒▒▒   ▓▒█░░ ▒▓ ░▒▓░▒ ▒▒ ▓▒░ ▒░▒░▒░    ░ ▐░ │##### \e[0m"
echo -e "\e[1;31;42m######│░ ░▒ ▒░ ▒   ▒▒ ░  ░▒ ░ ▒░░ ░▒ ▒░  ░ ▒ ▒░    ░ ░░ │##### \e[0m"
echo -e "\e[1;31;42m######│░ ░░ ░  ░   ▒     ░░   ░ ░░ ░ ░ ░ ░ ░ ▒       ░░ │##### \e[0m"
echo -e "\e[1;31;42m######│░  ░        ░  ░   ░     ░  ░       ░ ░        ░ │##### \e[0m"
echo -e "\e[1;31;42m######└──────────────────────────┘##### \e[0m \n"
echo -e "\e[30;48;5;82m    Copyright \e[40;38;5;82m   Turco21 \e[0m \n\n"

# Exibindo Créditos ao Usuário
echo -e "\n\e[33mEste script foi criado por: Kenteni Alves - Turco21\e[0m"
echo -e "\e[33mSe você achou este script útil, por favor, me dê os créditos!\e[0m"
echo -e "\e[33mEmail para contato: RatoMaldito@proton.me\e[0m"
echo -e "\e[Github: @jkenteni\e[0m"
echo -e "\e[1;31;42m ### URL de Phishing ###\e[0m \n"
echo -n "Cole a URL de Phishing aqui (com http ou https): "
read phish
url_checker $phish
sleep 1
echo "Processando e modificando a URL de Phishing"
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "\n\e[1;31;42m ### Mascara de Domínio ###\e[0m"
echo 'Domínio para mascarar a URL de Phishing (com http ou https), ex: https://google.com, http://anything.org):'
echo -en "\e[32m=>\e[0m "
read mask
url_checker $mask
echo -e '\nDigite palavras de engenharia social (como free-money, best-pubg-tricks):'
echo -e "\e[31mNão use espaços, apenas use '-' entre as palavras de engenharia social.\e[0m"
echo -en "\e[32m=>\e[0m "
read words
if [[ -z "$words" ]]; then
echo -e "\e[31m[!] Nenhuma palavra fornecida.\e[0m"
echo -e "\nGerando link MaskPhish...\n"
final=$mask@$shorter
echo -e "Aqui está a URL MaskPhish:\e[32m ${final} \e[0m\n"
exit
fi
if [[ "$words" =~ " " ]]; then
echo -e "\e[31m[!] Palavras inválidas. Por favor, evite espaços.\e[0m"
echo -e "\nGerando link MaskPhish...\n"
final=$mask@$shorter
echo -e "Aqui está a URL MaskPhish:\e[32m ${final} \e[0m\n"
exit
fi
echo -e "\nGerando link MaskPhish...\n"
final=$mask-$words@$shorter
echo -e "Aqui está a URL MaskPhish:\e[32m ${final} \e[0m\n"
