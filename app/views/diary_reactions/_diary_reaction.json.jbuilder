json.extract! diary_reaction, :id, :user_id, :diary_id, :reaction_type, :created_at, :updated_at
json.url diary_reaction_url(diary_reaction, format: :json)
