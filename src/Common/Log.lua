local __DEV__ = _G.__DEV__ == "true"

local Log = {}

local function createLogFunction(levelName: string, logFn: (...string) -> (), printInDev: boolean)
	return function(...: any)
		if printInDev and not __DEV__ then
			return
		end

		-- Get the full path of the module (Path.To.Module), and then take the
		-- final segment as the name (`Module`).
		local modulePath = debug.info(2, "s")
		local moduleName = modulePath:match("[^.]+$")

		logFn(`[{moduleName}] {levelName}:`, ...)
	end
end

Log.debug = createLogFunction("DEBUG", print, false)
Log.info = createLogFunction("INFO", print, true)
Log.warn = createLogFunction("WARN", warn, true)

return Log
