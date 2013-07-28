class ValidationsController < ApplicationController
  def index
    @post = Post.where(:validation_key=>params[:validation_key]).first
  end

  def new
    Post.find(params[:id]).update_attribute(:active, true)
    flash[:success] = 'Post successfully activated'
    redirect_to validations_index_path
  end
end
