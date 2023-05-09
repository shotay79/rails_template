class ShoppingCartController < ApplicationController
	def index
	end
	def update
		quantity = params[:quantity].to_i
		id = params[:id]
		if quantity < 1

			session[:cart]
		else
			session[:cart][id] = quantity
		end

		redirect_to request.referrer
	end
	def add_to_cart
		id = params[:id]
		session[:cart].keys.include?(id) ? session[:cart][id] += 1 : session[:cart][id] = 1

		redirect_to request.referrer
	end
	
	def remove_from_cart
		id = params[:id]
		session[:cart].delete(id)
		redirect_to request.referrer
	end
end
