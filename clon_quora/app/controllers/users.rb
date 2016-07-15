get '/newuser' do 
  erb :new_user
end

post '/newuser' do 
  nombre = params[:name]
  email = params[:email]
  pass = params[:pass]

  @user = User.new(name: nombre, email: email)
  @user.password = pass
    
  if @user.save
    session[:user_id] = @user.id
    session[:name] = @user.name
    redirect to("/profile/#{@user.id}")
  else
    @user.errors.full_messages
    @error = 1
    erb :new_user
  end
end

get '/login' do 
  erb :login
end

post '/login' do 
  email = params[:email]
  pass = params[:pass]

  if User.authenticate(email, pass)
    @user = User.authenticate(email, pass)
    session[:user_id] = @user.id
    session[:name] = @user.name
    redirect to("/profile/#{@user.id}")
  else
    @error = 1
    erb :login
  end
end

get '/profile/:id' do
  id = params[:id]
  @user = User.find(id) 
  erb :profile
end

get '/all/users' do
  @users = User.all
  erb :users
end













