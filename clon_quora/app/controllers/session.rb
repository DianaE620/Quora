before "/profile/:id" do

  redirect to("/") unless logged_in?
  
end

get '/outsesion' do
  session.clear
  redirect to("/")
end