module Spree
	module Api
		class ThemesController < ActionController::Base
			respond_to :json

			def index
				@themes = Theme.all
			end
		end
	end
end
