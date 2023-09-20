The Challenge

A large micro services project has set course to develop a considerable number of REST API’s in the next 12 months. They are aiming to use a standard set of technologies and patterns to bring consistency to their delivery efforts.

As part of this, you are required to build a git repository that includes the basic scaffolding required for each team to kick off their projects.

Your repository should define a comprehensive pipeline that has at least the following stages: test, build, publish.

As part of this, a simple REST API should also be present in the repository that has a root / endpoint that returns a valid JSON Hello World message, and a /status endpoint that returns the following response:

```
{
  "my-application": [
    {
      "description": "my-application's description.",
      "version": "1.0-1234",
      "sha": "abc53458585"
    }
  ]
}
```
Last but not least, your application is packaged and published to the project’s Docker image repository.

Considerations

You are asked to use the following technologies and make recommendations where appropriate:

Code repository: GitHub\
Pipelines: GitHub Actions\
API’s programming language: NodeJS or Golang ideally, but feel free to use something you are more accustomed to.\
Image repository: GitHub Packages ghcr.io

The 3 fields in the response above are not to be hardcoded:\
description is supplied through a metadata file residing on the repo.\
version is also supplied through the same metadata file however it also has your build number concatenated to it. The build number is incremented each time the build runs.\
sha is your git branch’s most recent commit hash (last commit SHA) at build time.

Moreover:\
Add simple test cases for your application.\
The repository should be well documented. Provide comments in code where appropriate and a nicely formatted README file.\
Are there any limitations to your implementation? Any risks associated? If so, explain those in the README file.
