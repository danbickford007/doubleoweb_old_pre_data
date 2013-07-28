class SearchController < ApplicationController
  def index
  end

  def new
    @search = Post.search do
      keywords params[:search]
    end
    
    @posts = @search.results
    render 'posts/index'
  end
end
