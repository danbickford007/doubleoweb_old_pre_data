json.array!(@users) do |user|
  json.extract! user, :email, :passcode, :active
  json.url user_url(user, format: :json)
end
