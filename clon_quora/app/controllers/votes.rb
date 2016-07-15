post '/question/vote' do

  vote = params[:vote]
  id_question = params[:question]  
  user_id = session[:user_id]
  question = Question.find(id_question)

  final = question.votes.find_or_create_by(user_id: user_id)
  final.update(votes: vote)

end

post '/answer/vote' do

  vote = params[:vote]
  id_answer = params[:answer]  
  user_id = session[:user_id]
  answer = Answer.find(id_answer)

  final = answer.votes.find_or_create_by(user_id: user_id)
  final.update(votes: vote)


end