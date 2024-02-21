Hello RC Maniac,

Thank you for supporting FM2M development.
Happy to bring you fresh FM2M ToolBox 0.80 Release

!!! IMPORTANT !!!
!!! This version is unified for all radios and all systems (EdgeTX, OpenTx, FreedomTX)
!!! Configuration format changed. DON'T USE previous *.cfg files from /FM2M/TOOLBOX/CONFIG/ or app may be unstable or crash.

0.80 New Features
-----------------------------
* [Color] New redesigned Dashboard
* [Color] MSP protocol for all protocols CRSF (TBS,ELRS), GHOST, D16 (requires BetaFlight 4.3 or newer)
* [Color] GPS sensors support
* [Color] GPS panel & module showing all data (satellites number & fix, craft position, home position, distance to home and bearing
* [Color] Artificial horizon with Speed (Ground), Altitude (ASL), Pitch, Roll, Heading & Home marker
* [Color] Compass with Bearing (GYRO & GPS) and Home position (GPS)
* [Color] Config - Dashboard dim
* [Color] Config - Menu behaviour on RTN progress
* [Color] Widget run in full screen layout will auto-start with radio power on

* [BW] redesigned Dashboard
* [BW] new Quick menu option 'Reset all'
* [BW] Radiomaster Boxer radio added

* [All] Persistent telemetry data until you reset it
* [All] Exiting config option edit will revert to previous values
* [All] ELRS v3 config settings for proper RF mode display
* [All] ELRS v3 RF mode display
* [All] VTX connected via MSP is now available (BF4.4 required)

0.80 Fixes
-----------------------------
* [BW] Trims are auto-sensed in Config module
* [X9D] +/- menu key bindings changed
* [All] FrSky Telemetry will fallback to analog A2 sensor if FC is not connected
* [OpenTX] RC2 bug fix preventing app execution

0.80 Known issues and limitations
---------------------------------
* [BW] MSP is not implemented in Black & White LCD radios
* [Zorro] Due to a EdgeTX bug PAGE< and PAGE> keys don't work in Telemetry mode.
* [Color] Artificial horizon is not implemented in OpenTX version
* [Ghost] Artificial horizon is not working due to a lack of pitch and roll telemetry sensors

0.80 Recommended firmware versions
----------------------------------
* EdgeTX 2.7.1+
* CRSF 6.14+
* Ghost 1.6+
* ELRS 2.0+
* FrSky D8,D16 ACCST 1.0+ (Access and 2.0 may work not tested)


0.80 INSTALATION
--------------------
1. Unpack downloaded zip file
2. If you have previous PRO version backup vc.fm2m file from /FM2M/VC/ folder on your SD Card
3. Move unpacked FM2M,SCRIPTS & WIDGETS folders to the root folder of your SD Card.
- If asked about folders replacement choose "Merge"
- If asked about files replacement choose "Replace"
4.If you have PRO version move backuped vc.fm2m file to the new /FM2M/VC/ folder on SD card


RUNNING APP
-----------
A. Stand Alone mode

Once installed app will be visible in TOOLS tab in EdgeTX or OpenTX as "FM2M ToolBox 0.80" or "FM2MToolBox080"
Shortcuts to open TOOLS tab are:
B&W LCD radios
- long left joystick press on XLite
- long press MENU key on rest of FrSky radios
- long press SYS key on Radiomaster radios
Color LCD radios
- long press SYS key

B. Background mode

Widget on Color LCD radios
1. Add "FM2M ToolBox" widget to one of your main views
2. If in non full screen layout, switch on PREVIEW option in Widget's settings to see ToolBox telemetry preview.
4. Long tap or select 'Full Screen' to open ToolBox
5. To go back to system press EXIT key while in Dashboard
6. If widget is set on full screen Toolbox will start immediately but will be in view mode. (Lock icon displayed)
To use keys long tap or select 'Full Screen'

KEY SHORTCUTS
-------------
[BW LCD radios]

All modules
MENU or MDL - shows quick menu

Quick menu
Mute/enable alerts - mutes/enables audible alerts
Reset timer - resets selected timer
Resets all - resets all data (telemetry, MSP, VTX)

Menu module
NEXT & PREV - selects module to display
ENTER - displays module

Dashboard
PAGE> (or PAGE short) - shows & hides Telemetry sensors

Configuration module
NEXT & PREV - selects options or change option value
PAGE> (or PAGE short) & PAGE< (or PAGE long) - switches config pages
ENTER - saves option change
EXIT - revert change

Video TX module
NEXT & PREV - selects channel
PAGE> (or PAGE short) & PAGE< (or PAGE long) - switches VTX pages (Chart & Table view)

Stick commands module
NEXT & PREV - scrolls commands' list
PAGE> (or PAGE short) & PAGE< (or PAGE long) - switches temporarily radio mode

FC Arm Stops module
NEXT & PREV - scrolls errors' list
PAGE> (or PAGE short) & PAGE< (or PAGE long) - switches error's view (selected error, description, proposed action )
ENTER - plays beep error preview


[Color LCD radios]

Dashboard
SYS - opens module selection (MENU)
MDL short - mutes/enables audible alerts
MDL long - resets all data (telemetry, MSP, VTX)
TELE - switches beetween Compass & GPS data view

Menu module
NEXT & PREV - selects module to display
ENTER - displays module

Configuration module
NEXT & PREV - selects options or change option value
PAGE> & PAGE< - switches pages
ENTER - saves option changes
EXIT - revert changes

Video TX module
NEXT & PREV - selects channel
PAGE> & PAGE< - switches pages (Chart & Table view)
MDL short - changes VTX power level
TELE - switches Band lock selection mode
ENTER - sets VTX (MSP only)

Stick commands module
NEXT & PREV - scrolls commands' list
PAGE> & PAGE< - switches temporarily radio mode

FC Arm Stops module
NEXT & PREV - scrolls errors' list
ENTER - plays beep error preview

Raw Telemetry module
NEXT & PREV - scrolls sensors' list

GPS module
no key bindings yet :)

About
PAGE> & PAGE< - switches info pages


SUPPORT
-------
If you have any questions, want to submit a bug, check development progress join FM2M Facebook group.
https://www.facebook.com/groups/FlyMe2TheMoon


Happy flying to the moon
Robert
