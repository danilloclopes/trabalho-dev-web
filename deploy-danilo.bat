@echo off

@REM força entrada na pasta atual do projeto
cd /d "%~dp0"

@REM build do projeto
call mvn clean package

@REM verificação de erro e abortagem caso o build falhe
if %errorlevel% neq 0 (
    echo ERRO NO BUILD. Abortando...
    pause
    exit /b
)

@REM desliga o tomcat caso esteja rodando
call "C:\apache-tomcat-9.0.117\apache-tomcat-9.0.117\bin\shutdown.bat" >nul 2>&1
timeout /t 5 >nul

@REM apaga o .war anterior para evitar conflitos de cache
del /F /Q "C:\apache-tomcat-9.0.117\apache-tomcat-9.0.117\webapps\agendamento-personagens.war" >nul 2>&1
rmdir /S /Q "C:\apache-tomcat-9.0.117\apache-tomcat-9.0.117\webapps\agendamento-personagens" >nul 2>&1

@REM copia o novo .war para a pasta webapps do tomcat
copy /Y "C:\Users\danil\Documents\repositories\trabalho-dev-web\target\agendamento-personagens.war" "C:\apache-tomcat-9.0.117\apache-tomcat-9.0.117\webapps"

@REM inicia o tomcat
call "C:\apache-tomcat-9.0.117\apache-tomcat-9.0.117\bin\startup.bat"

@REM aguarda o tomcat subir e expandir o WAR antes de abrir o browser
timeout /t 10 >nul

@REM abre a página inicial (HomeServlet -> WEB-INF/views/home/index.jsp)
start chrome http://localhost:8080/agendamento-personagens/
