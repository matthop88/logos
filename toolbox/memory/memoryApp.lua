print("\nWelcome to the Bible Memory Application!")

print("\nCOMMAND:", __COMMAND)
__ARGS = __ARGS or {}

local argList = ""

for _, arg in ipairs(__ARGS) do
	if string.len(argList) > 0 then argList = argList .. ", " end
	argList = argList .. arg
end

print("ARGS: " .. argList .. "\n")

love.event.quit()
