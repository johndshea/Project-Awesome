# API Docs

## Classical

User + Session are all done the 'old fashioned way' via server-rendered erb.

ROOT (/): Renders the Sign In / Sign Up forms.
POST /users will create a new user, create a new session, redirect to the SPA page
POST /session will create a new session, redirect to SPA page

---
## JSON

GET /current_user will return JSON object containing currently logged in user

GET /todos will return two arrays of todos, one being the currently logged in user's todos, and the other being all todos belonging to all teams of which the currently logged in user is a member.

    ```json
    {
      todos: [
        {
          id: 3,
          name: "get shit done",
          description: "this shit needs to get done",
          due_date: "2015-11-06 14:28:15.003944",
          done: false,
          priority: 2,
          created_at: "2015-11-05 12:28:15.003941",
          updated_at: "2015-11-03 11:18:15.003841",
          belongs_to_teams: [
            {
              name: "Team One",
              type: "Team"
            }]
          belongs_to_users:
            {
              name: "Dillon",
              type: "User"
            },
          ]
        }
      ],
      team_todos: [
        {
          id: 3,
          name: "get shit done",
          description: "this shit needs to get done",
          due_date: "2015-11-06 14:28:15.003944",
          done: false,
          priority: 2,
          created_at: "2015-11-05 12:28:15.003941",
          updated_at: "2015-11-03 11:18:15.003841",
          belongs_to_teams: [
            {
              name: "Team One",
              type: "Team"
            }]
          belongs_to_teams: [
            {
              name: "Dillon",
              type: "User"
            },
          ]
        }
      ]
    }
    ```

POST /todos will take a JSON object as such:

    ```json
    {
      authenticity_token: "osmeaksdfiohuiHDFIUSDHFUkjadfhjk324",
      todo: {
        name: "get shit done",
        description: "this shit needs to get done",
        due_date: "2015-11-06 14:28:15.003944",
        done: false,
        priority: 2,
        belongs_to: [
          {
            name: "Team One",
            type: "Team"
          },
          {
            name: "Dillon",
            type: "User"
          },
        ]
      }
    }
    ```

    And return the created todo as an object.
