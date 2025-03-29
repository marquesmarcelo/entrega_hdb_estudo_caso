#!/bin/bash

# Nome dos arquivos de saída
OUTPUT_FILE="linclient.txt"
TEMP_FILE="temp.txt"

# Captura o nome da máquina virtual (hostname)
VM_NAME=$(hostname)

# Captura o IP da máquina (IPv4 principal)
IP_ADDRESS=$(hostname -I | awk '{print $1}')

# Inicia a gravação do terminal
script -q --return -c "    
    echo
    echo '== Passo 2.1.1 DNS: Secundário. =='	
    echo    
    echo '#Inicio Arquivo nsd.conf'
    cat /etc/nsd.conf
    echo '#Fim Arquivo nsd.conf'
    echo
    echo '#Inicio Arquivo unbound.conf'
    cat /etc/unbound.conf
    echo '#Fim Arquivo unbound.conf'	
" "$TEMP_FILE"

# Filtra as linhas indesejadas e salva no arquivo final
grep -v -e "Script started on" -e "Script done on" "$TEMP_FILE" > "$OUTPUT_FILE"
rm -f "$TEMP_FILE"  # Remove o arquivo temporário

echo
echo "Relatório gerado: $OUTPUT_FILE"
echo "Adicionar este resultado ao final do arquivo 'linserver.txt'"
