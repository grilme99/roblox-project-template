local React = require("@Packages/React")

local e = React.createElement

export type Props = React.ElementProps<ScreenGui>

local function ScreenGui(props: Props)
	return e("ScreenGui", {
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		ResetOnSpawn = false,
	}, props.children)
end

return ScreenGui
