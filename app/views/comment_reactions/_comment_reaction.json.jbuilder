json.extract! comment_reaction, :id, :user_id, :comment_id, :reaction_type, :created_at, :updated_at
json.url comment_reaction_url(comment_reaction, format: :json)
