class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save

    redirect_to lists_path(@bookmark)
  end

  def new
    @bookmark = Bookmark.new
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
  end
end
