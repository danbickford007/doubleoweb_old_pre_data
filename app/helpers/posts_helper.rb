module PostsHelper

  def active_category
    if params[:category_id]
      "Current Listings - #{Category.find(params[:category_id]).name}"
    else
      "Welcome to doubleoweb, your online classifieds source!"
    end
  end

end
