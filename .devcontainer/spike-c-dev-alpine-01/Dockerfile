ARG __variant="3"
FROM alpine:${__variant}

ARG __group_name=vscode
ARG __group_uid=1000
ARG __user_name=vscode
ARG __user_uid=1000
ARG __workspace=/workspaces/this-project

ENV WORKSPACE_HOME=${__workspace}

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add --no-cache \
        cppcheck \
        gcc \
        git \
        musl-dev \
    && addgroup -g ${__group_uid} ${__group_name} \
    && adduser -D -u ${__user_uid} -G ${__group_name} --disabled-password ${__user_name}
RUN mkdir -p ${__workspace} \
    && chown -R ${__user_name}:${__group_name} ${__workspace}

USER ${__user_name}

WORKDIR ${__workspace}
