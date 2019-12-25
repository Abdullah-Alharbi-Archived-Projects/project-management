# Project Management App

**this project is a clone of trello.**

## 🤔 How to install

1. check your ruby version by running this command in the terminal:

```
$ ruby -v
```

2. remove `Gemfile.lock`
3. open `Gemfile` and change line 4:

```
ruby '<your_ruby_version>'
```

4. open `.ruby_version` and change the version there as well
5. run these commands:

```
$ bundle install
$ yarn install
```

6. don't forget to create the database

```
$ rails db:create
```

7. run migrations

```
$ rails db:migrate
```

8. run the server

```
rails server
```

## 🔥 Technologies

### 🤩 Front end

- Front End Framework: [Vue.js](https://vuejs.org/)
- Bundler: [Webpack](https://webpack.js.org/)
- Component Framework: [Element UI](https://element.eleme.io/#/en-US)

### 💎 Back end

- Language: [Ruby](https://www.ruby-lang.org/en/)
- Framework: [Ruby on Rails](https://rubyonrails.org/)
- Database: [Postgresql](https://www.postgresql.org/)

## ✔️ Features

1. [x] **Authentication.**
2. [x] **Create organization, edit organization, delete organization.**
3. [x] **Create many projects for organization, edit project, delete project.**
4. [x] **Create Cards, edit card, delete card using javascript.**
5. [x] **Create tasks in card, edit task, delete task using javascript.**
6. [x] **Drag tasks to another card.**

## 🗒️ User stories

#### Account:

1. As a user i want to create a new account
2. As a user i want to login to my account
3. As a user i want to edit my account

#### Organization:

1. As a user i want to create a new organization
2. As a user i want to edit organization
3. As a user i want to delete organization

#### Projects:

1. As a user i want to create a new project
2. As a user i want to edit project details
3. As a user i want to delete project

#### Cards:

1. As a user i want to create a new card
2. As a user i want to edit a card
3. As a user i want to delete a card

#### Tasks:

1. As a user i want to add a task for a specific card
2. As a user i want to edit a task
3. As a user i want to delete a task
4. As a user i want to comment on a task

## Wireframes

![sign_in](https://i.imgur.com/qghG8pB.png)
![sign_up](https://i.imgur.com/Di0MzCI.png)
![organization](https://i.imgur.com/Rcvdstu.png)
![add_organization](https://i.imgur.com/FELUNWV.png)
![tasks](https://i.imgur.com/l2pVjRO.png)

## Entity Relationship Diagram

![erd](https://i.imgur.com/hzcBfOJ.jpg)
