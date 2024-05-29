FROM node:21.2.0-alpine3.18
WORKDIR /app/cap
COPY package.json .
RUN npm install
COPY . .
EXPOSE 6000
CMD ["npm","start"]
