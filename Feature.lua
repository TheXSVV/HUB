local feature = {}

function feature:new(title)
	local properties = {}
	properties.title = title
	properties.settings = {}
	
	function properties:get_title()
		return self.title
	end
	
	function properties:get_settings()
		return self.settings
	end
	
	function properties:add_setting(setting)
		table.insert(self.settings, setting)
	end

	function properties:add_settings(settingArray)
		for i=1, #settingArray do
			table.insert(self.settings, settingArray[i])
		end
	end
	
	setmetatable(properties, self)
	self.__index = self; return properties
end

return feature
