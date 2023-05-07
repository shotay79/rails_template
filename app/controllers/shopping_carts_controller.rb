class ShoppingCartsController < ApplicationController
  def items
    @items = @cart.cart_items.includes(:product)
  end

  def add_items
    @product = Product.find(params[:product_id])
    if @product
      @cart.cart_items.create(
        product_id: @product.id
        quantity: 1
      )
      redirect_to @product, notice: 'Product added to cart'
    else
      redirect_to @product, alert: 'Product not found'
    end
  end

  private

  def find_cart
    @cart = current_user.shopping_cart
  end
end
