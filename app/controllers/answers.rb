enable :sessions
# require 'sinatra'
# require 'sinatra/flash'

get '/answers/:id' do
  erb :"static/current"
end

post '/answers/:id' do
     @user = current_user
     @question = Question.find_by(id: params[:id])
     @answers = Answer.where(question_id: @question.id)

	# byebug

	# if logged_in?
		# @user = current_user
        # @question = Question.find_by(id: params[:id])
        @answer = Answer.new(params[:answer].merge(user_id: @user.id, question_id: @question.id))
		# @answer = @user.@question.answers.new(params[:answer])
		if @answer.save
			erb :'static/current'
			# redirect to '/answers/questions/#{@question.id}'
		else
			erb :'static/index'
			# redirect to '/static/create_answer'
		end
	# else   # IF NOT LOGGED IN
		# flash[:notice] = "You are not logged in! Please Log In or Sign Up to answer!"
		# @question = Question.find_by(id: params[:id])
		# redirect to '/'
		# redirect to '/questions/#{@question.id}'
	# end
end

# get '/answers/:id' do
#   @user = current_user
#   # @question = Question.find_by(id: params[:id])
#   @answers = Answer.where(user_id: @user.id)
#   erb :'static/user_answers'
# end