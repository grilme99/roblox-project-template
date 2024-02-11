local Workspace = game:GetService("Workspace")
local React = require("@Packages/React")

local useProperty = require("@Hooks/useProperty")

local useEffect = React.useEffect
local useCallback = React.useCallback

local BASE_REM = 16
local MIN_REM = 10
local BASE_RESOLUTION = Vector2.new(1280, 832)
local DOMINANT_AXIS = 0.5

local function calculateRem(viewport: Vector2)
	local width = math.log(viewport.X / BASE_RESOLUTION.X, 2)
	local height = math.log(viewport.Y / BASE_RESOLUTION.Y, 2)
	local centered = width + (height - width) * DOMINANT_AXIS

	return math.max(BASE_REM * 2 ^ centered, MIN_REM)
end

local function useRem()
	local camera: Camera = useProperty(Workspace, "CurrentCamera")
	local screenSize: Vector2 = useProperty(camera, "ViewportSize")

	local rem, setRem = React.useState(calculateRem(screenSize))
	useEffect(function()
		setRem(calculateRem(screenSize))
	end, { screenSize })

	return useCallback(function(value: number, mode_: "scale" | "unit"?)
		local mode = mode_ or "scale"
		if mode == "scale" then
			return value * (rem / BASE_REM)
		else
			return value * rem
		end
	end, { rem })
end

return useRem
