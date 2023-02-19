function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

local utils = loadModuleScript('Utils')
local window = loadModuleScript('Window')

loadModuleScript('Features/Visuals').register_me(window)
window.show()
