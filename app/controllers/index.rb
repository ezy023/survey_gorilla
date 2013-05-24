get '/' do
  if current_user
    # @surveys = current_user.surveys
    @surveys = Survey.all
    erb :index
  else
    @surveys = Survey.all
    erb :index
  end
end
