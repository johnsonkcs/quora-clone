enable :sessions
# require 'byebug'
# helpers SessionHelper
helpers SessionHelper


get '/login' do
  erb :"static/login"
end

post '/login' do
    # @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
 # SYNTAX FROM LEARNING PORTAL, THE ABOVE AUTHENTICATE IN CONTROLLER WORKS ALSO 
 @user = User.authenticate(params[:email], params[:password])
    if @user 
    	# byebug
        session[:user_id] = @user.id
        redirect to '/'
	else
		@message = "Oh Tidak Oh No! Log In Failed! Invalid Password or ID"
		erb :"static/login"
	end
end

post '/logout' do

	if logged_in?
		session[:user_id] = nil
		erb :"static/login"
	end
end

