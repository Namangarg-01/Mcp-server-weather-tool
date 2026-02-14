#!/bin/bash

echo "🌤️  Starting Weather MCP Server..."
echo ""

# Activate virtual environment
if [ -d ".venv" ]; then
    source .venv/bin/activate
else
    echo "❌ Virtual environment not found"
    echo "📝 Please run ./setup.sh first"
    exit 1
fi

echo "✓ Starting MCP server..."
echo "📡 Server running on stdio transport"
echo "💡 Press Ctrl+C to stop"
echo ""

python main.py