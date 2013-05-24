get '/' do
  if current_user
    # @surveys = current_user.surveys
    @surveys = Survey.all
    erb :index
  else
    erb :index
  end
end
