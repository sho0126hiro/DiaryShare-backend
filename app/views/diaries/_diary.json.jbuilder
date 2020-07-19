json.extract! diary, :id, :user_id, :status, :title, :content, :created_at, :updated_at
json.url diary_url(diary, format: :json)
