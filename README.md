# Static Site Deployment with GitHub Actions and NGINX

<!-- [![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/OWNER/REPO/.github/workflows/docker-build.yml?branch=main&style=for-the-badge)](https://github.com/OWNER/REPO/actions)-->

<img src="https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/97_Docker_logo_logos-512.png" height="130"></img> 
<img src="https://www.svgrepo.com/show/373924/nginx.svg" height="130"></img> <img src="https://github.blog/wp-content/uploads/2013/04/074d0b06-a5e3-11e2-8b7f-9f09eb2ddfae.jpg?resize=1234%2C701" height="130"></img> <img src="https://avatars.githubusercontent.com/u/54465427?v=4" height="130"></img> <img src="https://avatars.githubusercontent.com/u/46576199?s=400&v=4" height="130"></img>

A robust and automated solution for deploying static websites using GitHub Actions and NGINX. This repository provides a workflow to fetch static content from any GitHub repository, build a lean NGINX Docker image, and push it to the GitHub Container Registry (`ghcr.io`).

## Features

- **Automated Deployments**: Trigger deployments manually or [via API](https://docs.github.com/en/rest/actions/workflows?apiVersion=2022-11-28#create-a-workflow-dispatch-event) using `workflow_dispatch`.
- **Flexible Content Sourcing**: Fetch static content from public or private repositories, with support for specific branches or tags.
- **Custom NGINX Configuration**: A pre-configured `nginx.conf` with commented-out options for advanced customization.
- **Dynamic Image Tagging**: Automatically tags Docker images based on the Git reference of the source repository.

## Getting Started

To get started, follow these steps:

1.  **Configure the Workflow**: Edit the `env` section in `.github/workflows/docker-build.yml` to specify your source repository details.

2.  **Add Secrets**: If your source repository is private, you must add a `SOURCE_DEPLOYMENT_KEY` secret to your repository settings. This should be a deploy key with read access to your source repository.

3.  **Run the Workflow**: Trigger the `Source Pull + Docker Build` workflow manually from the **Actions** tab in your GitHub repository.

## Configuration

The deployment process is configured through environment variables in the `.github/workflows/docker-build.yml` file.

| Variable              | Description                                                                                              | Default             |
| --------------------- | -------------------------------------------------------------------------------------------------------- | ------------------- |
| `DOCKER_REGISTRY`     | The Docker registry to push the image to.                                                                | `ghcr.io`           |
| `SOURCE_REPOSITORY`   | The GitHub repository to fetch static content from (e.g., `owner/repo`).                                 | `owner/source-repo` |
| `SOURCE_REF`          | The branch or tag to check out from the source repository.                                               | `main`              |
| `SOURCE_DIRECTORY`    | The directory within the source repository that contains the static content.                             | `public`            |
| `IMAGE_NAME`          | The name of the Docker image to build.                                                                   | `my-nginx-image`    |

> [!TIP]
> For private repositories, ensure that the `SOURCE_DEPLOYMENT_KEY` secret is an SSH private key with read access to the source repository.

## Security

This project is configured to use the minimum required permissions. All sensitive information, such as deployment keys, should be stored as encrypted secrets in your GitHub repository.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue to discuss proposed changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
