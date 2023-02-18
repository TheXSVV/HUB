function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

local window = loadModuleScript('Window')
local feature = loadModuleScript('Feature')
local checkbox = loadModuleScript('Settings/Checkbox')

local testFeature = feature:new('Test feature')
testFeature:add_setting(checkbox:new('Test checkbox', true))
testFeature:add_setting(checkbox:new('Test checkbox 2', false))
window.register_feature(testFeature)

window.register_feature(feature:new('Empty feature'))
