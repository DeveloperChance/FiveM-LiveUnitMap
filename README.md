# FiveM: Live Unit Map


## Requirements:
For the In-Game Unit Menu (INCLUDED IN RELEASE):
https://github.com/FrazzIe/NativeUILua


## About
This map is to display emergency or tow units in live time from a RP FiveM server on a Web Application.

The FiveM Scripts are scripted to where the user will setup their Unit Number, Type, and whether they are active through a menu, hot-key to open this menu can be changed through the handler lua script under the properties at the top. These settings are saved in a JSON file which the lua script will pull from. It will take the Coordinates of each active unit and create a JSON object and submit them to a web server. The Web Server will convert the JSON Object into a JSON File.

The Web Application will run an AJAX call to the URL this JSON file is stored on. It will then update the map with all the units and their locations.

## INSTALLATION
Not Ready for installation..


### Developer Notes
Incomplete: This project is still a work in progress and is incomplete! I am new to scripting for games and there may be better ways to approach settings for FiveM. Feel free to contact me if you have improvements!

Application Zooming: It's a little weird but it works. I am experimenting with other methods that will not distort the coordinates on the map. (It currently doesn't distort coordinates)
