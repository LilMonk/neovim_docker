# Neovim Docker Environment

This repository contains a Docker setup for running Neovim in a containerized environment. This setup ensures a consistent development environment across different machines.

## Prerequisites

- Docker installed on your machine
- Docker Compose installed on your machine

## Setup

1. Clone this repository:
    ```sh
    git clone https://github.com/yourusername/neovim_docker.git
    cd neovim_docker
    ```

2. Build and start the Docker container:
    ```sh
    make build up
    ```

3. Access Neovim inside the container:
    ```sh
    docker compose exec nvim nvim
    ```

## Configuration

You can customize the Neovim configuration by editing the files in the `nvim/` directory. These files will be mounted into the Docker container.

## Contributing

Feel free to open issues or submit pull requests if you have any improvements or bug fixes.

## License

This project is licensed under the MIT License.
