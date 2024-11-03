# Static Site Deployment with GitHub Actions and NGINX

This repository provides a robust CI/CD pipeline for deploying static websites using GitHub Actions and NGINX. It automates the process of fetching source code, building a Docker image, and pushing it to GitHub Container Registry (ghcr.io). The setup is optimized for security and flexibility, ensuring smooth deployments based on branches or tags.

## Features

### Automated Source Code Retrieval
- **Flexible Checkout:** Easily download HTML source code from any public GitHub repository.
- **Tag or Branch Selection:** Choose to fetch the source code by specifying a tag or a branch, allowing precise control over the deployed version.

### Customizable NGINX Configuration
- **Standard `nginx.conf`:** Comes with a baseline configuration tailored for serving static content.
- **Disable Browser Caching:** Optional settings to prevent browsers from caching your assets, ensuring users always see the latest updates.
- **Custom 404 Page:** Easily set up a personalized 404 error page to enhance user experience.
- **Disable Logging:** Option to turn off access and error logs for improved performance and reduced storage usage.
- **Additional Parameters:** Includes commented-out configurations for CORS, security headers, HTTPS redirects, and more, allowing you to customize NGINX to your needs.

### Docker Image Management
- **NGINX Docker Image:** Automatically build a Docker image that bundles your static content with the customized NGINX configuration.
- **Dynamic Tagging:** Docker images are tagged based on the Git reference (branch name or tag) that triggers the workflow, ensuring clear versioning without using the ambiguous `latest` tag.
- **GitHub Container Registry Integration:** Seamlessly push your Docker images to ghcr.io using GitHub's secure `GITHUB_TOKEN`, adhering to the least-privilege principle for enhanced security.

### Secure and Efficient CI/CD Pipeline
- **Least-Privilege Permissions:** The GitHub Actions workflow requests only the necessary permissions (`contents: read` and `packages: write`) to perform its tasks, minimizing security risks.
- **Environment Variables:** Easily configurable environment variables for Docker registry, source repository details, and image naming, providing flexibility across different projects.
- **Manual and Automated Triggers:** Although primarily set up for manual triggers (`workflow_dispatch`), the workflow can be easily extended to respond to push events on branches and tags for automated deployments.

### Easy Customization and Maintenance
- **Modular Structure:** Clear separation between the GitHub Actions workflow, Dockerfile, and NGINX configuration, making it straightforward to update and maintain each component.
- **Comprehensive Documentation:** Detailed comments and explanations within configuration files and the workflow script guide you through customization and usage.
- **Scalable Setup:** Suitable for small projects and easily scalable for larger deployments, accommodating growing static site needs.

## Getting Started

1. **Configure Environment Variables:**
   - Set `DOCKER_REGISTRY`, `SOURCE_REPOSITORY`, and `IMAGE_NAME` in the workflow file to match your project details.

2. **Customize NGINX Configuration:**
   - Modify `nginx.conf` to enable or disable features like browser caching, custom error pages, and logging based on your requirements.

3. **Trigger the Workflow:**
   - Use the GitHub Actions tab to manually trigger the workflow, specifying the desired branch or tag for deployment.

4. **Monitor Deployments:**
   - Track the progress and status of your deployments through GitHub Actions logs to ensure successful builds and pushes.

By leveraging this setup, you can achieve a streamlined and secure deployment process for your static websites, with full control over versioning and configuration.
