class Friend < ApplicationRecord
    belongs_to :user, optional: true
    validates :status, inclusion: { 
        in: %w(applied apply accept accepted blocked) , 
        message: "statusが不適切な値です。"
    }
end
