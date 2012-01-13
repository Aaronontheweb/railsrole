REM Skip Rails install if we're running under the emulator
if "%EMULATED%"=="true" exit /b 0

REM Strip the trailing backslash (if present)
if %RAILS_PATH:~-1%==\ SET RAILS_PATH=%RAILS_PATH:~0,-1%

REM Download directly from RailsInstaller.org
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://rubyforge.org/frs/download.php/75468/railsinstaller-2.0.1.exe', 'railsinstaller-2.0.1.exe')"

REM Run the Rails installer silently
railsinstaller-2.0.1.exe /silent /dir="%RAILS_PATH%" >> log.txt 2>> err.txt

REM Ensure permissive ACLs so other users (like the one that's about to run Rails) can use everything.
icacls "%RAILS_PATH%" /grant everyone:f
icacls . /grant everyone:f

REM Check the Ruby version to make sure everything was installed correctly
"%RAILS_PATH%\Ruby1.9.2\bin\ruby" -v