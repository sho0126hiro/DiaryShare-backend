json.extract! user, :id, :name, :pass, :email, :public_uid, :token, :created_at, :updated_at
json.url user_url(user, format: :json)
