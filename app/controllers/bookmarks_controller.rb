class BookmarksController < ApplicationController
  def create
    @bookmarks = Bookmark.new(params)
    if @bookmarks.save
      redirect_to list_path(@bookmark.list)
    else
      render list_path(@bookmark.list), status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find params[:id]
    list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path list
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
