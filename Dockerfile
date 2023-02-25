FROM cm2network/steamcmd:latest as build_stage
#FROM ubuntu
ENV STEAMAPPID=380870
ENV USER_NAME="linuxgsm"

# Steam ports
ENV RCON_PORT=27015 \
    RCON_PASSWORD="rcon-password" \
    # Server informations
    SERVER_NAME="berlin" \
    SERVER_PASSWORD="" \
    SERVER_PUBLIC_NAME="Test_Zombo" \
    SERVER_PUBLIC_DESC="" \
    SERVER_BRANCH="" \
    SERVER_BETA_PASSWORD="" \
    # Admin DB Password (required for the first launach)
    ADMIN_PASSWORD="pzserver-password" \
    # Server port
    SERVER_PORT=16261 \
    # Newer Project Zomboid server version needs ..61 and ..62 as udp ports below ports are probably unnecessary now
    SERVER_PORT_S=16262

# Switch to root to use apt-get
USER root
RUN adduser --disabled-password linuxgsm

# Install dependencies
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        rng-tools && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

# Create server directories and link to access them
RUN [ -d /home/linuxgsm/Zomboid ] || mkdir -p /home/linuxgsm/Zomboid && \
    chown linuxgsm:linuxgsm /home/linuxgsm/Zomboid && \
    ln -s /home/linuxgsm/Zomboid /server-data && \
    [ -d /home/linuxgsm/serverfiles ] || mkdir -p /home/linuxgsm/serverfiles && \
    chown linuxgsm:linuxgsm /home/linuxgsm/serverfiles && \
    ln -s /home/linuxgsm/serverfiles /server-files

RUN mkdir /opt/pzserver
RUN chown linuxgsm:linuxgsm /opt/pzserver

COPY ./scripts/update_zomboid.txt /
RUN chmod +x /*.txt

USER linuxgsm
RUN ./steamcmd.sh +runscript /update_zomboid.txt

USER root
# Copy scripts
COPY ./scripts/*.sh /
RUN chmod +x /*.sh

# Switch to the user
USER linuxgsm

ENTRYPOINT ["sh", "/home/linuxgsm/Zomboid/start-server.sh"]

EXPOSE ${SERVER_PORT}/udp ${SERVER_PORT_S}/udp ${RCON_PORT}

# Persistant folder with server data : /server-data
VOLUME ["/server-data", "/server-files"]



