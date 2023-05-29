#!/usr/bin/python3
import sys

sys.path.insert(0, "~/.local/lib/python3.9/site-packages/")

from wsgiref.handlers import CGIHandler

from app import app

CGIHandler().run(app)
