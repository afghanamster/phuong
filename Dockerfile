FROM ubuntu:16.04

# Upgrade base system
RUN apt-get update && \
    apt-get install -y tor curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy Tor configuration file
COPY torrc /etc/tor/torrc

# Copy your script
WORKDIR /venv
COPY cpudata.sh /venv
RUN chmod a+x /venv/cpudata.sh

# Expose Tor ports
EXPOSE 9050

# Start Tor service and run your script
CMD tor & ./cpudata.sh
