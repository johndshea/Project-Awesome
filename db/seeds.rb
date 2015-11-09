
new_user = User.find_or_initialize_by(username: "bobthebest")
new_user.update(password: "password")

new_todo = new_user.todos.create(name: "I need to do stuff",
            description: "Lots of stuff")

new_team = Team.find_or_create_by(name: "Bob's Team", description: "This is the team Bob is on")

new_user.teams.push(new_team)

another_todo = new_team.todos.create(name: "We all need to do stuff",
            description: "Together stuff")

another_user = User.find_or_initialize_by(username: "jefftheworst")
another_user.update(password: "password")

another_user.todos.push(another_todo)
another_user.todos.push(new_todo)
