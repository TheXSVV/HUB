local utils = {}

utils.lerp = function(current, target, speed)
	local larger = target > current
	
	local diff = math.max(target, current) - math.min(target, current)
	local factor = diff * speed
	
	if (larger) then
		return current + factor
	else
		return current - factor
	end
end

utils.switch = function(element)
	local Table = {
		["Value"] = element,
		["DefaultFunction"] = nil,
		["Functions"] = {}
	}

	Table.case = function(testElement, callback)
		Table.Functions[testElement] = callback
		return Table
	end

	Table.default = function(callback)
		Table.DefaultFunction = callback
		return Table
	end

	Table.process = function()
		local Case = Table.Functions[Table.Value]
		if Case then
			Case()
		elseif Table.DefaultFunction then
			Table.DefaultFunction()
		end
	end

	return Table
end

return utils
