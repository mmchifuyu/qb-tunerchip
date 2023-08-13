
## Rework of qb-tunerchip

## Features:
Cars handlings Boost is now Standard and not be OP anymore.
Redesign the ui
added commands for changing wallpaper and going back to default.
tunes will save in database
## Commands :
Changewallpaper 
resetwallpaper

## Dependencies
qb-core

## Screenshots
![Tunerchip](https://cdn.discordapp.com/attachments/1053021749127696414/1140390783724302377/brave_p7oRYTjq1R.png)

## Screenshots


## Old Features
- Vehicle tuning with Tunerchip (Item name: tunerlaptop)

## Installation
### Manual
- Download the script and put it in the `[qb]` directory.
- Add the following code to your server.cfg/resouces.cfg
```
ensure qb-tunerchip
```
- Insert The Database
- Add this to your garage when the car spawns
TriggerServerEvent('limbo-tunerchip:getSettings', NetworkGetNetworkIdFromEntity(veh), GetVehicleNumberPlateText(veh))
