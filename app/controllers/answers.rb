enable :sessions
# require 'sinatra'
# require 'sinatra/flash'

get '/questions/:question_id/answers/new' do
	@user = current_user
	# byebug
    @question = Question.find_by(id: params[:question_id])
    # byebug
	erb :'static/create_answer'
end

post '/questions/:question_id/answers' do
	@user = current_user
    @question = Question.find_by(id: params[:question_id])
    # byebug
    # @answers = Answer.where(question_id: @question.id)
    @answer = Answer.new(params[:answer].merge(user_id: @user.id, question_id: @question.id))
		# @answer = @user.@question.answers.new(params[:answer])
		if @answer.save
			# erb :'static/current'
			# redirect '/users/#{@user.id}/questions/#{@question.id}/answers/index'
			redirect '/user_profile'
			# redirect to '/answers/questions/#{@question.id}'
		else
			# @anserror = "Can't Post Answer. Log In And Make Sure Answer Field Is Not Blank"
			erb :'static/create_answer'
			# redirect to '/static/create_answer'
		end
end



# get '/questions/:question_id/answers/n' do
# get '/answers/:id' do
#   erb :"static/current"
# end

# post 'questions/:question_id/answers/' do
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
			@anserror = "Can't Post Answer. Log In And Make Sure Answer Field Is Not Blank"
			erb :'static/current'
			# redirect to '/static/create_answer'
		end
	# else   # IF NOT LOGGED IN
		# flash[:notice] = "You are not logged in! Please Log In or Sign Up to answer!"
		# @question = Question.find_by(id: params[:id])
		# redirect to '/'
		# redirect to '/questions/#{@question.id}'
	# end
end


delete '/answers/:answer_id' do
	answer = Answer.find_by(id: params[:answer_id])
	answer.destroy
	# redirect to '/'
	# erb :'static/user_profile'
	redirect '/user_profile'
end

# get '/answers/:id' do
#   @user = current_user
#   # @question = Question.find_by(id: params[:id])
#   @answers = Answer.where(user_id: @user.id)
#   erb :'static/user_answers'
# end