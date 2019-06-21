### Development
 - Create a .env file with the PORT
 - `npm run dev`

### Publish server

Must have **docker** and **Heroku CLI** instaled
  
  - Setup (only on the first time)
    - `heroku login`
    - `git remote add https://git.heroku.com/chatzinho-da-bolagem.git`
  - `sudo heroku container:push web`
  - `heroku container:release`

> Obs: When a new commit to the original repository is created
> a pipeline from [BuddyWorks](https://app.buddy.works/leonardogviva/ws/pipelines) will build and push a new Docker image
> to the [docker hub](https://cloud.docker.com/u/7sete7/repository/docker/7sete7/ws).

### Publish client
  - Work in progress...