#!/bin/bash

# Nome dos arquivos de saída
OUTPUT_FILE="linserver.txt"
TEMP_FILE="temp.txt"

# Solicita o nome do usuário
read -p "Digite seu nome completo: " USER_NAME

# Captura o nome da máquina virtual (hostname)
VM_NAME=$(hostname)

# Captura o IP da máquina (IPv4 principal)
IP_ADDRESS=$(hostname -I | awk '{print $1}')

# Captura a data e hora atual no formato desejado
CURRENT_DATE=$(date "+%d/%m/%Y %H:%M:%S")

# Inicia a gravação do terminal
script -q --return -c "  
    echo '=== IDENTIFICACÃO ==='
    echo '  Data e hora da geração: $CURRENT_DATE'
    echo '  Nome do aluno: $USER_NAME'
    echo '  Nome da máquina virtual: $VM_NAME'
    echo '  Endereço IP da máquina: $IP_ADDRESS'
    echo
    echo '=== ENTREGA ==='
    echo
    echo '== Passo 1: Design da rede interna com segmentação =='
    echo
    echo '1.1. Topologia lógica que deve representar as VLANs indicadas na tarefa'
    echo '>>> Coloque aqui a imagem'	
    echo
    echo '1.2. Tabela do item 1.2.11.2 indicando as VLAN TAG e a Descrição'
    echo '>>> Coloque aqui a tabela'    
    echo
    echo '== Passo 2.1. DNS: Primário =='
    echo
    echo '#Inicio Arquivo nsd.conf'
    cat /etc/nsd.conf
    echo '#Fim Arquivo nsd.conf'
    echo
    echo '#Inicio Arquivo unbound.conf'
    cat /etc/unbound.conf
    echo '#Fim Arquivo unbound.conf'
    echo
    echo '2.2.11. Anexe, ao PDF da sua ENTREGA, o texto dos arquivos'
    echo '#Inicio Arquivo nslcd.conf'
    cat /etc/nslcd.conf
    echo '#Fim Arquivo nslcd.conf'
    echo
    echo '#Inicio Arquivo ldapscripts.conf'
    cat /etc/ldapscripts/ldapscripts.conf
    echo '#Fim Arquivo ldapscripts.conf'
    echo    
    echo '== Passo 3: Provisionamento e configuração automática de máquinas virtuais =='
    echo
    echo '#Listando conteúdo dos arquivos em ~/roles/ e subpastas'
    if [ -d ~/roles ]; then
        find ~/roles -type f | while read file; do
            echo
            echo '##Conteúdo de: '\$file
            cat \"\$file\"
        done
    else
    	echo '#A pasta ~/roles/ não existe.'
    fi
    echo
    echo '#Inicio Arquivo ansible.cfg'
    echo '#Primeiras 10 linhas de ansible.cfg'
    head -n 10 /etc/ansible/ansible.cfg
    echo '#Últimas 10 linhas de ansible.cfg'
    tail -n 10 /etc/ansible/ansible.cfg
    echo '#Fim Arquivo ansible.cfg'
    echo
    echo '#Inicio Arquivo hosts'
    cat	/etc/ansible/hosts
    echo '#Fim Arquivo hosts'
    echo
    echo '#Inicio Arquivo srv.yml'
    cat	/home/ansible/srv.yml
    echo '#Fim Arquivo srv.yml'
    echo
    echo '== Passo 4: Configuração do Servidor de Log Remoto =='
    echo
    echo '4.8.1. O SOMATÓRIO das Falhas em tentativa de login'
    echo '>>> Coloque aqui a imagem'
    echo
    echo '4.8.2. Um gráfico de barras diário, de um extremo ao outro da tela'
    echo '>>> Coloque aqui a imagem'
    echo
    echo '4.8.3. Na parte inferior da tela, a listagem de todos os últimos 10 logs capturados'
    echo '>>> Coloque aqui a imagem'
    echo
    echo '== Relatorio da VM LinClient =='
    echo '>>> Coloque aqui o conteúdo do arquivo `linclient.txt` gerado na VM LinClient'
" "$TEMP_FILE"

# Filtra as linhas indesejadas e salva no arquivo final
grep -v -e "Script started on" -e "Script done on" "$TEMP_FILE" > "$OUTPUT_FILE"
rm -f "$TEMP_FILE"  # Remove o arquivo temporário

echo
echo "Relatório gerado: $OUTPUT_FILE"
