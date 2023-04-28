import requests

# Replace YOUR_API_KEY with your actual API key from OpenWeatherMap
api_key = "f516d1196fa1a4b71bf35b30ad59c39e"

# Set the URL for the OpenWeatherMap API to fetch the current weather in Zurich
url = f"http://api.openweathermap.org/data/2.5/weather?q=Lugano&units=metric&appid={api_key}"

# Define a dictionary to map weather conditions to icons
icons = {
    "Clear": " ",
    "Clouds": " ",
    "Rain": " ",
    "Thunderstorm": " ",
    "Snow": " ",
    "Mist": "󰖑 "
}

# Make a request to the API
response = requests.get(url)

# Check if the response was successful (i.e., has a status code of 200)
if response.status_code == 200:
    # Parse the JSON data from the response
    data = response.json()
    # Extract the current temperature and weather condition from the JSON data
    temperature = data["main"]["temp"]
    condition = data["weather"][0]["main"]
    # Assign an icon based on the weather condition
    icon = icons.get(condition, "")
    # Print the current temperature and weather condition
    print(f"{icon} {temperature:.3}°C, {condition}")
else:
    # Print an error message if the request was unsuccessful
    print("Error fetching weather data")

