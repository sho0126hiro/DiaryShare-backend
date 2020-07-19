class CommentReaction < ApplicationRecord
    validates :reaction_type, inclusion: {
        in: %w(like none),
        message: "reaction_typeが不適切な値です。"
    }

    belongs_to :comment

end


"""
user_id
comment_id
reaction_type
"""