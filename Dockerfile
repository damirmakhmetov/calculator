FROM node:alpine3.15 AS build
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN npm install
RUN npm start
