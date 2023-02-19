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
    tab:add_setting(label:new('Chams'))
    tab:add_setting(checkbox:new('Enable', false))
    tab:add_setting(checkbox:new('Team check', true))

    tab:add_setting(label:new('ESP'))
    tab:add_setting(checkbox:new('Enable', false))
    tab:add_setting(checkbox:new('Box', false))
    tab:add_setting(checkbox:new('Nametag', false))
    tab:add_setting(checkbox:new('Health Bar', false))

    tab:add_setting(label:new('Tracers'))
    tab:add_setting(checkbox:new('Health Bar', false))
    tab:add_setting(checkbox:new('Health Bar', false))

    window.register_feature(tab)
end

return visuals
