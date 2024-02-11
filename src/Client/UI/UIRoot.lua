local React = require("@Packages/React")

local ScreenGui = require("@Components/Roblox/ScreenGui")
local useRem = require("@Hooks/useRem")

local e = React.createElement

local function UIRoot()
	local rem = useRem()

	return e(ScreenGui, {
		key = "UIRoot",
	}, {
		Text = e("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0.2),
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = Color3.new(0.94902, 0.95686, 0.96078),
			Text = "Hello from React!",
			TextSize = rem(34),
			Font = Enum.Font.GothamBlack,
			LineHeight = 1.2,
			TextColor3 = Color3.new(0.37647, 0.38039, 0.38431),
		}, {
			Padding = e("UIPadding", {
				PaddingTop = UDim.new(0, rem(12)),
				PaddingBottom = UDim.new(0, rem(12)),
				PaddingLeft = UDim.new(0, rem(12)),
				PaddingRight = UDim.new(0, rem(12)),
			}),

			UICorner = e("UICorner", {
				CornerRadius = UDim.new(0, rem(8)),
			}),
		}),
	})
end

return UIRoot
