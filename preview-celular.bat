@echo off
cd /d "%~dp0"

echo Preview local de la invitacion
echo.
echo En el celular, conectado a la misma red Wi-Fi, abre:
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /i "IPv4"') do (
    for /f "tokens=* delims= " %%B in ("%%A") do echo   http://%%B:8000/xv_1_pase.html
)
echo.
echo Si Windows pregunta, permite el acceso solo en redes privadas.
echo Deja esta ventana abierta mientras ves el preview.
echo Para detener el servidor, presiona Ctrl+C.
echo.

py -m http.server 8000 --bind 0.0.0.0
if errorlevel 1 (
    echo.
    echo No se pudo iniciar el servidor. Verifica que Python este instalado
    echo y que el puerto 8000 no este siendo usado por otra aplicacion.
    pause
)
