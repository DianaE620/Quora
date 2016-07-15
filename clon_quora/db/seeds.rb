user = User.new(name: "Diana Ortiz", email: "diana05@hotmail.com")

user.password = 123
user.save

user2 = User.new(name: "Roberto Perez", email: "robert@hotmail.com")

user2.password = "lala"
user2.save

question = Question.create(question: "What are the best programming languages to learn today?")
 

respuesta = Answer.create(answer: "java")


user.questions << question
question.answers << respuesta
user2.answers_written << respuesta



