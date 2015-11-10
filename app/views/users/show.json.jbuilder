json.user do

  json.id 					@user.id
  json.name 				@user.username
  json.teams        @user.teams
  json.todos        @user.todos
  json.team_todos   @user.team_todos
end
