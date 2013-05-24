user = User.new(name: 'tester')
user.password = 'password'
user.save

survey = Survey.create(title: 'this is survey', description: 'hopefully this works')

survey.creator_id = user.id
survey.questions << Question.create(content: 'is Erik a butt pirate?')
survey.questions.first.choices << Choice.create(content: 'yes')
survey.questions.first.choices << Choice.create(content: 'definitely yes')

survey.questions << Question.create(content: 'Whats eriks favorite food')
survey.questions.last.choices << Choice.create(content: 'butts')
survey.questions.last.choices << Choice.create(content: 'more butts')
