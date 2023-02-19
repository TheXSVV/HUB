local label = {}

function label:new(title)
	local properties = {}
	properties.title = title

	function properties:get_type()
		return 'label'
	end

	function properties:get_title()
		return self.title
	end

	setmetatable(properties, self)
	self.__index = self; return properties
end

return label
