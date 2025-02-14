This project currently isn't accepting pull requests

## Developing

### Requirements

- Node
- NPM

### Setup

A nix flake is provided to help set up your project. If you have `nix-direnv` installed, you can add
the following to a local `.envrc` file:

```sh
use flake

watch_file development/flake.nix
watch_file development/flake.lock
```

Otherwise, if you're using nix, you can run `nix develop`.

This should get you all set up and ready to go.

```sh
npm install
npm run test:watch
```

If you want to build and reference this library from another project, as a `file:` dependency, you
can run the TypeScript compiler in watch mode to ensure there's a built version available:

```sh
npm exec tsc -- --watch
```
