
json.todos(@todos) do |todo|

  json.id 					todo.id
  json.name 				todo.name
  json.description 	todo.description
  json.done 				todo.done
  json.priority 		todo.priority
  json.created_at 	todo.created_at
  json.updated_at 	todo.updated_at
  json.belongs_to_teams(todo.find_teams) do |team|
  	json.team_name team.name
  end
 	json.belongs_to_users(todo.find_users) do |user|
  	json.user_name user.username
  end
end

json.team_todos(@team_todos) do |todo|

  json.id 					todo.id
  json.name 				todo.name
  json.description 	todo.description
  json.done 				todo.done
  json.priority 		todo.priority
  json.created_at 	todo.created_at
  json.updated_at 	todo.updated_at
  json.belongs_to_teams(todo.find_teams) do |team|
  	json.team_name team.name
  end
 	json.belongs_to_users(todo.find_users) do |user|
  	json.user_name user.username
  end
end