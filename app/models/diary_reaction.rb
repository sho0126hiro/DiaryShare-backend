class DiaryReaction < ApplicationRecord
    validates :reaction_type, inclusion: {
        in: %w(like none),
        message: "reaction_typeが不適切な値です。"
    }
    belongs_to :diary, optional: true
end

"""
user_id
diary_id
reaction_type
"""