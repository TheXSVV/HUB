local pon = {}

function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

local hl = nil
pon.register_me = function(window)
    local feature = loadModuleScript('Feature')
    local checkbox = loadModuleScript('Settings/Checkbox')

    local feat = feature:new('Chams')
    local enableCheckbox = checkbox:new('Enable', false)
    feat:add_setting(enableCheckbox)

    enableCheckbox.click_handle = function()
        local plr = game.Players.LocalPlayer

        if (enableCheckbox:get_value()) then
            hl = Instance.new('Highlight')
            hl.Parent = plr.Character
            hl.Adornee = plr.Character
            hl.OutlineColor = Color3.fromRGB(150, 0, 0)
            hl.OutlineTransparency = 0
            hl.FillTransparency = 1
        else
            if (hl) then
                hl:Destroy()
                hl = nil
            end
        end
    end

    window.register_feature(feat)
end

return pon
