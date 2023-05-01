import subprocess
import json
import os

api_key = os.environ.get("OPENWEATHERMAP_API_KEY")
city = "Novaggio"

command = [ "curl", "--location", "--request", "GET",  
            f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}" ]

try:
    response = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL).stdout.decode('utf-8')
    if 'error' in response: 
        print("Error: " + response)
    else:
        data = json.loads(response)
        temperature = round(data["main"]["temp"] - 273.15, 1)
        description = data["weather"][0]["description"]
        print(f"The temperature in {city} is {temperature} degrees Celsius and the weather is {description}.")

# Could not connect or parse response.
except(json.JSONDecodeError) as e:
    print("Error: " + str(e))

