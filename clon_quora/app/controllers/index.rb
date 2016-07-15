get '/' do
  questions = Question.all
  @array_questions = []

  questions.each do |q|
    usuario = User.find(q.user_id).name
    @array_questions << [q.question, usuario, q.id]
  end

  p @array_questions

  erb :index
end
