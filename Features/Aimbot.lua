local aimbot = {}

function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

local feature = loadModuleScript('Feature')
local checkbox = loadModuleScript('Settings/Checkbox')
local slider = loadModuleScript('Settings/Slider')
local label = loadModuleScript('Settings/Label')

-- Settings
local lbl1 = label:new('Aimbot')
local aimbot = checkbox:new('Enable', false)
local aimbotTeamCheck = checkbox:new('Team check', false)
tab:add_settings({ lbl1, aimbot, aimbotTeamCheck })

-- Data Variables

aimbot.register_me = function(window)
    window.register_feature(tab)
end

local target = nil
local hold = false

game:GetService('UserInputService').InputBegan:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton1) then
		hold = true
	end
end)

game:GetService('UserInputService').InputEnded:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton1) then
		hold = false
	end
end)

game:GetService('RunService').RenderStepped:Connect(function()
	if (target == nil or not isValid(target)) then
		target = getTarget()
	end
	if (target == nil or not hold) then return end
	
	game.Workspace.CurrentCamera.CFrame = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, target.Head.Position)
end)

function isValid(player)
	if (player.Name ~= game.Players.LocalPlayer.Name) then return false end
	
	return true
end

function getTarget()
	for _, player in pairs(game.Players:GetPlayers()) do
		if (isValid(player)) then
			target = player
		end
	end
end

return aimbot
