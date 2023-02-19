function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

local utils = loadModuleScript('Utils')
local window = loadModuleScript('Window')

utils.loadModuleScript('Features/TestFeature').register_me(window)
utils.loadModuleScript('Features/Pon').register_me(window)
window.show()
