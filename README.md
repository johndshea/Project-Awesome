# API Docs

## Classical

User + Session are all done the 'old fashioned way' via server-rendered erb.

ROOT (/): Renders the Sign In / Sign Up forms.
POST /users will create a new user, create a new session, redirect to the SPA page
POST /session will create a new session, redirect to SPA page

---
## JSON

GET /session will return JSON object containing currently logged in user

```json
  {
    id: 6,
    username: "test",
    password_digest: "$2a$10$cRRdMmiuHW.9OzDTj7iwEu/GrnL4XpKVBwE14hyauCRtwaYI9JvWu",
    user_teams_id: null,
    created_at: "2015-11-08T02:36:45.847Z",
    updated_at: "2015-11-08T02:36:45.847Z"
  }
```

GET /users will return JSON object containing all of the users in the database, their associated todos, and their associated team_todos.

```json
  {
    users: [
      {
        id: 3,
        name: "Barbara",
        teams: [ ],
        todos: [
          {
          id: 2,
          name: "this is dumb",
          description: null,
          due_date: null,
          done: false,
          priority: 2,
          todo_assignment_id: 3,
          todo_assignment_type: "User",
          created_at: "2015-11-06T17:23:51.969Z",
          updated_at: "2015-11-06T17:23:51.969Z"
          }
        ],
        team_todos: null
        },
      {
        id: 4,
        name: "greg",
        teams: [
          {
            id: 5,
            name: "team one",
            description: null,
            user_teams_id: null,
            created_at: "2015-11-06T19:19:31.369Z",
            updated_at: "2015-11-06T19:19:31.369Z"
          }
        ],
        todos: [
          {
            id: 5,
            name: "greg's todo",
            description: null,
            due_date: null,
            done: false,
            priority: 2,
            todo_assignment_id: 4,
            todo_assignment_type: "User",
            created_at: "2015-11-06T19:26:33.798Z",
            updated_at: "2015-11-06T19:26:33.798Z"
          }
        ],
        team_todos: [
          {
            id: 4,
            name: "first todo",
            description: null,
            due_date: null,
            done: false,
            priority: 2,
            todo_assignment_id: 5,
            todo_assignment_type: "Team",
            created_at: "2015-11-06T19:20:26.392Z",
            updated_at: "2015-11-06T19:20:26.392Z"
          }
        ]
      },
      {
        id: 6,
        name: "test",
        teams: [ ],
        todos: [
          {
            id: 6,
            name: "wash the dog",
            description: null,
            due_date: null,
            done: false,
            priority: 2,
            todo_assignment_id: 6,
            todo_assignment_type: "User",
            created_at: "2015-11-08T04:38:44.243Z",
            updated_at: "2015-11-08T04:38:44.243Z"
          }
        ],
        team_todos: null
      }
    ]
  }
```

GET /teams will return JSON object containing all of the teams in the database, their associated users, and the teams' todos.

```json
{
  teams: [
    {
      id: 4,
      name: "test team",
      users: [ ],
      todos: [
        {
          id: 3,
          name: "ugh",
          description: null,
          due_date: null,
          done: false,
          priority: 2,
          todo_assignment_id: 4,
          todo_assignment_type: "Team",
          created_at: "2015-11-06T17:29:23.997Z",
          updated_at: "2015-11-06T17:29:23.997Z"
        }
      ]
    },
    {
      id: 5,
      name: "team one",
      users: [
        {
          id: 4,
          username: "greg",
          password_digest: "gregpassword",
          user_teams_id: null,
          created_at: "2015-11-06T19:20:03.012Z",
          updated_at: "2015-11-06T19:20:03.012Z"
        }
      ],
      todos: [
        {
          id: 4,
          name: "first todo",
          description: null,
          due_date: null,
          done: false,
          priority: 2,
          todo_assignment_id: 5,
          todo_assignment_type: "Team",
          created_at: "2015-11-06T19:20:26.392Z",
          updated_at: "2015-11-06T19:20:26.392Z"
        }
      ]
    }
  ]
}
```

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

POST /teams will take a JSON object as such:

  ```json
  {
    authenticity_token: "osmeaksdfiohuiHDFIUSDHFUkjadfhjk324",
    team: {
      name: "Bob's Team",
      description: "Team which has Bob on it",
    }
  }
  ```

And return the created team as an object.

## BUG LIST:
