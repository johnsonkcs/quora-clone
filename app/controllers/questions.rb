enable :sessions

#render new form from single_question.erb
get '/questions/new' do
  erb :"static/single_question"
end

# creates new question
post '/questions' do

	@user = current_user
	@question = @user.questions.new(params[:question])
	# 2nd Way: 
	# @question = Question.new(params[:title], params[:body])
	# @user.questions << @question
	# 3rd Way:
	# @question = Question.new(params[:question].merge(user_id: @user.id))
	if @question.save
		# redirect to '/static/#{@question.id}'
		# redirect to '/users/questions'
		# erb :'static/user_profile'
		redirect '/user_profile'
	else
		erb :"static/single_question"
	end
end

#show the question
get '/questions/:id' do
    @user = current_user
    @question = Question.find_by(id: params[:id])
    @answers = Answer.where(question_id: @question.id)
    erb :"static/current" 
end

#render edit form
get '/questions/:id/edit' do
	@user = current_user
	@question = Question.find_by(id: params[:id])
	erb :'static/edit_question'
end

#update the question
put '/questions/:id' do
	@user = current_user
	@question = Question.find_by(id: params[:id])
	if @question.update(params[:question])
		redirect to "/questions/#{@question.id}"
	else
		erb :'static/edit_question'
	end
end

#delete the question
delete '/questions/:id' do
	@question = Question.find_by(id: params[:id])
	@question.destroy
	# redirect to '/'
	# erb :'static/user_profile'
	redirect '/user_profile'
end