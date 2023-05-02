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


## Launching the Databases Workspace

Download a release or Clone using Git (Recommended!):

`git clone https://github.com/bdist/db-workspace.git`

Run the following command on a Terminal window to launch all services:

1. Move into the workspace folder `cd db-workspace/`

2. Sync your folder with the latest version available on GitHub `git pull`

2. (Build) and Launch all services `docker compose up --build`

**Note:** The terminal window prints the logs from all the services launched in this workspace.


## Using the Jupyter Notebook [https://docs.jupyter.org/en/latest/]((Docs))

1. The Jupyter Notebook service runs on the non-stardard `8888` port

Open the link printed by the service `notebook` towards the bottom of the terminal.

db-workspace-notebook-1  |     To access the server, open this file in a browser:
db-workspace-notebook-1  |         file:///home/jovyan/.local/share/jupyter/runtime/jpserver-7-open.html
db-workspace-notebook-1  |     Or copy and paste one of these URLs:
db-workspace-notebook-1  |         http://7fd8c38e99bd:8888/lab?token=f83ee982668ebe66bee2dbeb5875d14131a1d118d1e0fa12
db-workspace-notebook-1  |         http://127.0.0.1:8888/lab?token=f83ee982668ebe66bee2dbeb5875d14131a1d118d1e0fa12


## Open the Flask App

1. A Flask Web App service runs on the non-standard `5001` port

2. To check the app is running click [http://127.0.0.1:5001/ping](Ping)

3. Do you get the following API-like HTTP JSON Response? If yes, it's all good!

```json
{
  "message": "pong!",
  "status": "success"
}
```

4. Try the Web App index [http://127.0.0.1:5001/]. Do you get a response?

5. The code for the app lives in `app/app.py`


## FAQ and Troubleshooting

To start from scratch and rebuild:

`docker compose up --build --force-recreate --remove-orphans`
