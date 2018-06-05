# Cloud Posse Local Development Harness

This development harness creates a [monorepo](https://docs.cloudposse.com/glossary/monorepo/) experience for a [polyrepo](https://docs.cloudposse.com/glossary/polyrepo/) architecture by leveraging [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

## Dependencies

* [OSX Developer Tools, Homebrew, Docker for Mac](https://docs.cloudposse.com/local-dev-environments/quickstart/)
* [aws-vault](https://docs.cloudposse.com/tools/aws-vault/) for logging into AWS
* [chamber](https://docs.cloudposse.com/tools/chamber/) for accessing development secrets

## Layout

```
├── Makefile                     # Task runner for all commands
├── README.md                    # Getting started documentation
├── build-harness                # Created from `make init`; used to build containers
├── docker-compose.yml           # Master compose environment
├── projects                     # Local checkout of all cloudposse repos supported by the local dev environment
│   ├── docs                     # Checkout of https://github.com/cloudposse/docs
│   └── geodesic                 # Checkout of https://github.com/cloudposse/geodesic
└── tasks                        # Make targets used for 
    ├── Makefile.codefresh       # Targets used for Codefresh CI/CD
    ├── Makefile.compose         # Targets relevant for `docker-compose`
    ├── Makefile.compose.db      # Targets relevant for working with `psql` under docker compose
    ├── Makefile.helpers         # Helper targets
    └── Makefile.git             # Targets for interacting with git
```

## Quick Start

Clone [this repo](https://github.com/cloudposse/dev/) recursively:

```
git clone --recursive git@github.com:cloudposse/dev.git
```

Initialize the [`build-harness`](https://github.com/cloudposse/build-harness):

```
make init
```

Install native dependencies (e.g. `chamber` and `aws-vault`)

```
make deps
```

Update current submodules in `projects/` folder to `@HEAD`

```
make git/update
```

List available `make` targets

```
make help
```

Bring up a complete environment: (*without* secrets)

```
make compose/up
```

Bring up a complete environment: (*with* secrets)

```
aws-vault exec ps-dev-admin -- chamber exec local -- make compose/up
```

**NOTE**: `local` represents a secrets service namespace. Multiple namespaces can be specified. 

Destroy current environment:

```
make compose/down
```

## Submodules

Add a new submodule:

```
git submodule add git@github.com:cloudposse/example.git projects/example/
```

Initialize a module (e.g. after calling `git submodule add`):

```
git -C projects/example/ submodule update --init
```
