local visuals = {}

function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

-- Settings

visuals.register_me = function(window)
    local feature = loadModuleScript('Feature')
    local checkbox = loadModuleScript('Settings/Checkbox')
    local slider = loadModuleScript('Settings/Slider')
    local label = loadModuleScript('Settings/Label')

    local tab = feature:new('Visuals')

    window.register_feature(tab)
end

return visuals
