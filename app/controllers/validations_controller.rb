class ValidationsController < ApplicationController
  def index
    Post.where(:validation_key=>params[:key])
  end
end
