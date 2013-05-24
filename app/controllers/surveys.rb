get "/surveys/create" do

erb :create
end

post "/surveys/create" do
  p params.inspect 
  survey = Survey.create(:title => params[:title], :description => params[:description])
  
  question = Question.create(:content => params[:question], :survey_id => survey.id )
  params[:choice].each do |choice|
             Choice.create(:content => choice, :question_id => question.id )
  end

  # Choices.create()
  # content_type(:json)
  # (params).to_json

  #redirect "/surveys/create"
end

get "surveys/:id/results" do

erb :results
end
