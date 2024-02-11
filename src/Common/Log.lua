local __DEV__ = _G.__DEV__ == "true"

local Log = {}

local function createLogFunction(levelName: string, logFn: (...string) -> (), printInDev: boolean)
	return function(...: any)
		if __DEV__ and not printInDev then
			return
		end

		local moduleName = debug.info(2, "s")
		logFn(`[{levelName}] {moduleName}:`, ...)
	end
end

Log.debug = createLogFunction("debug", print, false)
Log.info = createLogFunction("info", print, true)
Log.warn = createLogFunction("warn", warn, true)

return Log
