# Flask Web App

## Deploy on Heroku (Optional)

1. [Signup to Heroku](https://signup.heroku.com/)

2. Install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#install-the-heroku-cli)

3. Create App `appname` from the CLI

```bash
$ heroku create appname
```

4. Heroku wants your app to reside standalone in a Git repository. Create a new private repository to hold your app on Github.com and push your app there. Notice that Heroku wants most files to be at the root of the repository (e.g., Procfile, runtime.txt, etc.)

5. Add a new git remote to your app repository using the `Heroku CLI`. This remote `heroku` is the one you will push to whennever you want to deploy the app to Heroku.

```bash
$ heroku git:remote -a appname
```

If the command is successful you will be able to ommit the `-a appname` part since `heroku` uses this information.

Before our first deploy we need to set a couple of standard environment variables:
```bash
$ heroku config:set FLASK_APP=app
```

```bash
$ heroku config:set WEB_CONCURRENCY=3
```

6. We will set the `DATABASE_URL` to use the database from Tecnico. Note that you need to replace `istID` and `pgpass` using your information.

```bash
$ heroku config:set DATABASE_URL=postgres://istID:pgpass@db.tecnico.ulisboa.pt/istID
```

7. Are you ready for our first deploy?

```bash
$ git push heroku main
```

Take notice of the output of the previous command. It should tell you whether the app was sucessfuly deployed or not. Congratulations!

8. Open the `appname` index page at https://appname.herokuapps.com/
