# enable :sessions    
#DONT NEED ENABLE SESSIONS, WORKS JUST FINE
helpers SessionHelper


get '/' do
  @user = current_user
  @questions = Question.all
  # byebug
  erb :"static/index"
end

get '/single_question' do
	@user = current_user
	erb :"static/single_question"
end

get '/user_profile' do 
	@user = current_user
    @answers = Answer.where(user_id: @user.id)
    # redirect '/user_profile'
	erb :'static/user_profile'
end

get '/users/:id' do
	erb :'static/user_profile'
end

# get '/users/:user_id/questions/:question_id/answers/index' do
# 	byebug
#      @user = current_user
#      @question = Question.find_by(question_id: params[:question_id])
#      @answers = Answer.where(question_id: @question.id)
#      erb :'static/current'
#  end
