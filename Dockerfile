FROM node:10-alpine

ADD release.sh create-credentials.js .releaserc.json /semantic-release/

RUN npm i -g semantic-release @semantic-release/changelog @semantic-release/exec @semantic-release/git \
  && chmod +x /semantic-release/release.sh

CMD ["/semantic-release/release.sh"]
