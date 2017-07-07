class RegisteredApp < ActiveRecord::Base
  belongs_to :user

  validates :name, :url, presence: true, uniqueness: { scope: :user_id }

end
