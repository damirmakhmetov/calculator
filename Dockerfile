FROM node:12.20-alpine AS build
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN apk update
RUN apk add git
RUN yarn install --pure-lockfile
COPY . .
RUN npm run build-test
RUN ls /var/www/html/

#STAGE 2
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /var/www/html/ /var/www/html
