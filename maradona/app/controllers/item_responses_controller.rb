class ItemResponsesController < ApplicationController

	def create
		@item_response = ItemResponse.new(params[:item_response])
		@item_response.save
		redirect_to :back
	end
end
