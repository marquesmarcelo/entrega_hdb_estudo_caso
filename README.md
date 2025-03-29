# Roteiro para Montar Resposta

# Preparação do script

Os passos abaixo indicados devem ser executados em ambas as VMs, ou seja: `linserver` e `linclient`

1. Tornar-se `root`:

```bash
$ su -
```

2. Instalar os sequintes pacotes:
```bash
# apt update && apt install git
```

3. Realizar um clone do gerador de resposta
```bash
# git clone https://github.com/marquesmarcelo/entrega_hdb_estudo_caso.git
```

3. Dar permissão de execute para os scripts:
```bash
# cd entrega_hdb_estudo_caso
# chmod +x entrega_linclient.sh
# chmod +x entrega_linserver.sh
```

# Processar a entrega

1. Após concluir toda a tarefa você deve executar o script específico em sua respectiva VM apenas, ou seja: `entrega_linserver.sh.sh` deve ser executado no `linserver` e `entrega_linclient.sh` deve ser executado na VM `linclient`. (*não inverta os arquivos*)

2. Copiar os arquivos das VMs `linserver.txt` e `linclient.txt` para sua máquina `local`.

3. Na sua máquina local criar um arquivo `.doc`, adicionar o conteúdo dos arquivos `linserver.txt` e `linclient.txt`, nesta ordem, e adicionar as imagens solicitadas nos locais indicados.

4. Converter o arquivo em PDF e anexar no AVA