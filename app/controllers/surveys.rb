get "/surveys/create" do

  erb :create
end

post "/surveys/create" do
 

 survey = Survey.create(:title => params[:title], :description => params[:description])
 
 question = Question.create(:content => params[:question], :survey_id => survey.id )

 params.delete('title')
 params.delete('description')
 params.each do |key, val|
  
  x = "#{key}".to_sym

  Choice.create(:content => params[x] , :question_id => question.id )
end

  # content_type(:json)
  # (params).to_json
  "got it!"
  redirect "/surveys/create"
end

get "surveys/:id/results" do

  erb :results
end
