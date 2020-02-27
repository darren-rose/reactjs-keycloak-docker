FROM node:alpine as build
WORKDIR /app
RUN npm install -g serve
COPY public /app/public
COPY src /app/src
COPY .env /app/.env
COPY .env.development /app/.env.development
COPY .env.staging /app/.env.staging
COPY .env.production /app/.env.production
COPY package.json /app/package.json
COPY tsconfig.json /app/tsconfig.json
COPY yarn.lock /app/yarn.lock
RUN yarn
ARG env
RUN echo "env:$env"
RUN yarn build:$env
FROM nginx:alpine as deployment
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
