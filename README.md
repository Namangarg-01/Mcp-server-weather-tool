# Weather MCP Tool 🌤️

A Model Context Protocol (MCP) server that provides real-time weather information using the **wttr.in** API. This project was created during the learning phase of understanding MCP systems.

![Weather Tool Screenshot](Screenshot%202026-02-13%20205352.png)

---

## 📖 About This Project

This is a custom MCP tool that demonstrates the core concepts of building MCP servers. The tool:

1. Takes a **location** as user input (string format)
2. Constructs a weather API URL using **wttr.in**
3. Fetches real-time temperature and weather data
4. Returns formatted results to the MCP client (Claude)

### 🎓 Key Learnings

* ✅ **How to create a custom MCP Tool** - Understanding MCP server architecture and tool registration
* ✅ **Using MCP Inspector** - Testing and debugging MCP tools locally before deployment
* ✅ **Connecting MCP tools with Claude** - Configuration through `.config` files to integrate with Claude Desktop
* ✅ **Working with FastMCP** - Simplified MCP server creation with decorators
* ✅ **Async Python patterns** - Using async/await for non-blocking I/O operations

---

## 🌟 Features

- 🌤️ **Real-time weather information** for any location worldwide
- 🌍 **No API key required** - Uses the free wttr.in service
- 🔧 **Easy MCP integration** with Claude Desktop
- ⚡ **Fast and lightweight** - Uses Python's built-in urllib
- 📚 **Beginner-friendly codebase** - Perfect for learning MCP concepts
- 🎯 **Production-ready** - One-command setup and execution

---

## 📋 Prerequisites

- **Python 3.8 or higher**
- **Internet connection** (to fetch weather data)
- **Claude Desktop** (optional, for integration)

**No API keys needed!** ✨

---

## 🚀 Quick Start

### Option 1: Automatic Setup (Recommended)

**Windows:**
```cmd
setup.bat
run.bat
```

**Linux/Mac:**
```bash
chmod +x setup.sh run.sh
./setup.sh
./run.sh
```

### Option 2: Manual Setup

1. **Clone the repository**
```bash
   git clone https://github.com/Namangarg-01/Mcp-server-weather-tool.git
   cd Mcp-server-weather-tool
```

2. **Create virtual environment**
```bash
   python -m venv .venv
   
   # Activate:
   # Windows:
   .venv\Scripts\activate
   # Linux/Mac:
   source .venv/bin/activate
```

3. **Install dependencies**
```bash
   pip install -r requirements.txt
```

4. **Run the server**
```bash
   python main.py
```

---

## 💻 Usage

### Testing with MCP Inspector

Test your tool locally before connecting to Claude:
```bash
# Install MCP Inspector (one-time)
npm install -g @modelcontextprotocol/inspector

# Run inspector
npx @modelcontextprotocol/inspector python main.py
```

This opens a web interface where you can:
- View available tools
- Test the `check_weather` function
- See request/response in real-time

### Connecting to Claude Desktop

To use this MCP server with Claude Desktop, update your configuration file:

**Config file location:**
- **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows**: `%APPDATA%\Claude\claude_desktop_config.json`

**Add this configuration:**
```json
{
  "mcpServers": {
    "weather": {
      "command": "python",
      "args": ["C:/Users/YourName/Desktop/Mcp-server-weather-tool/main.py"]
    }
  }
}
```

**Important:** 
- Use **absolute path** to `main.py`
- Replace `YourName` with your actual username
- Use forward slashes `/` even on Windows

After updating, **restart Claude Desktop**.

### Using in Claude

Once connected, ask Claude:
```
"What's the weather in London?"
"Check the temperature in Tokyo"
"Tell me about the weather in Paris, France"
"How's the weather in Mumbai right now?"
```

Claude will automatically use your MCP tool to fetch real-time weather data! 🎉

---

## 🔍 How It Works

### Architecture Overview
```
User Query → Claude Desktop → MCP Server → wttr.in API → Response
                  ↓              ↓              ↓
              (stdio)      check_weather()   HTTP GET
```

### Code Flow

1. **User asks Claude** about weather
2. **Claude calls MCP tool** with location parameter
3. **MCP server** receives the request via stdio
4. **`check_weather()` tool** is invoked
5. **`get_weather()` function**:
   - URL-encodes the location
   - Constructs wttr.in URL
   - Fetches weather data via HTTP
