local slider = {}

function slider:new(title, min, max, defaultValue)
	local properties = {}
	properties.title = title
	properties.min = min
	properties.max = max
	properties.value = defaultValue
	
	properties.sliding = false

	function properties:get_type()
		return 'slider'
	end

	function properties:get_title()
		return self.title
	end
	
	function properties:get_min()
		return self.min
	end
	
	function properties:get_max()
		return self.max
	end

	function properties:get_value()
		return self.value
	end
	
	function properties:calc_slider_circle()
		return self.value / max
	end

	function properties:set_value(value)
		self.value = math.clamp(value, min, max)
	end

	setmetatable(properties, self)
	self.__index = self; return properties
end

return slider
