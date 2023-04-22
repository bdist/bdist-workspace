# bdist/workspace

This repository is provided as an auxiliary guide to run all the software used in the 2023 Databases Course @ Tecnico.

This guide will help setup the environment needed to complete the lab classes and learn databases, including a database server and other services:

- [PostgreSQL 15.2](https://www.postgresql.org/docs/release/15.2/)
- [pgAdmin4 7.0](https://www.pgadmin.org/docs/pgadmin4/7.0/release_notes_7_0.html)


This workspace also launches a Jupyter Notebook Data Science Python Stack
- [bdist/db-notebook](https://github.com/bdist/db-notebook)

_Note:_ The lab guides were updated to reflect this setup. If you have any trouble with this workspace, please report it by openning an issue on GitHub.

## Install Docker Desktop

Using docker will allow us to keep all the software in sync in every operating system that you may be using while keeping this software independent of any other software you might have installed on your system.

Install Docker Desktop on
[Mac](https://docs.docker.com/desktop/install/mac-install/),
[Windows](https://docs.docker.com/desktop/install/windows-install/) or
[Linux](https://docs.docker.com/desktop/install/linux-install/)


## Using this workspace

Download a release or Clone using Git (Recommended!):

`git clone https://github.com/bdist/db-workspace.git`

Run the following command on a Terminal window to launch all services:

1. `cd db-workspace/`

2. `docker compose up --build`

3. Open the link printed by the notebook service towards the  at the bottom of the terminal.

**Note:** The terminal window will print logs from all the services launched by the workspace.

## FAQ and Troubleshooting

To start from scratch:

`docker compose up --build --force-recreate --remove-orphans`
