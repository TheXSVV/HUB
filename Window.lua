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

local Profile = Instance.new("Frame")
local Avatar = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")

-- Properties

ClickGUI.Name = "ClickGUI"
ClickGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ClickGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ClickGUI.AutoLocalize = false

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

Profile.Name = "Profile"
Profile.Parent = LeftPanel
Profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Profile.BackgroundTransparency = 1.000
Profile.BorderColor3 = Color3.fromRGB(27, 42, 53)
Profile.BorderSizePixel = 0
Profile.Position = UDim2.new(0, 0, 0.833887041, 0)
Profile.Size = UDim2.new(0, 150, 0, 50)

Avatar.Name = "Avatar"
Avatar.Parent = Profile
Avatar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Avatar.BackgroundTransparency = 0.700
Avatar.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
Avatar.Size = UDim2.new(0, 40, 0, 40)
Avatar.Image = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)

UICorner.CornerRadius = UDim.new(0, 50)
UICorner.Parent = Avatar

TextLabel.Parent = Profile
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.379999995, 0, 0.119999997, 0)
TextLabel.Size = UDim2.new(0, 78, 0, 20)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = game.Players.LocalPlayer.Name
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 18.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

TextLabel_2.Parent = Profile
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.379999995, 0, 0.400000006, 0)
TextLabel_2.Size = UDim2.new(0, 78, 0, 20)
TextLabel_2.Font = Enum.Font.FredokaOne
TextLabel_2.Text = '#' .. tostring(game.Players.LocalPlayer.UserId):sub(0, 4)
TextLabel_2.TextColor3 = Color3.fromRGB(171, 171, 171)
TextLabel_2.TextSize = 16.000
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

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
	
	if (#tabs == 1) then
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
	
    local xOffset = 0
	local elementOffset = 0.02159
	local settings = feature:get_settings()
	for i=1, #settings do
		local setting = settings[i]
		local text = setting:get_title()..':'
		
		local Setting = Instance.new("Frame")
		Setting.Name = "Setting"
		Setting.Parent = SettingsPanel
		Setting.BackgroundColor3 = Color3.new(1, 1, 1)
		Setting.BackgroundTransparency = 1
		Setting.BorderSizePixel = 0
		Setting.Position = UDim2.new(-0.00233100238, 0, 0, 0)
		Setting.Size = UDim2.new(0, 224, 0, 54)
        table.insert(elements, Setting)

        if (setting:get_type() == 'label') then
			local SettingTitle = Instance.new("TextLabel")
			SettingTitle.Name = "SettingTitle"
			SettingTitle.Parent = Setting
			SettingTitle.BackgroundColor3 = Color3.new(1, 1, 1)
			SettingTitle.BackgroundTransparency = 1
			SettingTitle.BorderSizePixel = 0
			SettingTitle.Position = UDim2.new(xOffset+0.08, 0, elementOffset, 0)
			SettingTitle.Size = UDim2.new(0, 800, 0, 50)
			SettingTitle.Font = Enum.Font.FredokaOne
			SettingTitle.Text = text
			SettingTitle.TextColor3 = Color3.new(1, 1, 1)
			SettingTitle.TextSize = 18
			SettingTitle.TextXAlignment = Enum.TextXAlignment.Left
			table.insert(elements, SettingTitle)
            
			elementOffset = elementOffset+0.48
		else
            local SettingTitle = Instance.new("TextLabel")
            SettingTitle.Name = "SettingTitle"
            SettingTitle.Parent = Setting
            SettingTitle.BackgroundColor3 = Color3.new(1, 1, 1)
            SettingTitle.BackgroundTransparency = 1
            SettingTitle.BorderSizePixel = 0
            SettingTitle.Position = UDim2.new(xOffset+0.0572, 0, elementOffset, 0)
            SettingTitle.Size = UDim2.new(0, 800, 0, 50)
            SettingTitle.Font = Enum.Font.SourceSans
            SettingTitle.Text = text
            SettingTitle.TextColor3 = Color3.new(1, 1, 1)
            SettingTitle.TextSize = 14
            SettingTitle.TextXAlignment = Enum.TextXAlignment.Left
            table.insert(elements, SettingTitle)

            utils.switch(settings[i]:get_type())
                .case('checkbox', function()
                    local CheckBox = Instance.new("Frame")
                    local CheckmarkIcon = Instance.new("ImageLabel")

                    CheckBox.Name = "CheckBox"
                    CheckBox.Parent = Setting
                    CheckBox.BackgroundColor3 = Color3.new(0.235294, 0.341176, 0.847059)
                    CheckBox.BorderColor3 = Color3.new(0.568627, 0.647059, 1)
                    CheckBox.Position = UDim2.fromScale(SettingTitle.Position.X.Scale+utils.string_width(text, SettingTitle.Font, SettingTitle.TextSize), elementOffset+0.3)
                    CheckBox.Size = UDim2.new(0, 18, 0, 18)

                    CheckmarkIcon.Name = "CheckmarkIcon"
                    CheckmarkIcon.Parent = CheckBox
                    CheckmarkIcon.BackgroundColor3 = Color3.new(1, 1, 1)
                    CheckmarkIcon.BackgroundTransparency = 1
                    CheckmarkIcon.Position = UDim2.new(0, 0, -0.028, 0)
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

                            if (setting.click_handle) then
                                setting.click_handle()
                            end
                        end
                    end)
                    CheckmarkIcon.Visible = setting:get_value()

                    table.insert(elements, CheckBox)
                    table.insert(elements, CheckmarkIcon)
                    
                    elementOffset = elementOffset+0.54
                end)
                .case('slider', function()
                    local sliderText
                    if (math.floor(setting:get_value()) == setting:get_value()) then
                        sliderText = tostring(math.round(setting:get_value()))
                    else
                        sliderText = string.format('%.1f', setting:get_value())
                    end
                    
                    local Slider = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local TextLabel = Instance.new("TextLabel")
                    local Circle = Instance.new("Frame")
                    local UICorner_2 = Instance.new("UICorner")
                    
                    Slider.Name = "Slider"
                    Slider.Parent = Setting
                    Slider.BackgroundColor3 = Color3.new(0.235294, 0.341176, 0.847059)
                    Slider.Position = UDim2.new(0.0535714291, 0, elementOffset+0.65, 0)
                    Slider.Size = UDim2.new(0, 150, 0, 5)

                    UICorner.Parent = Slider
                    UICorner.CornerRadius = UDim.new(0, 14)

                    TextLabel.Parent = Slider
                    TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                    TextLabel.BackgroundTransparency = 1
                    TextLabel.Position = UDim2.new(1.05299997, 0, -1, 0)
                    TextLabel.Size = UDim2.new(0, 24, 0, 13)
                    TextLabel.Font = Enum.Font.SourceSans
                    TextLabel.Text = sliderText
                    TextLabel.TextColor3 = Color3.new(1, 1, 1)
                    TextLabel.TextSize = 14

                    Circle.Name = "Circle"
                    Circle.Parent = Slider
                    Circle.BackgroundColor3 = Color3.new(1, 1, 1)
                    Circle.Position = UDim2.new(setting:calc_slider_circle(), 0, -0.400000393, 0)
                    
                    Circle.Size = UDim2.new(0, 9, 0, 9)

                    UICorner_2.Parent = Circle
                    UICorner_2.CornerRadius = UDim.new(0, 16)
                    Slider.InputBegan:Connect(function(input)
                        if (input.UserInputType == Enum.UserInputType.MouseButton1) then
                            setting.sliding = true
                            drag = false
                        end
                    end)
                    Slider.InputEnded:Connect(function(input)
                        if (input.UserInputType == Enum.UserInputType.MouseButton1) then
                            setting.sliding = false
                        end
                    end)
                    mouse.Move:Connect(function()
                        if (setting.sliding) then
                            setting:set_value((mouse.X - Slider.AbsolutePosition.X) * (setting:get_max() - setting:get_min()) / Slider.AbsoluteSize.X + setting:get_min())
                            Circle.Position = UDim2.new(setting:calc_slider_circle(), 0, -0.400000393, 0)
                            if (math.floor(setting:get_value()) == setting:get_value()) then
                                sliderText = tostring(math.round(setting:get_value()))
                            else
                                sliderText = string.format('%.1f', setting:get_value())
                            end
                            TextLabel.Text = sliderText
                            drag = false
                        end
                    end)
                    
                    table.insert(elements, Slider)
                    table.insert(elements, TextLabel)
                    table.insert(elements, Circle)

                    elementOffset = elementOffset+0.54
                end)
                .process()

            if (i == 8) then
                xOffset = xOffset+0.9
                elementOffset = 0.02159
            end
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
