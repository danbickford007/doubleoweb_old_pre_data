class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :set_cookies, :only=>:index
  before_filter :authenticate, :only=>:index
  
  def set_cookies
    if params[:country_id]
      cookies[:country_id] = params[:country_id]
    end
    if params[:state_id]
      cookies[:state_id] = params[:state_id]
    end
    if params[:city_id]
      cookies[:city_id] = params[:city_id]
    end
  end

  def index
    if params[:country_id]
      states = Country.find(params[:country_id]).states
    end
    if params[:state_id]
      cities = State.find(params[:state_id]).cities
    end
    @posts = Post.where(:city_id => cookies[:city_id], :category_id => params[:category_id], :active => true)
    respond_to do |format|
      format.js {render :js=>"populateOptions(#{states.to_json}, #{cities.to_json})"}
      format.html
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params).generate_post(params[:post][:title], params[:email], params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.where(:id => params[:id]).first
    respond_to do |format|
      if @post.update_attributes(post_params.except(:publish))
        if post_params[:publish]
          format.html { redirect_to validations_index_path(:validation_key => @post.validation_key), notice: 'Post was successfully updated.' }
        else
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { head :no_content }
        end
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :owner_id, :city_id, :category_id, :email, :publish)
    end
end