6. **Response returned** to Claude
7. **Claude formats** and displays to user

### Key Components

**main.py** - MCP Server
```python
@mcp.tool()
async def check_weather(location: str) -> Dict[str, Any]:
    """Get weather info for specific location."""
    return get_weather(location)
```

**tools/weather.py** - Weather Fetcher
```python
def get_weather(location: str) -> dict:
    """Fetches weather using wttr.in API"""
    url = f"https://wttr.in/{location}?format=3"
    # Returns: "London: ⛅️  +15°C"
```

---

## 📁 Project Structure
```
Mcp-server-weather-tool/
├── tools/
│   └── weather.py          # Weather fetching logic
├── main.py                 # MCP server entry point
├── requirements.txt        # Python dependencies
├── .gitignore             # Git ignore rules
├── setup.bat              # Windows setup script
├── setup.sh               # Linux/Mac setup script
├── run.bat                # Windows run script
├── run.sh                 # Linux/Mac run script
├── Screenshot 2026-02-13 205352.png
└── README.md              # This file
```

---

## 🐛 Troubleshooting

### Server Won't Start

**Error:** `ModuleNotFoundError: No module named 'mcp'`
```bash
# Reinstall dependencies
pip install -r requirements.txt
```

### Claude Can't Connect

**Error:** `MCP server not responding`

1. Check that the path in `claude_desktop_config.json` is **absolute**
2. Verify Python is accessible: `python --version`
3. Restart Claude Desktop after config changes
4. Check server runs manually: `python main.py`

### Weather Data Not Fetching

**Error:** `urllib.error.URLError`

- Check your internet connection
- Try accessing https://wttr.in/London in your browser
- The service might be temporarily down

### MCP Inspector Issues
```bash
# If npx command not found, install Node.js first
# Then install inspector globally:
npm install -g @modelcontextprotocol/inspector
```

---

## 🎯 Learning Resources

### MCP (Model Context Protocol)
- [Official MCP Documentation](https://modelcontextprotocol.io/)
- [FastMCP GitHub](https://github.com/jlowin/fastmcp)
- [MCP Specification](https://spec.modelcontextprotocol.io/)

### Weather API
- [wttr.in Documentation](https://github.com/chubin/wttr.in)
- [wttr.in Format Options](https://wttr.in/:help)

### Python Concepts
- [Async/Await in Python](https://docs.python.org/3/library/asyncio.html)
- [Type Hints Guide](https://docs.python.org/3/library/typing.html)
- [urllib Documentation](https://docs.python.org/3/library/urllib.html)

---

## 🚀 Future Enhancements

Potential features to add:

- [ ] Multi-day forecast support
- [ ] Weather alerts and warnings
- [ ] Historical weather data
- [ ] Support for coordinates (lat/long)
- [ ] Caching for frequently requested locations
- [ ] Unit conversion (Celsius ↔ Fahrenheit)
- [ ] More detailed weather information (humidity, wind, pressure)

---

## 🤝 Contributing

This is a learning project, and contributions are welcome!

**How to contribute:**

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Test thoroughly with MCP Inspector
5. Commit: `git commit -m 'Add amazing feature'`
6. Push: `git push origin feature/amazing-feature`
7. Open a Pull Request

**Areas for contribution:**
- Documentation improvements
- Error handling enhancements
- Additional weather features
- Testing and bug fixes
- Performance optimizations

---

## 📄 License

MIT License - see LICENSE file for details.

---

## 📧 Contact

**Naman Garg**
- GitHub: [@Namangarg-01](https://github.com/Namangarg-01)
- Project: [Mcp-server-weather-tool](https://github.com/Namangarg-01/Mcp-server-weather-tool)

---

## 🙏 Acknowledgments

- Built while learning **Model Context Protocol (MCP)**
- Weather data provided by [wttr.in](https://wttr.in/)
- Thanks to **Anthropic** for Claude and MCP documentation
- Special thanks to the **FastMCP** library for simplifying MCP server creation

---

## 📊 Project Stats

- **Language:** Python 3.8+
- **Dependencies:** 2 (mcp, fastmcp)
- **Lines of Code:** ~50
- **Setup Time:** < 2 minutes
- **API Keys Required:** 0 ✨

---

**Made with ❤️ during the MCP learning journey**

*Happy weather checking!* 🌤️