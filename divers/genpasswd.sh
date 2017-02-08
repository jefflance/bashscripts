#!/bin/bash

function mkpw() { tr -dc '[:graph:]' < /dev/urandom | head -c ${1:-16}; echo; }

