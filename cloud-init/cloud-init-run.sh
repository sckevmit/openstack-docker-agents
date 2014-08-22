#!/bin/sh
# supervisor doesn't like processes that exit, so fake it.
cloud-init -d init && tailf /var/log/cloud-init-output.log
