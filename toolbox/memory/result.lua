require("bible/util/consoleFunctions")

return {
	error = function(self, message)
		return {
			message = message,

			isError    = function(self) return true                          end,
			getMessage = function(self) return self.message                  end,
			print      = function(self) printResponse("ERROR", self.message) end,
		}
	end,

	success = function(self, data)
		return {
			data = data,

			isError = function(self) return false     end,
			getData = function(self) return self.data end, 
		}
	end,
}
