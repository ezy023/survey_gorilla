get "/surveys/create" do

erb :create
end

post "/surveys/create" do
  p params 
  # Survey.create(params)
  # Question.create()
  # Choices.create()
  # content_type(json)
  # {params}.to_json

  #redirect "/surveys/create"
end

get "surveys/:id/results" do

erb :results
end
