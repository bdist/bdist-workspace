# bdist/workspace

This repository provides containerized applications and microservices for the Information Systems and Databases Course @ Instituto Superior Técnico.

This guide helps setting up a workspace environment for completing lab classes, which includes a database management system and other auxiliary services.

Services provided include:

- [PostgreSQL](https://www.postgresql.org) Open Source database management system
- [pgAdmin4](https://www.pgadmin.org) Open Source administration and development platform for PostgreSQL
- [bdist/notebook](https://github.com/bdist/notebook) Jupyter Notebook Databases Stack

## Prerequisites

### Install Docker Desktop

Docker Desktop is an application for MacOS, Linux, and Windows machines for the building and sharing of containerized applications and microservices.

Install Docker Desktop on
[Mac](https://docs.docker.com/desktop/install/mac-install/),
[Windows](https://docs.docker.com/desktop/install/windows-install/) or
[Linux](https://docs.docker.com/desktop/install/linux-install/)

### Install Git

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

Install Git on
[Mac](https://github.com/git-guides/install-git#install-git-on-mac)
[Windows](https://github.com/git-guides/install-git#install-git-on-windows) or
[Linux](https://github.com/git-guides/install-git#install-git-on-linux)

## Your first time launching the Workspace

1. Open Terminal.

2. Change the current working directory to the location where you want the cloned directory.

3. Run the following command to create your local clone

   ```bash
   git clone https://github.com/bdist/workspace.git
   ```

   Press **Enter**

   ```bash
   Cloning into 'workspace'...
   remote: Enumerating objects: 297, done.
   remote: Counting objects: 100% (80/80), done.
   remote: Compressing objects: 100% (65/65), done.
   remote: Total 297 (delta 41), reused 38 (delta 14), pack-reused 217
   Receiving objects: 100% (297/297), 733.65 KiB | 501.00 KiB/s, done.
   Resolving deltas: 100% (136/136), done.
   ```

4. Change the current working directory to the location of the cloned directory.

   ```bash
   cd workspace/
   ```

5. From the cloned directory, start up `bdist/workspace` by running

   ```bash
   docker compose up --build
   ```

   _Note:_ The services are attached to this Terminal, so the logs for all the services provided will be printed on its window.
   Quitting this Terminal window quits all the services abruptly.
   To shutdown safely you will need to issue CTRL+C in the Terminal window and wait until all the services stop gracefuly.
   You can close the Terminal window after all services are stopped.

### Using the Jupyter Notebook [(Docs)](https://docs.jupyter.org/en/latest/)

The Jupyter Notebook service runs on the non-stardard `8888` port. Token authentication is enabled.

1. You need to find your Authentication Token to login every time the `bdist/workspace` is launched (e.g., after a reboot)

2. Find the section of the logs towards the bottom of the Terminal window that look like this excerpt:

   ```log
   workspace-notebook-1  |     Or copy and paste one of these URLs:
   workspace-notebook-1  |         http://7fd8c38e99bd:8888/lab?token=f83ee982668ebe66bee2dbeb5875d14131a1d118d1e0fa12
   workspace-notebook-1  |         http://127.0.0.1:8888/lab?token=f83ee982668ebe66bee2dbeb5875d14131a1d118d1e0fa12
   ```

   _Note:_ You can also view the logs for the `workspace-notebook-1` in the Containers tab in the Docker Desktop application.

3. Follow the link printed last with host `127.0.0.1`. The authentication token is embedded in the URL.

## Included services

### pgAdmin

pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.

1. Login [here](http://127.0.0.1:5050/login).

   ```html
   Username: pgadmin@tecnico.pt Password: pgadmin
   ```

2. Click the button `Add New Server`.

3. Set the Name in the General tab to `postgres`.

4. Set the Hostname in the Connection tab to `postgres`.

5. Use the same username and password you would provide `psql`.

   ```html
   Username: postgres Password: postgres
   ```

### Flask Web App

1. Check if the app is running and open [ping](http://127.0.0.1:8080/ping).

2. Do you get an API-like HTTP JSON-formatted response like this?

   ```json
   {
     "message": "pong!"
   }
   ```

3. Try modifying the message in `app/app.py` while it is running.

4. In the logs, check if an automatic reload of the Flask Web App is triggered when you save your changes.

## FAQ and Troubleshooting

### I get an initdb: error: directory "/var/lib/postgresql/data" exists but is not empty

You need to delete the data volume used by postgres and recreate it.

1. Open a new Terminal.

2. Run this to shutdown the containers and remove all associated volumes.

   ```bash
   docker compose down -v
   ```

3. Run the steps in the following section to update `bdist/workspace`.

### How do I update my workspace?

1. Firstly, from the project directory run

   ```bash
   git pull
   ```

   This updates `bdist/workspace` to the latest version.

2. Secondly, from the project directory run

   ```bash
   docker compose pull
   ```

   This updates container images to the latest version.

3. Lastly, from the project directory run

   ```bash
   docker compose up --build --force-recreate --remove-orphans
   ```

   This starts up the `bdist/workspace` and cleans up unused images.

### I get Permission Errors and/or the notebook Save Button is disabled

You need to set the owner of every directory under `/home/jovyan/` to the user `jovyan` and groups `users`. This is the default username and group for the user in the notebook container.

You only need to run this once.

1. Open Terminal.

2. Run this to reset the permissions for files and folders under `home/jovyan/`.

   ```bash
   chown -R jovyan:users /home/jovyan/
   ```

If this still does not solve the issue with permissions then follow this recipe:

1. Open Terminal.

2. Run this do access the notebook container as administrator (root):

   ```bash
   docker compose exec -e GRANT_SUDO=yes --user root notebook /bin/bash
   ```

3. Run this to reset the permissions for files and folders under `home/jovyan/`.

   ```bash
   chown -R jovyan:users /home/jovyan/
   ```

### A psycopg.errors.UndefinedTable exception is thrown

```python
(psycopg.errors.UndefinedTable) relation "depositor" does not exist
```

If the exception thrown looks like the one in the example, then follow this checklist:

1. Is the database you are connected to the correct one?

   ```html
   %sql postgresql://bank:bank@postgres/**bank**
   ```

2. Is the database empty?

   Connect to the target database on the Terminal via `psql` and run the command `\d`.

   ```bash
   $ psql -h postgres -U bank
   Password for user bank:
   psql (16.1 (Debian 16.1-1.pgdg120+1))
   Type "help" for help.

   postgres bank@bank=>\d
           List of relations
   Schema |   Name    | Type  | Owner
   --------+-----------+-------+-------
   public | account   | table | bank
   public | borrower  | table | bank
   public | branch    | table | bank
   public | customer  | table | bank
   public | depositor | table | bank
   public | loan      | table | bank
   (6 rows)
   ```

   _Note:_ Alternatively, get the list of relations inside the notebook. Run this on a new notebook cell:

   ```python
   %sqlcmd tables
   ```

## Issues

Please use GitHub Issues to report any issues you might have with `bdist/workspace`.

## Credits

Flavio Martins
