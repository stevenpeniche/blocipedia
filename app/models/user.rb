class User < ApplicationRecord
	has_many :wikis
	has_many :collaborators
	has_many :wiki_collaborations, through: :collaborators, source: :wiki
	after_initialize :init

	devise :database_authenticatable, :registerable, :confirmable,
				 :recoverable, :rememberable, :trackable, :validatable

  def init
    self.role  ||= :standard # will set the default value only if it's nil
	end

	enum role: [:standard, :premium, :admin]
end
