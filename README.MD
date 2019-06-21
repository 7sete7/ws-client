### Development
 - Create a .env file with the PORT
 - `npm run dev`

### Publish server

Must have **docker** and **Heroku CLI** instaled

  - `docker build -t 7sete7/ws .`
  - `docker push 7sete7/ws`
  
  - Setup (only on the first time)
    - `heroku login`
    - `git remote add https://git.heroku.com/chatzinho-da-bolagem.git`
  - `sudo heroku container:push web`
  - `heroku container:release`

### Publish client
  - Work in progress...