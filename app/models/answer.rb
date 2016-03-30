

class Answer < ActiveRecord::Base

	belongs_to :user
    belongs_to :question
    has_many :answer_votes, dependent: :destroy #DESTROY ANSWER VOTES IF ANSWER IS DELETED

	validates_presence_of :text, message: "Field Cannot Be Blank"
	# validates_format_of :email, {with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ , message: "Email must be a valid email"}
    
end