--[[#############################################################################
GPS stats viewer v1.2
Copyright (C) by mosch   
License GPLv2: http://www.gnu.org/licenses/gpl-2.0.html       
GITHUB: https://github.com/moschotto?tab=repositories


Description:

reads the "GPSpositions.txt" log-file which was generated by the GPS.lua script.
useful if want to check the last GPS coordinates after a crash, power loss etc. 

copy "GPSviewer.lua" to the /SCRIPTS/TOOLS/ folder

################################################################################]]


local toolName = "TNS|GPS stats T16|TNE"
local log_filename = "/LOGS/GPSpositions.txt"
local file_exist = false
local string_gmatch = string.gmatch
local coordinates = {}  
local coordinates_tmp = {}  
local linectr = 0
local item = 0

local function splitstring(text)

	if text ~= nil then
		local text_split = {} 
		local i=0
		--split by "," and store into array/table
		for word in string_gmatch(text, "([^,]+)") do				
			text_split[i] = word
			i = i + 1					
		end	

		return text_split
	end 
end

local function Viewer_Draw_LCD(item)
  
	-- display T16: 480*272px
  	lcd.clear() 	
	
	lcd.setColor(CUSTOM_COLOR, lcd.RGB(0x9D, 0xD6, 0x00))	
	lcd.drawFilledRectangle(1,0, 480, 28, CUSTOM_COLOR)				
	lcd.setColor(CUSTOM_COLOR, lcd.RGB(0x00, 0x00, 0x00))	
	
	lcd.drawLine(125,29, 125, 95, SOLID, CUSTOM_COLOR)		
	lcd.drawText(0,0,"GPS stats viewer v1.2" ,MIDSIZE)
	lcd.drawLine(0,28,480,28, SOLID, CUSTOM_COLOR)	
		
	lcd.drawText(2,45, "No# " ..(linectr -item).."/" .. linectr,MIDSIZE)	
	lcd.drawText(130,28, "Sats: ",MIDSIZE)	
	lcd.drawLine(125,60, 480, 60, SOLID, CUSTOM_COLOR)	
	
	lcd.drawText(130,63, "ALT: ",MIDSIZE)	
	lcd.drawText(290,63, "Speed: ",MIDSIZE)	
	lcd.drawLine(0,95, 480, 95, SOLID, CUSTOM_COLOR)		
	
	if linectr > 4 then
	
		if item < 4 then
			--first 4 rows static
			local line0 = splitstring(coordinates[0])
			local line1 = splitstring(coordinates[1])
			local line2 = splitstring(coordinates[2])
			local line3 = splitstring(coordinates[3])
		
			if item == 0 then
				lcd.drawText(290,28, "Time: " .. string.gsub(line0[3], "%s+", ""), MIDSIZE )
				lcd.drawText(130,28, "Sats: " .. string.gsub(line0[4], "%s+","") ,MIDSIZE)	
				lcd.drawText(130,63, "ALT: " .. string.gsub(line0[5] , "%s+", "") .."m", MIDSIZE )
				lcd.drawText(290,63, "Speed: " .. string.gsub(line0[6], "%s+","") .."kmh",MIDSIZE)				
				lcd.drawText(2,100, "# ".. line0[1] ..", " .. line0[2] ,DBLSIZE + BLINK + INVERS)		
			else
				lcd.drawText(2,100, "# ".. line0[1] ..", " .. line0[2] ,DBLSIZE)
			end 
			
			if item == 1 then
				lcd.drawText(290,28, "Time: " .. string.gsub(line1[3], "%s+", ""), MIDSIZE)
				lcd.drawText(130,28, "Sats: " .. string.gsub(line1[4], "%s+","") ,MIDSIZE)	
				lcd.drawText(130,63, "ALT: " .. string.gsub(line1[5] , "%s+", "").."m", MIDSIZE )
				lcd.drawText(290,63, "Speed: " .. string.gsub(line1[6] , "%s+","") .."kmh",MIDSIZE)				
				lcd.drawText(2,140, "# ".. line1[1] ..", " .. line1[2] ,DBLSIZE + BLINK + INVERS)
			else
				lcd.drawText(2,140, "# ".. line1[1] ..", " .. line1[2] ,DBLSIZE)
			end  
			
			if item == 2 then
				lcd.drawText(290,28, "Time: " .. string.gsub(line2[3], "%s+", ""), MIDSIZE)
				lcd.drawText(130,28, "Sats: " .. string.gsub(line2[4], "%s+","") ,MIDSIZE)	
				lcd.drawText(130,63, "ALT: " .. string.gsub(line2[5] ,"%s+", "").."m", MIDSIZE )
				lcd.drawText(290,63, "Speed: " .. string.gsub(line2[6], "%s+","") .."kmh",MIDSIZE)				
				lcd.drawText(2,180, "# ".. line2[1] ..", " .. line2[2] ,DBLSIZE + BLINK + INVERS)
			else
				lcd.drawText(2,180, "# ".. line2[1] ..", " .. line2[2] ,DBLSIZE)
			end 
			
			if item == 3 then
				lcd.drawText(290,28, "Time: " .. string.gsub(line3[3], "%s+", ""), MIDSIZE)
				lcd.drawText(130,28, "Sats: " .. string.gsub(line3[4], "%s+","") ,MIDSIZE)	
				lcd.drawText(130,63, "ALT: " .. string.gsub(line3[5], "%s+", "").."m", MIDSIZE )
				lcd.drawText(290,63, "Speed: " .. string.gsub(line3[6] , "%s+","") .."kmh",MIDSIZE)				
				lcd.drawText(2,220, "# ".. line3[1] ..", " .. line3[2] ,DBLSIZE + BLINK + INVERS)
			else
				lcd.drawText(2,220, "# ".. line3[1] ..", " .. line3[2] ,DBLSIZE)
			end  
		else
							
			local line0 = splitstring(coordinates[item-3])
			local line1 = splitstring(coordinates[item-2])
			local line2 = splitstring(coordinates[item-1])
			local line3 = splitstring(coordinates[item])
		
			lcd.drawText(290,28, "Time: " .. string.gsub(line3[3], "%s+", ""), MIDSIZE)
			lcd.drawText(130,28, "Sats: " .. string.gsub(line3[4], "%s+","") ,MIDSIZE)	
			lcd.drawText(130,63, "ALT: " .. string.gsub(line3[5] , "%s+", "").."m", MIDSIZE )
			lcd.drawText(290,63, "Speed: " .. string.gsub(line3[6] , "%s+","").."kmh" ,MIDSIZE)	
			lcd.drawText(2,100, "# ".. line0[1] ..", " .. line0[2] ,DBLSIZE)
			lcd.drawText(2,140, "# ".. line1[1] ..", " .. line1[2] ,DBLSIZE)
			lcd.drawText(2,180, "# ".. line2[1] ..", " .. line2[2] ,DBLSIZE)
			lcd.drawText(2,220, "# ".. line3[1] ..", " .. line3[2] ,DBLSIZE + BLINK + INVERS)
			
		end 
	
	else
		--display error message
		lcd.clear() 
		lcd.setColor(CUSTOM_COLOR, lcd.RGB(0x9D, 0xD6, 0x00))	
		lcd.drawFilledRectangle(1,0, 480, 28, CUSTOM_COLOR)				
		lcd.setColor(CUSTOM_COLOR, lcd.RGB(0x00, 0x00, 0x00))			
		lcd.drawText(2,1,"GPS stats viewer" ,MIDSIZE)		
		lcd.drawText(10,70, "more than 4 entries in GPS logfile needed", MIDSIZE + BLINK + INVERS)			
		lcd.drawText(10,110, log_filename, MIDSIZE + BLINK + INVERS)		
	end	


end

local function Viewer_Init()
	
	lcd.clear() 
	local f2 = io.open(log_filename, "r")	
	
	--check if file exists 
	if f2 ~= nil then
			
		file_exist = true
		buffer = io.read(f2, 4096)
		io.close(f2)

		--read file contents into array/table
		for line in string_gmatch(buffer, "([^\n]+)\n") do			
			if not string.find(line, "Number")  then --exclude logfile headline
				coordinates[linectr] = line		
				linectr = linectr + 1
			end			
		end			
				
		--reverse array/table contents		
		for k in pairs (coordinates) do coordinates_tmp[k] = coordinates[k] end
		j=0
		for i = linectr,1,-1 do		
			 coordinates[j] = coordinates_tmp[i-1]
			 j = j + 1
		end	
	
		--draw inital screen
		Viewer_Draw_LCD(0)
				
	else
		file_exist = false		
	end
 end


-- Main
local function Viewer_Run(event, touchState)
  
	if event == nil then
		error("Cannot be run as a model script!")
		return 2
	else		
		
		if file_exist == true then		
			
			Viewer_Draw_LCD(item)  
			--handle scroll counter
			if event == EVT_ROT_RIGHT or event == EVT_PLUS_FIRST then 		
				if item  < linectr-1 then
					item = item + 1
				end						  
			end					
			if event == EVT_ROT_LEFT or event == EVT_MINUS_FIRST then      
				if item > 0 then
					item = item - 1								
				end		
			end
				
			--handle touch events
			if touchState then 
				if event == EVT_TOUCH_SLIDE  then
				
					if touchState.swipeUp then
						if item  < linectr-1 then
							item = item + 1
						end	
					elseif touchState.swipeDown then
						if item > 0 then
							item = item - 1								
						end	
					end
				end			
			end
		
		else
			--display error message
			lcd.clear() 
			lcd.drawLine(0,0,0,64, SOLID, CUSTOM_COLOR)	
			lcd.drawLine(480,0,480,64, SOLID, CUSTOM_COLOR)
			lcd.drawText(2,1,"GPS stats viewer" ,MIDSIZE)					
			lcd.drawText(0,94, "Logfile does not exist", MIDSIZE)	
			lcd.drawText(0,128, log_filename, MIDSIZE + BLINK)		
			lcd.drawLine(0,62, 480, 62, SOLID, CUSTOM_COLOR)					
		end
		
		if event == EVT_VIRTUAL_EXIT then
			return 2
		end
								
	end
	return 0	
end

return { init=Viewer_Init, run=Viewer_Run }
