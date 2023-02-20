local visuals = {}

function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

local utils = loadModuleScript('Utils')
local feature = loadModuleScript('Feature')
local checkbox = loadModuleScript('Settings/Checkbox')
local slider = loadModuleScript('Settings/Slider')
local label = loadModuleScript('Settings/Label')

local tab = feature:new('Visuals')
-- Settings
local lbl1 = label:new('Chams')
local chams = checkbox:new('Enable', false)
local chamsTeamCheck = checkbox:new('Team check', false)

local lbl2 = label:new('ESP')
local esp = checkbox:new('Enable', false)
local espTeamCheck = checkbox:new('Team check', false)
local box = checkbox:new('Box', true)
local nametag = checkbox:new('Nametag', false)
local healthBar = checkbox:new('Health Bar', false)
tab:add_settings({ lbl1, chams, chamsTeamCheck })
tab:add_settings({ lbl2, esp, espTeamCheck, box, nametag, healthBar })

-- Data Variables
local chamsHighlights = {}
local espBillboards = {}

visuals.register_me = function(window)
    window.register_feature(tab)
end

chams.click_handle = function()
	if (chams:get_value()) then
		for _, player in pairs(game.Players:GetPlayers()) do
			if (player.UserId ~= game.Players.LocalPlayer.UserId) then
				if (chamsTeamCheck:get_value() and player.Team ~= nil and game.Players.LocalPlayer.Team ~= nil and player.Team.Name ~= game.Players.LocalPlayer.Team.Name) then continue end

				addToChams(player.Character)
				game.Players.PlayerAdded:Connect(function(player)
					if (chams:get_value()) then
						addToChams(player.Character)
					end
				end)
			end
		end
	else
		clearChams()
	end
end

function addToChams(player)
	local hl = Instance.new('Highlight')
	hl.Parent = player
	hl.Adornee = player
	hl.OutlineColor = Color3.fromRGB(150, 0, 0)
	hl.OutlineTransparency = 0
	hl.FillTransparency = 1
	
	table.insert(chamsHighlights, hl)
end

function reloadChams()
	clearEsp()
	chams.click_handle()
end

esp.click_handle = function()
	if (esp:get_value()) then
		for _, player in pairs(game.Players:GetPlayers()) do
			if (player.UserId ~= game.Players.LocalPlayer.UserId) then
				if (espTeamCheck:get_value() and player.Team ~= nil and game.Players.LocalPlayer.Team ~= nil and player.Team.Name ~= game.Players.LocalPlayer.Team.Name) then continue end
				
				if (player.Team ~= nil) then
					print(player.Team.Name)
				end
				if (game.Players.LocalPlayer.Team ~= nil) then
					print(game.Players.LocalPlayer.Team.Name)
				end
				addToEsp(player)
				game.Players.PlayerAdded:Connect(function(player)
					if (esp:get_value()) then
						addToEsp(player)
					end
				end)
			end
		end
	else
		clearEsp()
	end
end

function reloadEsp()
	clearEsp()
	esp.click_handle()
end

espTeamCheck.click_handle = reloadEsp
box.click_handle = reloadEsp
nametag.click_handle = reloadEsp
healthBar.click_handle = reloadEsp

