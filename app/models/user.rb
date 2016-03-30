require 'bcrypt'

class User < ActiveRecord::Base

    has_many :questions
    has_many :answers
    has_many :question_votes
    has_many :answer_votes

	has_secure_password  #with this, it automatically refers to password_digest excrypted password, can just call password. tested, works

	validates_presence_of :username, message: "Username is required"
	validates_presence_of :email, message: "Email is required"
	validates_format_of :email, {with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ , message: "Email must be a valid email"}
    validates_presence_of :password, message: "Password is required"

    def self.authenticate(email, password)
    	@user = User.find_by(email: email)

    	    if @user && @user.authenticate(password) #means user is found in databse, and password is authenticated
    	  	  @user
    	    else
    	  	  return false
    	    end
    end
    # COMMENT THIS OUT AND PUT THE AUTHENTICATE IN CONTROLLER WORKS ALSO
end