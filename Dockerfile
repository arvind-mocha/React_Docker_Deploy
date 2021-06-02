# Multi Containers

FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build 
# Built our react
 
FROM nginx
EXPOSE 80 
# mapping docker nginx port to out side port by exposing the nginx port
COPY --from=0 /app/build /usr/share/nginx/html
# nginx tells us to put the build inside the html directory
# We are just copying the build of react into nginx. These both are inside docker linux.
# check nginx docker for more information.
# We are just hosting a static website