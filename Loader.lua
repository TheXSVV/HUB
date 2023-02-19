function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end
local window = loadModuleScript('Window')

print('1')
local utils = loadModuleScript('Utils')
print('2')
local window = loadModuleScript('Window')

print('3')
loadModuleScript('Features/Visuals').register_me(window)
print('4')
window.show()
