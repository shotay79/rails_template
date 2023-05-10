class OrdersController < ApplicationController
	before_action :authenticate_user!
	def index
		@orders = current_user.orders
	end	
	def new
		# @order = Order.new
		  flash[:succes] = "Order Created"
		  redirect_to orders_path
		
	end
	
	def create
		@order = Order.new(order_params)
		@order.user  = current_user
		if @order.save
			session[:cart] = {}
		  redirect_to orders_path, notice: "Book not found"
		else
	      render :new
		end
	end

  private

    def order_params
      params.require(:order).permit(:customer_name, :shipping_address, :phone_no)
    end
end
