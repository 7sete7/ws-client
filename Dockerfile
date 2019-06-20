FROM node:8

RUN ["mkdir", "app"]

COPY package.json /app
COPY webpack/ /app/webpack
COPY src /app/src

WORKDIR /app
RUN npm install

RUN ["npm", "run", "build-server"]

CMD [ "node", "build/server/index.js" ]
EXPOSE 8080