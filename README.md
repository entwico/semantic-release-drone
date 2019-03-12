# semantic-release-drone

Drone plugin for making semantic releases based on https://github.com/semantic-release/semantic-release.

## Usage

See [commit message format](https://github.com/semantic-release/semantic-release#commit-message-format) to use it.

Add the following to the drone configuration

```yml
kind: pipeline
name: default

steps:
- name: semantic-release
  image: entwico/semantic-release
  settings:
    user_name: john # semantic release committer name (git config user.name)
    user_email: john@example.com # semantic release committer email (git config user.email)
    github_token: # semantic release token (for authentication)
      from_secret: token
```

or for BitBucket

```yml
    bitbucket_token: # semantic release token (for authentication)
      from_secret: token
```

or for GitLab

```yml
    gitlab_token: # semantic release token (for authentication)
      from_secret: token
```

## What it does

- automatically creates a semantic version number
- (master branch only) attaches the version number as repo's git tag
- (master branch only) exposes the version number into the file `.release-version`
- (master branch only) automatically creates, populates and pushes CHANGELOG.md to your master branch

## License

MIT