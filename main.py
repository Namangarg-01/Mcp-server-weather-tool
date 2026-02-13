from mcp.server.fastmcp import FastMCP
from tools.weather import get_weather
from typing import Dict, Any

mcp = FastMCP("Weather Checker")


#converting function into a tool
@mcp.tool()
async def check_weather(location : str) -> Dict[str, Any]:
    """
    Get weather info for specific location.
    """
    return get_weather(location)


if __name__ == "__main__":
    mcp.run(transport="stdio")
