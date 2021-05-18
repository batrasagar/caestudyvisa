FROM node:11.13.0-alpine

# create destination directory
RUN mkdir -p /usr/src/nuxt-app
WORKDIR /usr/src/nuxt-app

# update and install dependency
RUN apk update
RUN apk add git

# copy the app, note .dockerignore
COPY . /usr/src/nuxt-app/
RUN npm install

# build necessary, even if no static files are needed,
# since it builds the server as well
RUN npm run build

# expose 5000 on container
EXPOSE 5000

# set app serving to permissive / assigned
ENV NUXT_HOST=0.0.0.0
# set app port
ENV NUXT_PORT=5000

# start the app
CMD [ "npm", "start" ]


# -->   docker build -t caestudyvisa .

# -->   docker run -it -p 5000:5000 caestudyvisa

# -->   docker image rm -f caestudyvisa

# -->   docker image ls

# -->   docker container ls

# -->   docker ps

# -->   docker exec -it ec4e6fda5322 sh

# -->   docker container kill xxxxxx

#  POWERFULL  -> remove all contaier/images etc

# -->   docker system prune -a

#--------------------------------------------------

# --> docker commit 2b8eee98c11b batrasagar/caestudyvisa:1
# --> docker push batrasagar/caestudyvisa:1


