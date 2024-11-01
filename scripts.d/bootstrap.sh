#!/usr/bin/env bash

ROOT=$(pwd)

if ! command -v docker &> /dev/null; then
  echo "Please install docker"
  echo "https://www.docker.com"
  exit 0
fi

if ! command -v terraform &> /dev/null; then
  echo "Please install terraform"
  echo "https://www.terraform.io"
  exit 0
fi

if ! command -v terraspace &> /dev/null; then
  echo "Please install terraspace"
  echo "https://terraspace.cloud"
  exit 0
fi

