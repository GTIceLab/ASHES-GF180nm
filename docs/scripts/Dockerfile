# Tools used to regenerate the schematic exports and the simulation results.
#   docker build -t gf180-docs docs/scripts
FROM debian:sid
RUN apt-get update \
 && apt-get install -y --no-install-recommends ngspice python3 xschem xvfb xauth librsvg2-bin fonts-dejavu-core \
 && rm -rf /var/lib/apt/lists/*
