local term = require("term")
local component = require("component")
local gpu = component.gpu

gpu.setResolution(14, 7) -- init resolution
gpu.setBackground(0x186311) -- background color
term.clear() -- clear whole screen to cover it with background color and delete old data
-- add few strings for info, you can change it whatever you like
gpu.set(1, 1, 'Total:')
gpu.set(1, 2, 'Players:')

while true do
	gpu.fill(9, 1, 25, 1, ' ') -- clear 'total' area
	gpu.fill(1, 3, 50, 50, ' ') -- clear 'users' area
	players = component.openperipheral_sensor.getPlayers() -- get near players
	gpu.set(8, 1, tostring(#players)) -- set total users count
	if #players > 5 then -- expand resolution to hold more users
		gpu.setResolution(#players*2, #players)
	end
	for i=1, #players do gpu.set(1, i+2, tostring(players[i].name)) end	-- print each player
	os.sleep(1) -- do delay
end
