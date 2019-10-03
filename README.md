# Brontosaurus Ponderosa

A wee repo for testing Goreleaser and npm publication using GitHub Actions.

## Setup:

The first thing you should do if you want to use these files is search for and replace every instance of `trevor` and `brontosaurus-ponderosa` with your own info.

Then you'll need to go to your repo settings' `Secrets` tab and add a couple of secrets:
- `ReleaseToken` should hold value of the GitHub personal access token with `repo` scope
- `NpmAuthToken` should hold the value of a npm token with `read and publish` permissions

Together, these two values authenticate the Action to create a GitHub release and to publish a new version of the npm package.

The GitHub secrets page [is here](https://github.com/settings/tokens/new).

You can reach the npm tokens page by logging in and then selecting `Tokens` from the account drop-down menu in the top right corner of the page.

Note: This demo published two commands (`brontosaurus-ponderosa` and `ponderosa-brontosaurus`) which isn't something go-npm does natively so there's a manual `cp` of binary files in 'fe/publish-package.json'.

## Using the published package

Here's an example package.json that uses the published package:

	{
	  "name": "bp",
	  "version": "1.0.0",
	  "description": "Example using binary go commands",
	  "main": "index.js",
	  "private": true,
	  "scripts": {
	    "bp": "brontosaurus-ponderosa",
	    "pb": "ponderosa-brontosaurus"
	  },
	  "author": "Trevor F. Smith <subs@trevors.smith.name>",
	  "license": "MIT",
	  "dependencies": {
	    "brontosaurus-ponderosa": "^0.1.10"
	  }
	}

When npm installs it runs go-npm which installs the appropriate binary files from a GitHub release. This demo publishes only linux and macOS but Goreleaser can publish for other platforms.

