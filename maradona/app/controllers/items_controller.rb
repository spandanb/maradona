class ItemsController < ApplicationController
	
	before_filter :authenticate
	
	def index
    @items = Item.all
    @responses = @items.collect{|item| item.item_responses.new(:user_id => current_user)}
 		
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
	
	def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
		@item.update_attributes(params[:item])
		redirect_to @item
	end
	
end
