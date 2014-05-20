module Facilethings
	module API

		module Partner

			def partner
				get("/v1/partners/me")
			end

		end

	end
end