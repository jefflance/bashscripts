#!/bin/bash

source /etc/profile

rkhunter --update && rkhunter --check
