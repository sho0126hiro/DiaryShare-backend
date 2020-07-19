class Comment < ApplicationRecord
    belongs_to :diary
    has_many :comment_reactions
end

"""
user_id
diary_id
content
"""
