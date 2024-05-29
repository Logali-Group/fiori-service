FROM node:20.14.0-alpine3.19
WORKDIR /app/cap
COPY package.json .
RUN npm install
COPY . .
EXPOSE 5000
CMD ["npm","start","--","--profile","pg"]
