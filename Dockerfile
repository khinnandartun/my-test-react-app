ARG  BUILD_WORKDIR=/usr/src/app
ARG  APP_WORKDIR=/usr/share/nginx/html
ARG  APP_USER=nginx
ARG  APP_PORT=80

FROM node:14 AS builder

ARG BUILD_WORKDIR

WORKDIR ${BUILD_WORKDIR}

COPY . .

RUN npm install

RUN npm run build -- --output-path=build

RUN pwd

RUN ls -al


FROM nginx:alpine 

ARG APP_WORKDIR
ARG APP_USER
ARG APP_PORT
ARG BUILD_WORKDIR

# ENV APP_USER="${APP_USER}"
# ENV APP_WORKDIR = "${APP_WORKDIR}"
# ENV APP_PORT = "${APP_PORT}"
# ENV BUILD_WORKDIR = "${BUILD_WORKDIR}"

COPY --chown=${APP_USER}:${APP_USER} --from=builder ${BUILD_WORKDIR}/build ${APP_WORKDIR}/

EXPOSE ${APP_PORT}


CMD ["nginx", "-g", "daemon off;"]




