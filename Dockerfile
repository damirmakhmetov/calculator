FROM node:alpine3.15 AS build
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN apk update
RUN apk add git
RUN yarn install --pure-lockfile
COPY . .
RUN npm build
RUN nmp start
