@echo off
setlocal
cd /d "%~dp0"
title Save Games Rw6 - installation / install
echo.
echo  ==============================================================
echo   Save Games Rw6 : installation de tkinterdnd2 et pystray
echo   Save Games Rw6 : installing tkinterdnd2 and pystray
echo  ==============================================================
echo.

rem --- 1. trouver Python / find Python ---
set "PY="
py -3 --version >nul 2>nul && set "PY=py -3"
if not defined PY (
    python --version >nul 2>nul && set "PY=python"
)
if not defined PY goto :nopython

echo Python trouve / found :
%PY% --version
echo.

rem --- 2. installer les modules / install the modules ---
%PY% -m pip --version >nul 2>nul
if errorlevel 1 (
    echo pip est absent, tentative de reparation... / pip is missing, trying to repair...
    %PY% -m ensurepip --upgrade
)
echo Installation en cours (une seule fois) / Installing (only once)...
echo.
%PY% -m pip install --upgrade tkinterdnd2 pystray
if errorlevel 1 goto :fail

echo.
echo  --------------------------------------------------------------
echo   Termine ! / Done !
echo   - glisser-deposer / drag and drop : tkinterdnd2
echo   - icone pres de l'horloge / tray icon : pystray
echo  --------------------------------------------------------------
echo.
choice /c ON /m "Lancer Save Games Rw6 maintenant ? / Start Save Games Rw6 now ? (O=Oui/Yes, N=Non/No)"
if errorlevel 2 goto :end
if exist "%~dp0save_games_rw6.pyw" (
    start "" "%~dp0save_games_rw6.pyw"
) else if exist "%~dp0Save Games Rw6.pyw" (
    start "" "%~dp0Save Games Rw6.pyw"
) else (
    echo Fichier de l'appli introuvable a cote de ce .bat / App file not found next to this .bat
    pause
)
goto :end

:nopython
echo Python n'est pas installe (ou pas dans le PATH).
echo Python is not installed (or not in the PATH).
echo.
where winget >nul 2>nul
if errorlevel 1 goto :manual
choice /c ON /m "Installer Python maintenant avec winget ? / Install Python now with winget ? (O=Oui/Yes, N=Non/No)"
if errorlevel 2 goto :manual
winget install -e --id Python.Python.3.12 --accept-source-agreements --accept-package-agreements
if errorlevel 1 goto :manual
echo.
echo Python est installe. FERME cette fenetre puis relance ce fichier une 2e fois.
echo Python is installed. CLOSE this window, then run this file a second time.
pause
goto :end

:manual
echo.
echo Installe Python 3 depuis / Install Python 3 from : https://www.python.org/downloads/
echo Pendant l'installation, coche / During the installation, tick : "Add python.exe to PATH"
echo Puis relance ce fichier. / Then run this file again.
start "" "https://www.python.org/downloads/"
pause
goto :end

:fail
echo.
echo L'installation a echoue (pas d'internet ?). L'appli marche quand meme, sans
echo glisser-deposer ni icone pres de l'horloge.
echo The installation failed (no internet?). The app still works, without drag and
echo drop and without the tray icon.
pause

:end
endlocal
