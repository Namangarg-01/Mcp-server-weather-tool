import urllib.request # It helps to send request to a particular URL 
import urllib.parse

def get_weather(location: str) -> dict:
    """
    Fetches the weather for a given location.
    Args:
        location (str) : The city of location name ( eg: New York)
    Returns:
        str: Concise weather information for the location.
    """

    try:
        location = location.lower()
        location = urllib.parse.quote(location)
        #location = location.replace(" ", "-")
        url = f"https://wttr.in/{location}?format=3"
        with urllib.request.urlopen(url) as response:
            result = response.read().decode('utf-8').strip()
            return {"result": result}
    except Exception as e:
        return {"error": str(e)}
    

# if __name__ == "__main__":
#     report = get_weather("New York")
#     print(report)