@echo off

@REM força entrada na pasta atual do projeto
cd /d "%~dp0"

@REM build do projeto
call mvn clean package

@REM verificação de erro e abortagem caso não esteja na pasta certa
if %errorlevel% neq 0 (
    echo ERRO NO BUILD. Abortando...
    pause
    exit /b
)

@REM desliga o tomcat caso esteja rodando
call "C:\apache-tomcat-9.0.117\apache-tomcat-9.0.117\bin\shutdown.bat" >nul 2>&1
timeout /t 5 >nul

@REM @REM timeout pra garantir que o tomcat desligou
@REM timeout /t 1 >nul

@REM apaga o .war anterior para evitar conflitos
del /F /Q "C:\apache-tomcat-9.0.117\apache-tomcat-9.0.117\webapps\agendamento-personagens.war" >nul 2>&1
rmdir /S /Q "C:\apache-tomcat-9.0.117\apache-tomcat-9.0.117\webapps\agendamento-personagens" >nul 2>&1

@REM copia o novo .war para a /webapps do tomcat
copy /Y "C:\Users\danil\Documents\repositories\trabalho-dev-web\target\agendamento-personagens.war" "C:\apache-tomcat-9.0.117\apache-tomcat-9.0.117\webapps"

@REM inicia o tomcat de novo
call "C:\apache-tomcat-9.0.117\apache-tomcat-9.0.117\bin\startup.bat"

@REM espera o tomcat subir completamente antes de abrir o browser
timeout /t 8 >nul

@REM abre o chrome com a url do projeto
start chrome http://localhost:8080/agendamento-personagens/