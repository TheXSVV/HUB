local window = {}

function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

local utils = loadModuleScript('Utils')

local ClickGUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local LeftPanel = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local TabsLabel = Instance.new("TextLabel")
local SettingsPanel = Instance.new("Frame")

-- Properties

ClickGUI.Name = "ClickGUI"
ClickGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ClickGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ClickGUI
MainFrame.BackgroundColor3 = Color3.new(0.0901961, 0.0901961, 0.0901961)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.273790956, 0, 0.321259856, 0)
MainFrame.Size = UDim2.new(0, 580, 0, 301)

LeftPanel.Name = "LeftPanel"
LeftPanel.Parent = MainFrame
LeftPanel.BackgroundColor3 = Color3.new(0.109804, 0.109804, 0.109804)
LeftPanel.BorderSizePixel = 0
LeftPanel.Size = UDim2.new(0, 151, 0, 301)

TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = LeftPanel
TitleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TitleLabel.BackgroundTransparency = 1
TitleLabel.BorderSizePixel = 0
TitleLabel.Size = UDim2.new(0, 151, 0, 54)
TitleLabel.Font = Enum.Font.FredokaOne
TitleLabel.Text = "HUB"
TitleLabel.TextColor3 = Color3.new(0.568627, 0.568627, 0.568627)
TitleLabel.TextSize = 32
TitleLabel.TextWrapped = true

TabsLabel.Name = "TabsLabel"
TabsLabel.Parent = LeftPanel
TabsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TabsLabel.BackgroundTransparency = 1
TabsLabel.BorderSizePixel = 0
TabsLabel.Position = UDim2.new(0.0799999088, 0, 0.17899999, 0)
TabsLabel.Size = UDim2.new(0, 138, 0, 50)
TabsLabel.Font = Enum.Font.SourceSans
TabsLabel.Text = "MAIN TABS"
TabsLabel.TextColor3 = Color3.new(0.513726, 0.513726, 0.513726)
TabsLabel.TextSize = 16
TabsLabel.TextXAlignment = Enum.TextXAlignment.Left

SettingsPanel.Name = "SettingsPanel"
SettingsPanel.Parent = LeftPanel
SettingsPanel.BackgroundColor3 = Color3.new(1, 1, 1)
SettingsPanel.BackgroundTransparency = 1
SettingsPanel.BorderSizePixel = 0
SettingsPanel.Position = UDim2.new(1, 0, 0, 0)
SettingsPanel.Size = UDim2.new(0, 429, 0, 301)

-- Drag
local frame = MainFrame
local mouse = game.Players.LocalPlayer:GetMouse()

local prevX, prevY = 0, 0
local drag = false

frame.InputBegan:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton1) then
		prevX = mouse.X - frame.AbsolutePosition.X
		prevY = mouse.Y - frame.AbsolutePosition.Y
		drag = true
	end	
end)

frame.InputEnded:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton1) then
		drag = false
	end
end)

mouse.Move:Connect(function()
	if (drag) then
		frame.Position = UDim2.fromOffset(mouse.X - prevX, mouse.Y - prevY)
	end
end)
-- Drag end

ClickGUI.Enabled = false
MainFrame.Visible = false

