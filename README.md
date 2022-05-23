# Docker-Shiny

This is a docker container and compose file to deploy a shiny server. It includes all the dependencies needed to build tidyverse packages from source, and installs tidyverse.

Also supports ARM plaforms through the use of[hvalev/shiny-server-arm](https://github.com/hvalev/shiny-server-arm-docker).

## Acknowledgements
- This docker file has been largely modified from:
https://blog.sellorm.com/2021/04/25/shiny-app-in-docker/

- Base image: https://github.com/hvalev/shiny-server-arm-docker