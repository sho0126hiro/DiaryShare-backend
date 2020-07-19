class User < ApplicationRecord
  has_secure_token
  generate_public_uid 

  has_many :diaries, dependent: :destroy
  
  def to_parm
    public_uid
  end
  
  """
  Users Table:
    id, name, pass, email, public_uid, token, created_at, updated_at, url
  """

end
