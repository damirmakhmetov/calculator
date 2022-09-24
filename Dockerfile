FROM node:alpine3.15 AS build
COPY package.json yarn.lock ./
RUN npm install
RUN npm start
