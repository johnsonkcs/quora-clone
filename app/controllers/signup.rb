enable :sessions

get '/signup' do
  erb :"static/signup"
end

post '/signup' do
	#params[:user] == {"email"=>"sddaasd@dsd.com", "password"=>"123432432"}

	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id 
		redirect to '/'
	else
		erb :"static/signup"
	end
end