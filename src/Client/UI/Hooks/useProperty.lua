local React = require("@Packages/React")

local useState = React.useState
local useEffect = React.useEffect

local function useProperty(instance: Instance, propName: string): any
	local propValue, setPropValue = useState((instance :: any)[propName])

	useEffect(function()
		local connection = instance:GetPropertyChangedSignal(propName):Connect(function()
			setPropValue((instance :: any)[propName])
		end)

		return function()
			connection:Disconnect()
		end
	end, { instance, propName } :: { any })

	return propValue
end

return useProperty
