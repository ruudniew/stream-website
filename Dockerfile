FROM node:current-alpine

# update and install dependency
RUN apk update && apk upgrade
RUN apk add --no-cache git make libc6-compat

# create destination directory
RUN mkdir -p /ruudniewtv-stream-website
WORKDIR /ruudniewtv-stream-website

# copy the app, note .dockerignore
COPY . /ruudniewtv-stream-website/

# set app serving to permissive / assigned
ENV NUXT_HOST=0.0.0.0
# set app port
ENV NUXT_PORT=3101
ENV NODE_ENV="production"

# expose 3000 on container
EXPOSE 3101:3101

# update and install dependency
RUN npm install --save
RUN npm run build

# start the app
CMD ["npm", "start"]
