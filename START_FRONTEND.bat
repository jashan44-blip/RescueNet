@echo off
cd /d "%~dp0frontend"
if not exist "package.json" (
  echo package.json not found. Please extract the full project ZIP.
  pause
  exit /b 1
)
if not exist "node_modules" (
  npm install
  if errorlevel 1 (
    echo npm install failed. Check Node.js/npm is installed and internet is available.
    pause
    exit /b 1
  )
)
npm run dev
pause
