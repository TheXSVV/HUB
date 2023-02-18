function loadScript(script)
    return game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua')()
end

loadScript('Checkbox')
