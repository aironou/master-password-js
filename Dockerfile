ARG WORKDIR=/master-password-js
ARG USER=node

FROM node:26-alpine AS base

FROM base AS build

ARG WORKDIR

WORKDIR ${WORKDIR}

COPY package.json .
COPY package-lock.json .

RUN npm install

FROM base

ARG WORKDIR
ARG USER

USER ${USER}
WORKDIR ${WORKDIR}

COPY --chown=${USER} . .
COPY --from=build --chown=${USER} ${WORKDIR}/node_modules/ node_modules/

ENTRYPOINT ["npm"]