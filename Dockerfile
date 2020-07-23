FROM golang:1.14-alpine
MAINTAINER kaixuan1115 (http://github.com/kaixuan1115)

LABEL "com.github.actions.name"="Go Release Binary"
LABEL "com.github.actions.description"="Automate publishing Go build artifacts for GitHub releases"
LABEL "com.github.actions.icon"="cpu"
LABEL "com.github.actions.color"="orange"

LABEL "name"="Automate publishing Go build artifacts for GitHub releases through GitHub Actions"
LABEL "version"="master"
LABEL "repository"="http://github.com/kaixuan1115/go-release.action"

RUN apk add --no-cache curl jq git build-base upx zip

ADD entrypoint.sh /entrypoint.sh
ADD build.sh /build.sh
ENTRYPOINT ["/entrypoint.sh"]
