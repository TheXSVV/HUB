local feature = {}

function feature:new(title)
	local properties = {}
	properties.title = title
	properties.settings = {}
	
	function properties:get_title()
		return self.title
	end
	
	setmetatable(properties, self)
	self.__index = self; return properties
end

return feature
