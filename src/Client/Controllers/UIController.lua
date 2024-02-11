local Players = game:GetService("Players")

local React = require("@Packages/React")
local ReactRoblox = require("@Packages/ReactRoblox")

local Log = require("@Common/Log")

local UIRoot = require("@Client/UI/UIRoot")

local e = React.createElement

local function Start()
	local container = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")

	-- Note: `createRoot` takes control of its container and will destroy any
	--  existing children. To work around this, we use a folder as the container
	--  and portal the UI to where we actually want it.
	--
	--  To be honest, I have no idea why React behaves this way.
	local root = ReactRoblox.createRoot(Instance.new("Folder"))
	root:render(ReactRoblox.createPortal(e(UIRoot), container))

	Log.debug("Initialized UI under", container:GetFullName())
end

Start()
return nil
