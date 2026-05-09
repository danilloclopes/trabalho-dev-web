@echo off

cd /d "%~dp0"

call mvn clean package

if %errorlevel% neq 0 (
    echo ERRO NO BUILD. Abortando...
    pause
    exit /b
)

call "C:\tomcat\apache-tomcat-9.0.117\apache-tomcat-9.0.117\bin\shutdown.bat" >nul 2>&1
timeout /t 5 >nul

del /F /Q "C:\tomcat\apache-tomcat-9.0.117\apache-tomcat-9.0.117\webapps\agendamento-personagens.war" >nul 2>&1
rmdir /S /Q "C:\tomcat\apache-tomcat-9.0.117\apache-tomcat-9.0.117\webapps\agendamento-personagens" >nul 2>&1

copy /Y "C:\Users\danil\Documents\repositories\trabalho-dev-web\projeto\target\agendamento-personagens.war" "C:\tomcat\apache-tomcat-9.0.117\apache-tomcat-9.0.117\webapps"

if %errorlevel% neq 0 (
    echo ERRO AO COPIAR O WAR. Abortando...
    pause
    exit /b
)

call "C:\tomcat\apache-tomcat-9.0.117\apache-tomcat-9.0.117\bin\startup.bat"

timeout /t 10 >nul

start chrome http://localhost:8080/agendamento-personagens/
