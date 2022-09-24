FROM node:12.20-alpine AS build
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN apk update
RUN apk add git
RUN yarn install --pure-lockfile
COPY . .
RUN npm run build
RUN nmp start
