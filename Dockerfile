FROM node:14-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./index.js .
# Expose port 3000 for the application
EXPOSE 3000
RUN ls
# Start the application
ENTRYPOINT node index.js
