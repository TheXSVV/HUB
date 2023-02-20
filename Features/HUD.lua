local hud = {}

function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

local feature = loadModuleScript('Feature')
local checkbox = loadModuleScript('Settings/Checkbox')
local slider = loadModuleScript('Settings/Slider')
local label = loadModuleScript('Settings/Label')

local tab = feature:new('HUD')
-- Settings
local lbl1 = label:new('Overlay')
local watermark = checkbox:new('Watermark', false)
tab:add_settings({ lbl1, watermark })

-- Data Variables
local screenGUI = nil
local frame = nil

hud.register_me = function(window)
    screenGUI = Instance.new('ScreenGui')
    screenGUI.Name = "HUD"
    screenGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    window.register_feature(tab)
end

watermark.click_handle = function()
    if (watermark:get_value()) then
        local Watermark = Instance.new("Frame")
        local Frame = Instance.new("Frame")
        local UIGradient = Instance.new("UIGradient")
        local TextLabel = Instance.new("TextLabel")
        local TextLabel_2 = Instance.new("TextLabel")

        Watermark.Name = "Watermark"
        Watermark.Parent = HUD
        Watermark.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Watermark.BackgroundTransparency = 0.400
        Watermark.BorderColor3 = Color3.fromRGB(27, 42, 53)
        Watermark.BorderSizePixel = 0
        Watermark.Position = UDim2.new(0, 20, 0, 20)
        Watermark.Size = UDim2.new(0, 160, 0, 56)
        
        Frame.Parent = Watermark
        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame.BorderSizePixel = 0
        Frame.Size = UDim2.new(0, 2, 1, 0)
        
        UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(51, 51, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 205, 208))}
        UIGradient.Rotation = 90
        UIGradient.Parent = Frame
        
        TextLabel.Parent = Watermark
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.new(0, 14, 0, 8)
        TextLabel.Size = UDim2.new(1, -14, 1, -12)
        TextLabel.Font = Enum.Font.FredokaOne
        TextLabel.Text = "HUB"
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 20.000
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.TextYAlignment = Enum.TextYAlignment.Top
        
        TextLabel_2.Parent = Watermark
        TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_2.BackgroundTransparency = 1.000
        TextLabel_2.BorderSizePixel = 0
        TextLabel_2.Position = UDim2.new(0, 14, 0, 28)
        TextLabel_2.Size = UDim2.new(1, -14, 1, -12)
        TextLabel_2.Font = Enum.Font.Unknown
        TextLabel_2.Text = "BUILD 20.02"
        TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_2.TextSize = 19.000
        TextLabel_2.TextTransparency = 0.150
        TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel_2.TextYAlignment = Enum.TextYAlignment.Top

        frame = Watermark
    else
        if (frame ~= nil) then
            frame:Destroy()
        end
    end
end

return hud
