class Diary < ApplicationRecord
  validates :status, inclusion: { 
    in: %w(draft publish private) , 
    message: "statusが不適切な値です。"
  }

  belongs_to :user, optional: true
  has_many :comments
  has_many :diary_reactions

end

"""
user_id, null: false
status, null: false
title, null: false
content, null: false
timestamps
"""