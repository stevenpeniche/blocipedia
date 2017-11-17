class User < ApplicationRecord
	has_many :wikis
	after_initialize :init

  def init
    self.role  ||= :standard # will set the default value only if it's nil
	end

	enum role: [:standard, :premium, :admin]

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
