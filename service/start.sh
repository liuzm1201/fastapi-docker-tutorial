#!/bin/bash
cd /opt/service
uvicorn main:app --host 0.0.0.0 --port 8000 --access-log --log-config log.conf --reload
