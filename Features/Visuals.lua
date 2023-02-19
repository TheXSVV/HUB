local pon = {}

function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

local hls = {}
pon.register_me = function(window)
    local feature = loadModuleScript('Feature')
    local checkbox = loadModuleScript('Settings/Checkbox')

    local feat = feature:new('Chams')
    local enableCheckbox = checkbox:new('Enable', false)
    feat:add_setting(enableCheckbox)

    enableCheckbox.click_handle = function()
        local plr = game.Players.LocalPlayer

        if (enableCheckbox:get_value()) then
            for _, part in pairs(game.Players:GetPlayers()) do
                if (not (part.UserId == plr.UserId)) then
                    add(part.Character)
                end
            end
        else
            for i=1, #hls do
                hls[i]:Destroy()
            end
        end
    end

    window.register_feature(feat)
end

function add(adornee)
	local hl = Instance.new('Highlight')
	hl.Parent = adornee
	hl.Adornee = adornee
	hl.OutlineColor = Color3.fromRGB(150, 0, 0)
	hl.OutlineTransparency = 0
	hl.FillTransparency = 1

    table.insert(hls, hl)
end

return pon
