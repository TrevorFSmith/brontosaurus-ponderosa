# Brontosaurus Ponderosa

A wee repo for testing Goreleaser and npm publication using GitHub Actions.

## Setup:

You'll need to create a personal access token with `repo` scope using [this GitHub page](https://github.com/settings/tokens/new).

Then you'll need to go to your repo settings' `Secrets` tab and add a new `ReleaseToken` secret with the value of the personal access token. That allows the Actions to watch for semver tags and then create GitHub releases.

