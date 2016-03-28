# enable :sessions    
#DONT NEED ENABLE SESSIONS, WORKS JUST FINE
helpers SessionHelper


get '/' do
  @user = current_user
  # byebug
  erb :"static/index"
end