function addToEsp(player)
	local bbgui = Instance.new('BillboardGui')
	bbgui.Parent = player.Character
	bbgui.Adornee = player.Character
	bbgui.AlwaysOnTop = true
	bbgui.ResetOnSpawn = false
	bbgui.Size = UDim2.new(3.5, 0, 5, 0)
	bbgui.ClipsDescendants = false

	if (box:get_value()) then
		local left = Instance.new('Frame')
		left.Parent = bbgui
		left.BorderSizePixel = 1
		left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		left.Size = UDim2.new(0, 1, 1, 0)
		left.Parent = bbgui

		local right = left:Clone()
		right.Parent = bbgui
		right.BorderSizePixel = 1
		right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		right.Size = UDim2.new(0, -1, 1, 0)
		right.Position = UDim2.new(1, 0, 0, 0)

		local top = left:Clone()
		top.Parent = bbgui
		top.BorderSizePixel = 1
		top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		top.Size = UDim2.new(1, 0, 0, 1)

		local bottom = left:Clone()
		bottom.Parent = bbgui
		bottom.BorderSizePixel = 1
		bottom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		bottom.Size = UDim2.new(1, 0, 0, -1)
		bottom.Position = UDim2.new(0, 0, 1, 0)
	end
	
	if (nametag:get_value()) then
		local nametagGui = Instance.new('BillboardGui')
		nametagGui.Parent = player.Character
		nametagGui.Adornee = player.Character
		nametagGui.Size = UDim2.new(3.5, 0, 6.5, 0)
		nametagGui.AlwaysOnTop = true
		nametagGui.ResetOnSpawn = false
		nametagGui.ClipsDescendants = false

		local nametagLabel = Instance.new('TextLabel')
		nametagLabel.Parent = nametagGui
		nametagLabel.Size = UDim2.new(1, 0, 0, 20)
		nametagLabel.TextSize = 16
		nametagLabel.Text = player.Name
		nametagLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		if (player.Team ~= nil) then
			nametagLabel.TextColor3 = player.TeamColor.Color
		end
		nametagLabel.TextStrokeTransparency = 0.5
		nametagLabel.BackgroundTransparency = 1
		nametagLabel.Font = Enum.Font.Roboto

		table.insert(espBillboards, nametagGui)
	end

	if (healthBar:get_value()) then
		local healthGui = Instance.new('BillboardGui')
		healthGui.Parent = player.Character
		healthGui.Adornee = player.Character
		healthGui.AlwaysOnTop = true
		healthGui.Size = UDim2.new(4.5, 0, 5, 0)
		healthGui.ClipsDescendants = false
		healthGui.ResetOnSpawn = false

		local gradientLine = Instance.new('Frame')
		gradientLine.Parent = healthGui
		gradientLine.Position = UDim2.new(0, 0, 0, 0)
		gradientLine.Size = UDim2.new(0, 2, 1, 0)
		gradientLine.BorderSizePixel = 1
		local gradient = Instance.new('UIGradient')
		gradient.Parent = gradientLine
		gradient.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 150, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0))}
		gradient.Rotation = 90

		local textGui = Instance.new('BillboardGui')
		textGui.Parent = player.Character
		textGui.Adornee = player.Character
		textGui.AlwaysOnTop = true
		textGui.ClipsDescendants = false
		textGui.ResetOnSpawn = false

		local hpText = Instance.new('TextLabel')
		hpText.BackgroundTransparency = 1
		hpText.Size = UDim2.new(1, 0, 0.2, 0)
		hpText.Parent = textGui
		hpText.Font = Enum.Font.Nunito
		hpText.TextSize = 14
		hpText.TextXAlignment = Enum.TextXAlignment.Left
		hpText.TextStrokeTransparency = 0.5
		hpText.TextColor3 = Color3.fromRGB(255, 255, 255)
		hpText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		hpText.Text = math.round(player.Character:WaitForChild('Humanoid').Health) .. 'hp'
		textGui.Size = UDim2.new(5.1+(utils.string_width(hpText.Text, hpText.Font, hpText.TextSize) * 10), 0, 6, 0)

		player.Character:WaitForChild('Humanoid').Changed:Connect(function(property)
			if (property == 'Health' and hpText ~= nil and textGui ~= nil) then
				hpText = math.round(player.Character:WaitForChild('Humanoid').Health) .. 'hp'
				textGui.Size = UDim2.new(5+(utils.string_width(hpText.Text, hpText.Font, hpText.TextSize) * 10), 0, 6, 0)
			end
		end)
		
		table.insert(espBillboards, healthGui)
		table.insert(espBillboards, textGui)
	end
	
	table.insert(espBillboards, bbgui)
end

function clearEsp()
	for i=1, #espBillboards do
		espBillboards[i]:Destroy()
	end
	espBillboards = {}
end

function clearChams()
	for i=1, #chamsHighlights do
		chamsHighlights[i]:Destroy()
	end
	chamsHighlights = {}
end

return visuals
