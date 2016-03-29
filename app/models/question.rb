

class Question < ActiveRecord::Base

	belongs_to :user
    has_many :answers

    #tried has_many :answer works also, duno why, reference code is like that, but oh wells.

	validates_presence_of :title, message: " Title Cannot Be Blank"
	validates_presence_of :body, message: "Content Cannot Be Blank"

	# validates_format_of :email, {with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ , message: "Email must be a valid email"}
    
end