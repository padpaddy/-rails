class User < ApplicationRecord
	validates_presence_of :first_name, :last_name
	validates_uniqueness_of :email
	validates :email, :email_format => { :message => 'is not looking good' }
	validates :password, length: { minimum: 6 }

	has_many :posts
end
