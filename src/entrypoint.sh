#!/usr/bin/env bash
exec uvicorn myservice.main:app --host 0.0.0.0 --proxy-headers --forwarded-allow-ips='*' --port 8000 $@
