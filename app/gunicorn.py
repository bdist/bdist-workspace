bind = "0.0.0.0:5001"
backlog = 2048

workers = 2
worker_class = "sync"
worker_connections = 1000
timeout = 30
keepalive = 2

errorlog = "-"
loglevel = "info"
accesslog = "-"
access_log_format = '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'

max_requests = 1000

daemon = True
pidfile = "gunicorn.pid"


def pre_fork(server, worker):
    server.log.info("Check some connection")
