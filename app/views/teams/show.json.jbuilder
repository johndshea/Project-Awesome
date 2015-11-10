json.team do

  json.id 					@team.id
  json.name 				@team.name
  json.description 	@team.description
  json.todos     		@team.todos
  json.created_at 	@team.created_at
  json.updated_at 	@team.updated_at
  json.users        @team.users
end
