#!/bin/bash

date=$(date +%d-%m-%y)

#Solicita diretório para Backup
echo  'Digite o caminho do diretório para a realização do backup'
read caminho

#Criando arquivo log
arquivo_log="/home/cinthia/Backup/logBKP.log"
exec 1> $arquivo_log

#Guardando informações Backup
echo -e  "Execução do Backup - $data"

echo -e 'Horário de Início - \c'
date +%H:%M:%S

pasta_backup='/home/cinthia/Backup'

#Criando arquivo backup
arquivo_backup="backup_$data.tgz"

#Realizando Backup
echo 'Arquivos Compactados' 
tar -czSpf "$pasta_backup/$arquivo_backup" "$caminho" >> $arquivo_log


#Guardando informações de finalizacao do backup
echo "Diretório de backup: $pasta_backup"
echo -e 'Horário de Finalização do Backup - \c'
date +%H:%M:%S
