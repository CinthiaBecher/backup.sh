#!/bin/bash

data=$(date +%d-%m-%y)

#Solicita diretório para Backup
echo  'Digite o caminho do diretório para a realização do backup'
read caminho

#Criando arquivo log
arquivo_log="/home/linux/Backup/logBKP.log"
exec 1> $arquivo_log

#Guardando informações Backup
echo -e  "\nExecução do Backup - $data"

echo -e 'Horário de Início - \c'
date +%H:%M:%S

pasta_backup='/home/linux/Backup'

#Criando arquivo backup
arquivo_backup="backup_$data.tgz"

#Realizando Backup
echo -e "\nArquivos Compactados" 
tar -czSpf "$pasta_backup/$arquivo_backup" "$caminho" >> $arquivo_log

cd $pasta_backup
tar -tz -f $arquivo_backup 

#Guardando informações de finalizacao do backup
echo -e  "\nDiretório de backup: $pasta_backup"
echo -e 'Horário de Finalização do Backup - \c'
date +%H:%M:%S
