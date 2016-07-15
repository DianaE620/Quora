get '/pregunta/:id' do
  id = params[:id]
  @pregunta = Question.find(id) 
  respuestas = @pregunta.answers
  @array_answers = [] 

  respuestas.each do |r|
    user_response = User.find(r.user_id).name
    @array_answers << [r.answer, user_response, r.id, r.total_votes]
  end

  @array_answers

  erb :pregunta
end

post '/answer/new' do

  respuesta = params[:answer]
  id_question = params[:question_id]
  @answer = Answer.new(answer: respuesta)
  question = Question.find(id_question)
  user = User.find(session[:user_id])

  if @answer.save
    question.answers << @answer
    user.answers_written << @answer
    redirect to("/pregunta/#{id_question}")
  else
    @error = 1
    @pregunta = Question.find(id_question) 
    respuestas = @pregunta.answers
    @array_answers = [] 

    respuestas.each do |r|
      user_response = User.find(r.user_id).name
      @array_answers << [r.answer, user_response, r.id]
    end

    @array_answers
    erb :pregunta
  end

end

post '/question/new' do
  question = params[:question]
  user = User.find(session[:user_id])
  new_question = Question.new(question: question)

  if new_question.save
    user.questions << new_question
    redirect to("/")
  else
    @error = 1
    questions = Question.all
    @array_questions = []

    questions.each do |q|
      usuario = User.find(q.user_id).name
      @array_questions << [q.question, usuario, q.id]
    end

    @array_questions

    erb :index
  end
end

get '/questions/:id' do
  user_id = params[:id]
  user = User.find(user_id)
  @questions_user = user.questions
  erb :questions_user
end

get '/answers/:id' do
  user_id = params[:id]
  user = User.find(user_id)
  answers_user = user.answers_written
  @question_answers = []

  answers_user.each do |a|
    question = Question.find(a.question_id)
    @question_answers << [question.question, a.answer, a.question_id]
  end

  @question_answers

  erb :answers_user
end



# user.questions << question
# question.answers << respuesta
# user2.answers_written << respuesta


















