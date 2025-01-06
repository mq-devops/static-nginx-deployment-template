# Static Site Deployment with GitHub Actions and NGINX

This repository automates the deployment of static websites using GitHub Actions and NGINX. 

It fetches static content from another GitHub repository (public or private), builds a customized NGINX Docker image, and pushes it to GitHub Container Registry (`ghcr.io`). The setup provides clear versioning based on Git references.

## Features

- **Automated Source Code Retrieval**
  - **Public and Private Repositories:** Supports fetching static content from both public and private GitHub repositories.
  - **Tag or Branch Selection:** Allows specifying a tag or branch to determine the version of the content to deploy.
  - **Custom Source Directory:** Enables specifying a subdirectory within the source repository that contains the static content.

- **Customizable NGINX Configuration**
  - **Standard `nginx.conf`:** Comes with a baseline configuration optimized for serving static content.
  - **Optional Settings:** Options to disable browser caching, provide a custom 404 error page, and disable logging.
  - **Additional Configurations:** Supports configurations for CORS, security headers, and HTTPS redirects.

- **Docker Image Management**
  - **NGINX Docker Image:** Automatically builds a Docker image bundling the static content with the customized NGINX configuration.
  - **Dynamic Tagging:** Tags the Docker image based on the Git reference (tag or branch) used to trigger the workflow, ensuring clear versioning without using the ambiguous `latest` tag.
  - **GitHub Container Registry Integration:** Pushes the Docker image to GitHub Container Registry (`ghcr.io`) securely using GitHub's `GITHUB_TOKEN` and an optional custom access token for private repositories.

- **Secure and Efficient CI/CD Pipeline**
  - **Least-Privilege Permissions:** The workflow requests only the necessary permissions (`contents: read` and `packages: write`), enhancing security.
  - **Environment Variables Configuration:** Easily configurable environment variables for Docker registry, source repository details, image naming, and source directory.
  - **Manual Triggers:** Designed to be triggered manually via the GitHub Actions tab, giving control over deployments.

## How It Works

1. **Source Code Retrieval:** The workflow fetches static content from the specified repository and reference (tag or branch). If a `SOURCE_DEPLOYMENT_KEY` is provided, it accesses private repositories; otherwise, it fetches from public repositories.

2. **Directory Management:** It copies the specified source directory containing the static content to the build context.

3. **Docker Image Building:** The workflow builds a Docker image using the provided `Dockerfile`, which sets up NGINX with the static content and custom configuration.

4. **Image Tagging and Pushing:** The Docker image is tagged based on the Git reference and pushed to GitHub Container Registry, providing clear versioning and secure storage.

## Configuration

- **Environment Variables:**
  - `DOCKER_REGISTRY`: Docker registry URL (`ghcr.io`).
  - `SOURCE_REPOSITORY`: The GitHub repository to fetch static content from.
  - `SOURCE_REF`: The specific tag or branch to checkout.
  - `SOURCE_DIRECTORY`: Directory within the source repository containing static content.
  - `IMAGE_NAME`: Name of the Docker image to build.

- **Secrets:**
  - `SOURCE_DEPLOYMENT_KEY` *(Optional)*: Deployment key for accessing private repositories.
  - `GITHUB_TOKEN`: Automatically provided by GitHub Actions for authentication with GitHub Container Registry.

## Usage

1. **Set Environment Variables:** Configure the environment variables in the workflow file with your repository details.

2. **Configure Secrets:** If accessing a private repository, add `SOURCE_DEPLOYMENT_KEY` as a secret in your GitHub repository settings.

3. **Trigger Workflow:** Manually trigger the workflow via the GitHub Actions tab.

4. **Monitor Deployment:** Check the workflow logs to ensure successful build and push of the Docker image.

## Security

- **Least-Privilege Permissions:** The workflow only requests necessary permissions
- **Secure Access Tokens:** Use repository secrets to manage access tokens