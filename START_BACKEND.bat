@echo off
cd /d "%~dp0backend"
if not exist ".env" (
  copy ".env.example" ".env" >nul
  echo Created backend\.env. Add your Gemini API key there, save, then rerun this file.
  notepad ".env"
  pause
  exit /b
)
python -m pip install -r requirements.txt
if errorlevel 1 (
  echo Python dependency installation failed. Check Python is installed and on PATH.
  pause
  exit /b 1
)
python app.py
pause
