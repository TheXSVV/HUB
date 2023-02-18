function loadModuleScript(script)
    return loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

loadModuleScript('Window').show()
loadModuleScript('Features/TestFeature')
