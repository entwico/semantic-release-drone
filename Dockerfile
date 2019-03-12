FROM node:10-alpine

ADD release.sh /usr/bin/release
ADD .releaserc.json /semantic-release/.releaserc

RUN npm i -g semantic-release @semantic-release/changelog @semantic-release/exec @semantic-release/git \
    && chmod +x /usr/bin/release

CMD ["release"]