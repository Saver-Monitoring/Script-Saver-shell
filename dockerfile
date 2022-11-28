#!/bin/bash

FROM mysql:5.7

COPY ./BancoSaver/SaverBD-Local.sql /docker-entrypoint-initdb.d/