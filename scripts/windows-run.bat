@echo off
setlocal
cd /d %~dp0\..
if "%PORT%"=="" set PORT=5177
if "%PRINTER_URL%"=="" set PRINTER_URL=http://10.10.20.19:8081
if "%REQUEST_TIMEOUT_MS%"=="" set REQUEST_TIMEOUT_MS=3000

node server.js
endlocal
