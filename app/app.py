from flask import Flask
from flask import jsonify


app = Flask(__name__)
log = app.logger


@app.route("/", methods=["GET"])
def index():
    return "Hello World!"


@app.route("/ping", methods=["GET"])
def ping():
    log.debug("ping!")
    return jsonify({"message": "pong!", "status": "success"})


if __name__ == "__main__":
    app.run()
