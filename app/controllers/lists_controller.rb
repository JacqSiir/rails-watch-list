class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)


    flash[:notice] = @list.errors.full_messages.to_sentence unless @list.save
    redirect_to list_path(@list)
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])

     find_bookmarks
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def find_bookmarks
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: @list)
  end
end
