import requests
import datetime

# Replace YOUR_API_KEY with your actual API key from OpenWeatherMap
api_key = "key"
city = "Lugano"

# Set the URL for the OpenWeatherMap API to fetch the current weather in Lugano
url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&units=metric&appid={api_key}"

# Define a dictionary to map weather conditions to icons
icons = {
    "Clear": " ",
    "Clouds": " ",
    "Rain": " ",
    "Thunderstorm": " ",
    "Snow": " ",
    "Mist": "󰖑 ",
    "NightClear": "",
    "NightClouds": "",
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
    # Get the current time and sunset time for the city
    current_time = datetime.datetime.now().time()
    sunset_time = datetime.datetime.fromtimestamp(data["sys"]["sunset"]).time()
    # Determine if it's currently night or day
    is_night = current_time >= sunset_time
    # Assign an icon based on the weather condition and time of day
    if is_night:
        if condition == "Clear":
            icon = icons["NightClear"]
        elif condition == "Clouds":
            icon = icons["NightClouds"]
        else:
            icon = icons.get(condition, "")
    else:
        icon = icons.get(condition, "")
    # Print the current temperature and weather condition
    print(f"{icon} {temperature:.3}°C, {condition}")
else:
    # Print an error message if the request was unsuccessful
    print("Error fetching weather data")

