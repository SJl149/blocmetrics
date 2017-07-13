class RegisteredApp < ActiveRecord::Base
  belongs_to :user

  has_many :events
  
  validates :name, :url, presence: true, uniqueness: { scope: :user_id }

end
