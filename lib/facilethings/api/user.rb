module Facilethings
	module API

		module User

			def user
				get("/v1/users/me")
			end

		end

	end
end