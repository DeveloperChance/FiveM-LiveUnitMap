# FiveM: Live Unit Map


## Thanks
I used these Libraries in the development of this. thanks guys! <3

| Creator   | Repository Name     | Repository                                     |
|:---------:|:-------------------:|:----------------------------------------------:|
| brouznouf | MySQL Async Library | https://github.com/brouznouf/fivem-mysql-async |


## About
This web application displays emergency, tow, or other units in live time on a map for FiveM RP Servers.


## How it works
This web application functions it a somewhat complex matter. Starting in the server, you, the user, setup your unit details. You'll first setup your Unit Id, followed by your Unit Type and whether or not the GPS is activate. Review **Usage** if you are unsure how to setup your unit details. Your Unit Id and Unit Type, aswell as your steam hex, are saved in either a database or local json file. This based on your installation method.

After setting up your unit details, the server will update a local JSON array serverside and submit it to a web server. The webserver will then hold onto that array locally. The live maps will then submit an AJAX Request to get the new coordiantes of the unit. The map then updates the units on the map.


## Installation
Installation is made easy with mostly drag and drop solutions with a few configuration edits. There is currently only one option for storing unit data:
1. Unit Data Stored Database (Recommended)

### Installation for Database Setup
Not Currently Available

## Usage
#### Setting a Unit ID
This done through the **/uhid** command. There is support for 3-4 Characters in Length Unit ID's.
Example: **/uhid A123**
 
After setting your Unit ID, open the default **F5** Menu to ensure it's set properly.


#### Setting Unit Type
Setting the Unit Type can be done the default **F5** Menu under the Unit ID. To change it, just move to list left or right. 

By default there is only 3 options:
- LEO (Law Enforcement Officer: Displays Blue)
- Fire (EMS or Fire: Displays Red)
- Tow (Mechanic/Tow Units: Displays Orange)


#### Activating the GPS
Activating the GPS is how the server will know to send your coordinates to the Live Map. It can be found under the default **F5** Menu at the bottom under the Unit Type. When you leave the server, it will automatically be deactived and you have to reactive it next time you join.


### Developer Notes
Incomplete: This project is still a work in progress and is incomplete! I am new to scripting for games and there may be better ways to approach settings for FiveM. Feel free to contact me if you have improvements!

Application Zooming: It's a little weird but it works. I am experimenting with other methods that will not distort the coordinates on the map. (It currently doesn't distort coordinates)
