# REST-API for notes-taking app using Express   [![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/7385af5366b681e98a8b)



## How to run a server

1. Install dependencies:
```
bundle install
```
### For a development

2. Create Database (PostreSQL): 
```
createdb localyze_development
```
3. Run DB migrations using Sequelize:
```
rake db:migrate
```
5. Run
```
rails server
```

## REST API Endpoints

1. Registration
* Route: /signup
* Method: POST
* Data params: email, password
* Auth required : No
* Response: user object, token

2. Login
* Route: /authenticate
* Method: POST
* Data params: email, password
* Auth required : No
* Response: user object, token

4. Submit answer for the Prev Question
* Route: /question
* Method: GET
* Query params: question_id - id of the next question, id of the answer for the previous question
* Auth required : Yes
* Response: object with question and choices

**Postman Collection with all request examples are at the top of README.md**




