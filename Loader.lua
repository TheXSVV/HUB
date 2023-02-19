function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

local window = loadModuleScript('Window')

loadModuleScript('Features/TestFeature').register_me(window)
loadModuleScript('Features/Pon').register_me(window)
window.show()
