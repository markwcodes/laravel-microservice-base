#### _This repository replicates a recent DevOps interview [technical challenge](CHALLENGE.md), with some details removed or anonymised._

# Laravel Microservice Template

[![CI Status](https://github.com/markwcodes/laravel-microservice-base/actions/workflows/ci.yml/badge.svg)](https://github.com/markwcodes/laravel-microservice-base/actions)
[![Build Status](https://github.com/markwcodes/laravel-microservice-base/actions/workflows/build.yml/badge.svg)](https://github.com/markwcodes/laravel-microservice-base/actions)

## Overview

This repository serves as a starting point for Laravel microservices at ACME Corp, including pre-configured Continuous Integration and Continuous Deployment (CI/CD) pipelines for testing and building applications. It's designed to streamline the development process and ensure code quality through automated testing and build steps.

### Getting Started
Follow these steps to set up the project locally:

1. **Clone the Repository:**
```
git clone https://github.com/markwcodes/laravel-microservice-base.git
cd laravel-microservice-base
```

2. **Install Dependencies:**
  
Make sure you have Composer installed. Then run:

```
composer install
```

3. **Local Environment Configuration**

Copy `.env.example` and rename it to `.env`\
Update any necessary configuration settings such as app name, database credentials, etc.

4. **Generate Application Key:**
```
php artisan key:generate
```

5. **Run Migrations:**
```
php artisan migrate
```

6. **Start the Development Server:**
```
php artisan serve
```

7. **Access the Application:**
 
Visit http://localhost:8000 in your browser to see the application in action.

---

### Previewing a remote build locally in Docker
Run this command from your project's root directory to launch the latest build in Docker:
```
docker run --publish 80:80 --env-file .env ghcr.io/markwcodes/laravel-microservice-base:latest
```

**Note: You must be authenticated in Docker with your GHCR.io credentials to pull any images from the container registry.**

You can then navigate to [localhost](http://localhost/) and the [status endpoint](http://localhost/status) endpoints:

![image](https://github.com/markwcodes/laravel-microservice-base/assets/7064464/b830a47f-be3b-4e76-82ab-a6990403a8ca)

## Continuous Integration and Continuous Deployment (CI/CD) Pipelines

The repository includes pre-configured CI/CD pipelines in GitHub Actions for automated testing and building.

### Build/Publish Workflow:
Opening a Pull Request to the main branch will trigger the test, build and publish workflow.
If all tests pass, the workflow builds, tags and pushes the build to the repository's container registry (GHCR.io).

### CI Workflow
Commits in all branches in the repository are continuously unit tested by the CI workflow.

### Configuration
CI/CD pipelines are defined in the `.github/workflows` directory. You can customise these workflows to fit your project's specific needs.

# Future considerations:

- Create nginx webserver side-car container instead of using the php-apache image
- Tidy and organise CI/CD Dockerfile and helper scripts. Consider moving infrastructure into its own repository eventually
- Add linting to CI pipeline
- Add test coverage to CI pipeline
- Use SQL service container in CI environments
- Configure additional build/deployment stages (Dev, Staging, UAT)
- Setup better nested workflows to avoid duplication
- Figure out correct `storage` directory user permissions in Dockerfile (777 for now)
- Configure Front-end builds
- Protect master branch from direct push (needs paid GH account)
- Add git tags to commit milestones
- Processes to update composer, node packages & security scanning
- Using Laravel Sail for easier, Dockerised local dev setup
- Set up automated deployments
