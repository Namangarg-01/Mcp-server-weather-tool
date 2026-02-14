@echo off
echo 🌤️  Starting Weather MCP Server...
echo.

REM Activate virtual environment
if exist .venv\Scripts\activate.bat (
    call .venv\Scripts\activate.bat
) else (
    echo ❌ Virtual environment not found
    echo 📝 Please run setup.bat first
    pause
    exit /b 1
)

echo ✓ Starting MCP server...
echo 📡 Server running on stdio transport
echo 💡 Press Ctrl+C to stop
echo.

python main.py

pause