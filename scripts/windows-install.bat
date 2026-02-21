@echo off
setlocal
cd /d %~dp0\..
call npm install
if %ERRORLEVEL% neq 0 (
  echo [ERROR] npm install fallo.
  exit /b %ERRORLEVEL%
)
echo [OK] Dependencias instaladas.
endlocal
