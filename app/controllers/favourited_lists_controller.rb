class FavouritedListsController < ApplicationController
  def show
    @favourited_list = FavouritedList.find(params[:favouritable_id])
  end


  def edit
  end

end
