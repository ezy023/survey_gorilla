get "/users/signup" do
  erb :signup, :locals => {:error => false}
end

post '/users/signup' do
   user = User.new(params)
   if user.valid?
    user.save
    session[:user_id] = user.id
    redirect '/'
  else
    erb :signup, :locals => {:error => user.errors.full_messages}
  end
end

get '/users/signin' do
  erb :signin, :locals => {:error => false}
end

post "/users/signin" do
  user = User.authenticate(params)
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    erb :signin, :locals => {:error => true}
  end  
end

get '/users/logout' do
  session.clear
  redirect '/'
end

post '/update_profile' do
  user = find_user
  p user
  user.email = params[:email]
  puts 'email assigned'
  user.about = params[:about]
  puts 'about assigned'
  user.save
  redirect "/user/#{user.id}"
end

get '/change_password' do
  user = find_user
  if user
    erb :change_password, :locals => {:user => user}
  else
    redirect '/'
  end
end

post '/change_password' do
  user = find_user
  if User.authenticate(name: user.name, password: params[:current_password])
    if params[:new_password] == params[:confirm_new_password]
      user.password = (params[:new_password])
      user.save
      redirect "/user/#{user.id}"
    else
      "Passwords don't match"
    end
  else
    "Authentication failed beeyotch!"
  end

end
