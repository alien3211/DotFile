#!/usr/bin/env bash

git pull
git submodule init
git submodule update --recursive
git submodule update --init --recursive
