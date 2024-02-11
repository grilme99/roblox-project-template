-- DEV mode is used for debug features in React-lua. This syntax is a little
--  confusing because it looks like we're assigning __DEV__ to __DEV__, but
--  Darklua is actually setting `_G.__DEV__` to the string "true" or "false" at
--  compile time, so when compiled this actually looks like:
--
--  `_G.__DEV__ = true` or `_G.__DEV__ = false`
--
-- Also note that __DEV__ **MUST** be set before React itself is required, so
--  we set it here before any client code is run.
_G.__DEV__ = _G.__DEV__ == "true"

local function Start()
	require("@Controllers/UIController")
end

Start()
