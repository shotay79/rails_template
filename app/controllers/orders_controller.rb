class OrdersController < ApplicationController
	before_action :authenticate_user!
	def index
		@orders = current_user.orders
	end	
	def new
		@order = Order.new
	end
	
	def create
		@order = Order.new(order_params)
		@order.user  = current_user
		if @order.save
		  redirect_to others_path
		else
	      render :new
		end
	end

  private

    def order_params
      params.require(:order).permit(:customer_name, :shipping_address, :phone_no)
    end
end
