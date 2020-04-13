###############################################################
# Default registry variables
ARG BASE_REGISTRY=nexus-docker-secure.levelup-nexus.svc.cluster.local:18082
ARG BASE_IMAGE=redhat/ubi/ubi8
ARG BASE_TAG=8.1
###############################################################
ARG VENDOR=mattermost
ARG IMAGE_NAME=mattermost-operator
ARG IMAGE_VERSION=v1.4.0
###############################################################
FROM opensource/${VENDOR}/${IMAGE_NAME}:${IMAGE_VERSION} AS build

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

LABEL name="Mattermost Operator" \
  maintainer="dev-ops@mattermost.com" \
  vendor="Mattermost" \
  io.k8s.description="Mattermost Operator creates, configures and helps manage Mattermost installations on Kubernetes" \
  io.k8s.display-name="Mattermost Operator" \
  io.openshift.tags="mattermost,collaboration,operator" \
  summary="Quick and easy Mattermost setup" \
  description="Mattermost operator deploys and configures Mattermost installations, and assists with maintenance/upgrade operations."

ENV OPERATOR=/usr/local/bin/mattermost-operator \
    USER_UID=1001 \
    USER_NAME=mattermost-operator

COPY --from=build /usr/local/bin/* /usr/local/bin/

RUN mkdir -p ${HOME} && \
    chown ${USER_UID}:0 ${HOME} && \
    chmod ug+rwx ${HOME} && \
    chmod g+rw /etc/passwd

ENTRYPOINT ["/usr/local/bin/entrypoint"]

USER ${USER_UID}