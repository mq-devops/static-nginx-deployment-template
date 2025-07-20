# Static Site Deployment with GitHub Actions and NGINX

<!-- [![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/OWNER/REPO/.github/workflows/docker-build.yml?branch=main&style=for-the-badge)](https://github.com/OWNER/REPO/actions)-->

This repository provides a robust and automated solution for deploying static websites using GitHub Actions and NGINX. It fetches your static content from any GitHub repository, builds a lean NGINX Docker image, and pushes it to the GitHub Container Registry (`ghcr.io`).

## Features

- **Automated Deployments**: Trigger deployments manually or [via API](https://docs.github.com/en/rest/actions/workflows?apiVersion=2022-11-28#create-a-workflow-dispatch-event) with `workflow_dispatch`.
- **Flexible Content Sourcing**: Fetch static content from public or private repositories, with support for specific branches or tags.
- **Custom NGINX Configuration**: A pre-configured `nginx.conf` with commented-out options for further customization.
- **Dynamic Image Tagging**: Automatically tags Docker images based on the Git reference.

## Getting Started

1. **Configure the Workflow**: Edit the `env` section in `.github/workflows/docker-build.yml` to match your source repository details.
2. **Add Secrets**: If you're using a private repository, add a `SOURCE_DEPLOYMENT_KEY` secret to your repository settings. This should be a deploy key with read access to your source repository.
3. **Run the Workflow**: Trigger the `Source Pull + Docker Build` workflow manually from the Actions tab.

## Configuration

The deployment process is configured through environment variables in the `.github/workflows/docker-build.yml` file:

| Variable              | Description                                                                                              | Default             |
| --------------------- | -------------------------------------------------------------------------------------------------------- | ------------------- |
| `DOCKER_REGISTRY`     | The Docker registry to push the image to.                                                                | `ghcr.io`           |
| `SOURCE_REPOSITORY`   | The GitHub repository to fetch static content from (e.g., `owner/repo`).                                 | `owner/source-repo` |
| `SOURCE_REF`          | The branch or tag to check out from the source repository.                                               | `main`              |
| `SOURCE_DIRECTORY`    | The directory within the source repository that contains the static content.                             | `public`            |
| `IMAGE_NAME`          | The name of the Docker image to build.                                                                   | `my-nginx-image`    |

### Secrets

- `SOURCE_DEPLOYMENT_KEY`: (Optional) A private SSH key used to access private source repositories.

## Security

- **Least Privilege**: The workflow is configured to use the minimum required permissions.
- **Secrets**: All sensitive information, such as deployment keys, should be stored as encrypted secrets in your GitHub repository.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue.

## License

This project is licensed under the [MIT License](LICENSE).
