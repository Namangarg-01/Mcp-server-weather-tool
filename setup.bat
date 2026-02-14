@echo off
echo 🌤️  Setting up Weather MCP Server...
echo.

REM Check Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python is not installed
    echo 📖 Install from: https://www.python.org/
    pause
    exit /b 1
)

echo ✓ Python is installed
echo.

REM Create virtual environment
echo 📦 Creating virtual environment...
python -m venv .venv

REM Activate virtual environment
echo 🔌 Activating virtual environment...
call .venv\Scripts\activate.bat

REM Upgrade pip
echo ⬆️  Upgrading pip...
python -m pip install --upgrade pip

REM Install dependencies
echo 📥 Installing dependencies...
pip install -r requirements.txt

echo.
echo ✅ Setup complete!
echo.
echo 🚀 Run the server with: run.bat
echo 🧪 Test with MCP Inspector: npx @modelcontextprotocol/inspector python main.py
echo.

pause