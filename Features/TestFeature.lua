local testfeature = {}

function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

testfeature.register_me = function(window)
    local feature = loadModuleScript('Feature')
    local checkbox = loadModuleScript('Settings/Checkbox')
    local slider = loadModuleScript('Settings/Slider')

    local testFeature = feature:new('Test feature')
    testFeature:add_setting(checkbox:new('Test checkbox', true))
    testFeature:add_setting(checkbox:new('Test checkbox 2', false))
    testFeature:add_setting(slider:new('Pon test', 2, 35, 17.4))
    testFeature:add_setting(slider:new('Pon test 1337', 2, 5, 5))
    window.register_feature(testFeature)

    window.register_feature(feature:new('Empty feature'))
    print(' | Test feature registered')
end

return testfeature
