# bdist/db-workspace

This repository provides containerized applications and microservices for the Databases Course @ Instituto Superior Técnico.

This guide helps setting up a workspace environment for completing lab classes, which includes a database management system and other auxiliary services.
_Note:_ Lab guides are updated to reflect this workspace environment.

Services provided include:

- [PostgreSQL 15.2](https://www.postgresql.org/docs/release/15.2/) Open Source database management system
- [pgAdmin4 7.1](https://www.pgadmin.org/docs/pgadmin4/7.1/release_notes_7_1.html) Open Source administration and development platform for PostgreSQL
- [bdist/db-notebook](https://github.com/bdist/db-notebook) Jupyter Notebook Data Science Python Stack


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

3. Type

```bash
$ git clone https://github.com/bdist/db-workspace.git
```

4. Press **Enter** to create your local clone.

```bash
$ git clone https://github.com/bdist/db-workspace.git
Cloning into 'db-workspace'...
remote: Enumerating objects: 297, done.
remote: Counting objects: 100% (80/80), done.
remote: Compressing objects: 100% (65/65), done.
remote: Total 297 (delta 41), reused 38 (delta 14), pack-reused 217
Receiving objects: 100% (297/297), 733.65 KiB | 501.00 KiB/s, done.
Resolving deltas: 100% (136/136), done.
```

5. Change the current working directory to the location of the cloned directory.

```bash
$ cd db-workspace/
```

6. From your project directory, start up the `db-workspace` by running

```bash
$ docker compose up --build
```

_Note:_ The services are attached to this Terminal, so the logs for all the services provided will be printed on its window. Quitting this Terminal window quits all the services abruptly. To shutdown safely you will need to issue CTRL+C in the Terminal window and wait until all the services stop gracefuly. You can close the Terminal window after all services are stopped.


### Using the Jupyter Notebook [(Docs)](https://docs.jupyter.org/en/latest/)

The Jupyter Notebook service runs on the non-stardard `8888` port. Token authentication is enabled.

1. You need to find your Authentication Token to login every time the workspace is launched (e.g., after a reboot)

2. Find the section of the logs towards the bottom of the Terminal window that look like this excerpt:

```log
db-workspace-notebook-1  |     Or copy and paste one of these URLs:
db-workspace-notebook-1  |         http://7fd8c38e99bd:8888/lab?token=f83ee982668ebe66bee2dbeb5875d14131a1d118d1e0fa12
db-workspace-notebook-1  |         http://127.0.0.1:8888/lab?token=f83ee982668ebe66bee2dbeb5875d14131a1d118d1e0fa12
```

_Note:_ You can also view the logs for the `db-workspace-notebook-1` in the Containers tab in the Docker Desktop application.

3. Follow the link printed last with host `127.0.0.1`. The authentication token is embedded in the URL.

4. Click the blue `New Launcher` button on the left labeled with a `+` sign.

5. Open Terminal.

6. Change the current working directory to `~/data/` directory.

```bash
$ cd ~/data/
```

7. Connect to PostgreSQL using the `psql` command-line interface.

```bash
$ psql -h postgres -U postgres
```

8. Enter the password for the user `postgres`.

`postgres`↵

9. Create a new unprivileged user `db`.

```sql
CREATE USER db WITH PASSWORD 'db';
```

10. Create database `db` and set user `db` as owner of the database.

```sql
CREATE DATABASE db
	WITH
	OWNER = db
	ENCODING = 'UTF8';
```

_Note:_ Set the character encoding to [UTF-8](https://en.wikipedia.org/wiki/UTF-8) explicitly.

11. Grant all privileges on the database `db` to the user `db`.

```sql
GRANT ALL ON DATABASE db TO db;
```

12. You can continue the tutorial in the [Lab01 Notebook](http://127.0.0.1:8888/lab/tree/work/Lab01/Lab01.ipynb).


_Note:_ Always run the cell that loads the `sql` extension before any cell marked with the `%%sql` magic command.


## FAQ and Troubleshooting

### My notebook Save Button is disabled or I am getting Permission Errors

You need to set the owner of every directory under `/home/jovyan/` to the user `jovyan` and groups `users`. This is the default username and group for the user in the notebook container.

You only need to run this once.

1. Open Terminal.

2. Run this to reset the permissions for files and folders under `home/jovyan/`.

```bash
chown -R jovyan:users /home/jovyan/
```


### A psycopg2.errors.UndefinedTable exception is thrown

```python
(psycopg2.errors.UndefinedTable) relation "depositor" does not exist
```

If the exception thrown looks like the one in the example, then follow this checklist:

1. Is the database you are connected to the correct one?

```html
%sql postgresql://db:db@postgres/**db**
```

2. Is the database empty?

Connect to the target database on the Terminal via `psql` and run the command `\d`.

```bash
$ psql -h postgres -U db
Password for user db:
psql (15.2 (Ubuntu 15.2-1.pgdg22.04+1))
Type "help" for help.

db=>\d
         List of relations
 Schema |   Name    | Type  | Owner
--------+-----------+-------+-------
 public | account   | table | db
 public | borrower  | table | db
 public | branch    | table | db
 public | customer  | table | db
 public | depositor | table | db
 public | loan      | table | db
(6 rows)
```

_Note:_ Alternatively, get the list of relations inside the notebook. Run this on a new notebook cell:

```
%sqlcmd tables
```


### Are the containers outdated? Do you want to force a clean rebuild?

From your project directory, start up the `db-workspace` by running

```bash
$ docker compose up --build --force-recreate --remove-orphans
```

## Included services

### pgAdmin

pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.

1. Login [here](http://127.0.0.1:5050/login).

```
Username: pgadmin@tecnico.pt
Password: pgadmin
```

2. Click the button `Add New Server`.

3. Set the Name in the main tab to `postgres`.

4. Set the Hostname in the main tab to `postgres`.

5. Use the same username and password you would provide `psql`.

```
Username: postgres
Password: postgres
```


### Flask Web App

1. Check if the app is running and open [ping](http://127.0.0.1:5001/ping).

2. Do you get an API-like HTTP JSON-formatted response like this?

```json
{
  "message": "pong!",
  "status": "success"
}
```

3. Open the [index page](http://127.0.0.1:5001/). Do you get a response like this?

```html
Hello world!
```

4. Try modifying the message in `app/app.py` while it is running.

5. In the logs, check if an automatic reload of the Flask Web App is triggered when you save your changes.

6. Open the [index page](http://127.0.0.1:5001/). Do you get your message now?


## Issues

Please use GitHub Issues to report any issues you might have with `db-workspace`.
