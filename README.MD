## WS
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/2f0c7ef4efac4deeb064084bae3f5c97)](https://app.codacy.com/app/7sete7/Ws?utm_source=github.com&utm_medium=referral&utm_content=7sete7/Ws&utm_campaign=Badge_Grade_Dashboard)

### Development
- Create a .env file with the following:
  - PORT - The port in wich the server will run
  - MONGO_URL - The The mongo url to connect to the mongo database
  - SERVER_URL - The urk in wich the server is running
- `npm run dev`

### Publish server

This step is only required when there is a server change.
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

The client will be automatically published (with some delay) trhough a [BuddyWorks](https://app.buddy.works/leonardogviva/ws/pipelines) pipeline.
It willbuild the client and push to the repository [ws-client](https://github.com/7sete7/ws-client) and be accesible at [github pages](https://7sete7.github.io/ws-client/).
