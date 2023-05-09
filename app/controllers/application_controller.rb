class ApplicationController < ActionController::Base
	before_action :initialize_session,:current_user?
	before_action :load_cart

	private

		def initialize_session
			session[:cart] ||= {}
		end

		def load_cart
			@cart = Product.find(session[:cart].keys)
		end
		def current_user?
			@current_user = current_user
		end
end
