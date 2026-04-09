# specify the node base image with your desired version node:<version>
FROM node:22.17

COPY src ./src
COPY package.json .
COPY tsconfig.json .
RUN npm i

# replace this with your application's default port
CMD ["npm", "run", "dev"]
EXPOSE 3000
