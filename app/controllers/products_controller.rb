class ProductsController < ApplicationController
   
   def index 
      @products = Product.all.where(user_id:current_user.id)
   end

   def new 
      @product = Product.new
   end

   def create
      @product = Product.new(product_params)
      @product.user_id = current_user.id
      respond_to do |format|
         if @product.save
            format.turbo_stream
         end
      end   
   end

   def edit 
      @product = Product.find(params[:id])
   end

   def update
      @product = Product.find(params[:id])
      respond_to do |format|
         if @product.update(product_params)
            format.turbo_stream
         end
      end
   end

   def destroy 
      @product = Product.find(params[:id])
      respond_to do |format|
         if @product.destroy
            format.turbo_stream 
         end
      end
   end


private 

   def product_params 
      params.require(:product).permit(:name,:description,:price)
   end


end
