function loadScript(script)
    loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/TheXSVV/HUB/main/' .. script .. '.lua'))()
end

local checkbox = loadScript('Checkbox')
local feature = loadScript('Feature')
local window = loadScript('Window')

window.ClickGUI.Enabled = true
window.MainFrame.Visible = true
