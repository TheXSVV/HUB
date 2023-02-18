local testfeature = {}

testfeature.register_me = function(instance)
    local window = instance.loadModuleScript('Window')
    local feature = instance.loadModuleScript('Feature')
    local checkbox = instance.loadModuleScript('Settings/Checkbox')

    local testFeature = feature:new('Test feature')
    testFeature:add_setting(checkbox:new('Test checkbox', true))
    testFeature:add_setting(checkbox:new('Test checkbox 2', false))
    window.register_feature(testFeature)

    window.register_feature(feature:new('Empty feature'))
    print(' | Test feature registered')
end

return testfeature
