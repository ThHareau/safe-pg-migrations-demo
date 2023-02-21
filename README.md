# README

This repository is a demonstration of the gem (https://github.com/doctolib/safe-pg-migrations)[safe-pg-migrations].

## Usage

Each commit of the project intends to demonstrate a bad migration example, and how to fix it.

### Setup

Start by cloning the repository, then start an interactive rebase : 

```bash
git rebase --root -i
```

A file editor will pop, replace every `pick` with `edit`. With vim, type `:%/pick/edit/g`. 

Then, install the dependencies, and create the database: 

```bash
bundle install
bundle exec rails db:create
bundle exec rails db:reset
```

In a first shell, start the server in production mode. It prevents the server from reloading the code,
which will help us execute migrations on a live project :

```bash
RAILS_ENV=production bundle exec rails s
```

You should now be able to open the application on http://0.0.0.0:3000. 

In a second shell, create an `ACCESS SHARE` lock on the table `messages`. To do so, execute the rake task `first_message`. It will open a transaction and never release it. 
If you need to release the lock, press enter.

```bash
bundle exec rake first_message
```

### Execution

Start by moving forward by one step: 

```bash
git rebase --continue
```

You can see the difference with the previous commit with `git diff HEAD~`. Once you are ready, launch the migration: 

```bash
bundle exec rails db:migrate
```

If needed, kill the migration with `CTRL+C`. If it does not work, a global statement timeout is set to 60 seconds. Just wait and the server will start working again.

Once you are done, remove your changes and move forward again by one commit, by following the same section. 