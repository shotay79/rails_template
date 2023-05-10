class ApplicationController < ActionController::Base
	before_action :initialize_session,:current_user?
	before_action :load_cart
	before_action :subtotal

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
		def subtotal
			@subtotal = 0
			session[:cart].each do |key, value|
				@subtotal += Product.find(key).price * value
			end
		end
end
