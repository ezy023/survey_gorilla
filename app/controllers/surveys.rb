get "/surveys/create" do
  erb :create
end

post '/surveys/add_question' do
  erb :_question_form, :layout => false 
end

post "/surveys/create" do 
  survey = Survey.create(:title => params[:title], 
                        :description => params[:description])
  survey.image = params[:image]
  survey.creator = current_user
  survey.save
  question = Question.new
  params.delete('title')
  params.delete('description')
  params.delete('image')

  params.each do |key, val|
    if key =~ /question/i
      question = Question.create(:content => val, :survey_id => survey.id)
    elsif key =~ /choice/i
      question.choices << Choice.create(:content => val , :question_id => question.id ) 
    end
  end

  redirect '/'
end

get "/surveys/:id/results" do
  
  survey = Survey.find_by_id(params[:id])
  p survey.creator

  # if survey.creator == current_user
    erb :results, :locals => { :survey => survey }
  # else
  #   redirect '/'
  # end
end


get '/surveys/:id/take' do
  @survey = Survey.find_by_id(params[:id])
  erb :take_survey
end

post '/surveys/:id/take' do
  p params
  @survey = Survey.find(params[:id])
  @user = current_user
  params.each do |key, value|
    @user.choices << Choice.find_by_id(value) if key =~ /question/
  end
  
  erb :view_response
end