local elements = {}
local tabs = {}
local tabHeight = 0.095
local tabOffset = 0.332225
window.register_feature = function(feature)
    print('222')
	local Tab = Instance.new("Frame")
	local LeftAscent = Instance.new("Frame")
	local Label = Instance.new("TextLabel")

	Tab.Name = "Tab"
	Tab.Parent = LeftPanel
	Tab.BackgroundColor3 = Color3.new(1, 1, 1)
	Tab.BackgroundTransparency = 1
	Tab.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
	Tab.BorderSizePixel = 0
	Tab.Position = UDim2.new(0, 0, tabOffset, 0)
	Tab.Size = UDim2.new(0, 150, 0, 27)

	LeftAscent.Name = "LeftAscent"
	LeftAscent.Parent = Tab
	LeftAscent.BackgroundColor3 = Color3.new(0.235294, 0.341176, 0.847059)
	LeftAscent.BorderSizePixel = 0
	LeftAscent.Size = UDim2.new(0, 5, 0, 27)

	Label.Name = "Label"
	Label.Parent = Tab
	Label.BackgroundColor3 = Color3.new(1, 1, 1)
	Label.BackgroundTransparency = 1
	Label.Position = UDim2.new(0.126666665, 0, 0, 0)
	Label.Size = UDim2.new(0, 132, 0, 27)
	Label.Font = Enum.Font.SourceSans
	Label.Text = feature:get_title()
	Label.TextColor3 = Color3.new(0.45098, 0.45098, 0.45098)
	Label.TextSize = 16
	Label.TextXAlignment = Enum.TextXAlignment.Left
	
	Tab.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1) then
			change_tab(feature, Tab)
		end
	end)
	tabOffset = tabOffset+tabHeight
	table.insert(tabs, Tab)
	
	if (#tabs == 0) then
		change_tab(feature, Tab)
	end
end

function change_tab(feature, tab)
	for i=1, #tabs do
		tabs[i].BackgroundTransparency = 1
	end
	tab.BackgroundTransparency = 0.98
	
	for i=1, #elements do
		elements[i].Visible = false
	end
	elements = {}
	
	local elementOffset = 0
	local settings = feature:get_settings()
	for i=1, #settings do
		local setting = settings[i]
		utils.switch(settings[i]:get_type())
			.case('checkbox', function()
				local Setting = Instance.new("Frame")
				local SettingTitle = Instance.new("TextLabel")
				local CheckBox = Instance.new("Frame")
				local CheckmarkIcon = Instance.new("ImageLabel")
				
				Setting.Name = "Setting"
				Setting.Parent = SettingsPanel
				Setting.BackgroundColor3 = Color3.new(1, 1, 1)
				Setting.BackgroundTransparency = 1
				Setting.BorderSizePixel = 0
				Setting.Position = UDim2.new(-0.00233100238, 0, 0, 0)
				Setting.Size = UDim2.new(0, 224, 0, 54)

				SettingTitle.Name = "SettingTitle"
				SettingTitle.Parent = Setting
				SettingTitle.BackgroundColor3 = Color3.new(1, 1, 1)
				SettingTitle.BackgroundTransparency = 1
				SettingTitle.BorderSizePixel = 0
				SettingTitle.Position = UDim2.new(0.0572088622, 0, 0.0215904787, 0)
				SettingTitle.Size = UDim2.new(0, 200, 0, 50)
				SettingTitle.Font = Enum.Font.SourceSans
				SettingTitle.Text = "ESP:"
				SettingTitle.TextColor3 = Color3.new(1, 1, 1)
				SettingTitle.TextSize = 14
				SettingTitle.TextXAlignment = Enum.TextXAlignment.Left

				CheckBox.Name = "CheckBox"
				CheckBox.Parent = Setting
				CheckBox.BackgroundColor3 = Color3.new(0.235294, 0.341176, 0.847059)
				CheckBox.BorderColor3 = Color3.new(0.568627, 0.647059, 1)
				CheckBox.Position = UDim2.new(0.201793715, 0, 0.333333343, 0)
				CheckBox.Size = UDim2.new(0, 18, 0, 18)

				CheckmarkIcon.Name = "CheckmarkIcon"
				CheckmarkIcon.Parent = CheckBox
				CheckmarkIcon.BackgroundColor3 = Color3.new(1, 1, 1)
				CheckmarkIcon.BackgroundTransparency = 1
				CheckmarkIcon.Position = UDim2.new(0, 0, -0.0299999993, 0)
				CheckmarkIcon.Size = UDim2.new(0, 18, 0, 18)
				CheckmarkIcon.Image = "rbxassetid://1202200114"
				CheckBox.InputBegan:Connect(function(input)
					if (input.UserInputType == Enum.UserInputType.MouseButton1) then
						if (setting:get_value()) then
							CheckmarkIcon.Visible = false
							setting:set_value(false)
						else
							CheckmarkIcon.Visible = true
							setting:set_value(true)
						end
					end
				end)

				table.insert(elements, Setting)
				table.insert(elements, SettingTitle)
				table.insert(elements, CheckBox)
				table.insert(elements, CheckmarkIcon)
			end)
			.case('slider', function()
				print('it is slider')
			end)
			.process()
	end
end

window.show = function()
	ClickGUI.Enabled = true
	MainFrame.Visible = true
end

window.hide = function()
	ClickGUI.Enabled = false
	MainFrame.Visible = false
end

return window
