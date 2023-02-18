local checkbox = {}

function checkbox:new(title, defaultValue)
	local properties = {}
	properties.title = title
	properties.value = defaultValue

	function properties:get_title()
		return self.title
	end
	
	function properties:get_value()
		return self.value
	end
	
	function properties:set_value(value)
		self.value = value
	end

	setmetatable(properties, self)
	self.__index = self; return properties
end

return checkbox
