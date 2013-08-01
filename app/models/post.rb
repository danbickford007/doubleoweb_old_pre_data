class Post < ActiveRecord::Base


  searchable do
    text :text_title
  end 

end
