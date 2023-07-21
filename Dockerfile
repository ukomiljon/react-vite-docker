FROM node:lts-alpine
# ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
COPY vite.config.ts .
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 3000
RUN npm install typescript
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "run", "preview"]

# RUN npm install typescript
# FROM node:lts-alpine
# # ENV NODE_ENV=production
# WORKDIR /usr/src/app
# COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*","./"]
# COPY vite.config.ts .
# RUN npm install --production --silent && mv node_modules ../

# COPY . . 
# EXPOSE 3000

# # RUN npm i vite
# RUN npm install typescript
# RUN chown -R node /usr/src/app
# USER node
# CMD ["npm","run", "preview"]

