
json.teams(@teams) do |team|
  json.id 					team.id
  json.name 				team.name
  json.users        team.users
  json.todos        team.todos
end
