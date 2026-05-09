#!/bin/bash

# força entrada na pasta atual do script
cd "$(dirname "$0")"

# build do projeto
mvn clean package

# verificação de erro
if [ $? -ne 0 ]; then
    echo "ERRO NO BUILD. Abortando..."
    read -p "Pressione Enter para sair..."
    exit 1
fi

# caminho do tomcat
TOMCAT_PATH="/apache-tomcat-9"
    
# desliga o tomcat
"$TOMCAT_PATH/bin/shutdown.sh" > /dev/null 2>&1

# espera um pouco
sleep 1

# remove WAR antigo
rm -f "$TOMCAT_PATH/webapps/agendamento-personagens.war"
rm -rf "$TOMCAT_PATH/webapps/agendamento-personagens"

# copia novo WAR
cp "$(pwd)/target/agendamento-personagens.war" "$TOMCAT_PATH/webapps/"

# inicia o tomcat
"$TOMCAT_PATH/bin/startup.sh"

# espera subir
sleep 1

# abre no navegador (Chrome)
google-chrome http://localhost:8080/agendamento-personagens/ >/dev/null 2>&1 &
