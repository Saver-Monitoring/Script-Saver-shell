#!/bin/bash

FROM mysql:5.7

COPY ./BancoSaver/ /docker-entrypoint-initdb.d/