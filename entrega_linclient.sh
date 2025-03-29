#!/bin/bash

# Nome dos arquivos de saída
OUTPUT_FILE="linclient.txt"

# Captura o nome da máquina virtual (hostname)
VM_NAME=$(hostname)

# Captura o IP da máquina (IPv4 principal)
IP_ADDRESS=$(hostname -I | awk '{print $1}')

# Inicia a gravação do terminal
script -q -c "     
    echo '\n== Passo 2.1. DNS: Primário e Secundário. =='
	echo 'Inicio Arquivo nsd.conf'
    cat /etc/nsd.conf
	echo 'Fim Arquivo nsd.conf'
    echo '\nInicio Arquivo unbound.conf'
    cat /etc/unbound.conf
	echo 'Fim Arquivo unbound.conf'	
" "$OUTPUT_FILE"

echo "Relatório gerado: $OUTPUT_FILE"

echo "Adicionar este resultado ao final do arquivo linserver.sh"
