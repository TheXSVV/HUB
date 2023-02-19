local visuals = {}

function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

-- Settings

pon.register_me = function(window)
    local feature = loadModuleScript('Feature')
    local checkbox = loadModuleScript('Settings/Checkbox')
    local slider = loadModuleScript('Settings/Slider')
    local label = loadModuleScript('Settings/Label')

    local tab = feature:new('Visuals')
    tab:add_setting(label:new('Chams'))
    tab:add_setting(checkbox:new('Enable'))
    tab:add_setting(checkbox:new('Team check'))

    tab:add_setting(label:new('ESP'))
    tab:add_setting(checkbox:new('Enable'))
    tab:add_setting(checkbox:new('Box'))
    tab:add_setting(checkbox:new('Nametag'))
    tab:add_setting(checkbox:new('Health Bar'))

    tab:add_setting(label:new('Tracers'))
    tab:add_setting(checkbox:new('Health Bar'))
    tab:add_setting(checkbox:new('Health Bar'))

    window.register_feature(tab)
end

return visuals
