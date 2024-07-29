FROM node:lts-alpine

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install --silent

COPY . .
RUN npm run build

EXPOSE 80
CMD ["npm", "run", "serve"]