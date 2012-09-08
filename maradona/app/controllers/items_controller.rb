class ItemsController < ApplicationController
	
	def index
    @items = Item.all
 	end

	def show
    @item = Item.find(params[:id])
  end
	
	def new
		@item = Item.new
		@item.owner_id = current_user.id	
	end
	
	def create
	  @item = Item.new(params[:item])
		@item.save
		redirect_to items_path
	end
	
end
