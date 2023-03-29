from flask import Flask
from flask import jsonify


app = Flask(__name__)
log = app.logger


@app.route("/ping", methods=["GET"])
def ping():
    log.info("ping!")
    return jsonify({"message": "pong!", "status": "success"})


if __name__ == "__main__":
    app.run()
