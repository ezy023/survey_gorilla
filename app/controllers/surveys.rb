get "/surveys/create" do
  erb :create
end


post "/surveys/create" do 
  survey = Survey.create(:title => params[:title], 
                        :description => params[:description])
  survey.image = params[:image]
  survey.save
 

  question = Question.create(:content => params[:question], :survey_id => survey.id )
  params.delete('title')
  params.delete('description')
  params.delete('image')
  params.delete('question1')

  puts params

  params.each do |key, val|
    Choice.create(:content => val , :question_id => question.id ) if key =~ /choice/i
  end
end

get "/surveys/:id/results" do
  survey = Survey.find(params[:id])

  erb :results, :locals => { :survey => survey }

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

