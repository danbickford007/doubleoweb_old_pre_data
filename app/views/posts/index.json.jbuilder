json.array!(@posts) do |post|
  json.extract! post, :title, :content, :owner_id, :city_id
  json.url post_url(post, format: :json)
end
