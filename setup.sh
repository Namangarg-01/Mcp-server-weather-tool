#!/bin/bash

echo "🌤️  Setting up Weather MCP Server..."
echo ""

# Check Python version
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version 2>&1 | awk '{print $2}')
    echo "✓ Python version: $PYTHON_VERSION"
else
    echo "❌ Python 3 is not installed"
    echo "📖 Install from: https://www.python.org/"
    exit 1
fi

echo ""

# Create virtual environment
echo "📦 Creating virtual environment..."
python3 -m venv .venv

# Activate virtual environment
echo "🔌 Activating virtual environment..."
source .venv/bin/activate

# Upgrade pip
echo "⬆️  Upgrading pip..."
pip install --upgrade pip

# Install dependencies
echo "📥 Installing dependencies..."
pip install -r requirements.txt

echo ""
echo "✅ Setup complete!"
echo ""
echo "🚀 Run the server with: ./run.sh"
echo "🧪 Test with MCP Inspector: npx @modelcontextprotocol/inspector python main.py"
echo ""