FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y libstdc++6 && \
    apt-get install -y curl && \
    apt-get install -y vim
    
RUN useradd -m -s /bin/bash steam
    
RUN echo 'steam            hard    nofile          100000' >> /etc/security/limits.conf
USER steam
WORKDIR /home/steam
RUN mkdir ./arkdedicated
RUN ls -lah
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
RUN ls -lah

RUN ./steamcmd.sh +quit
RUN ./steamcmd.sh +login anonymous +force_install_dir ./arkdedicated +app_update 376030 validate +quit
    
RUN ./arkdedicated/ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?SessionName=ArkAtNievenheim?MapPlayerLocation=true?NoTributeDownloads=true?QueryPort=27015?ServerPassword=akk1337?ServerAdminPassword=akk?MaxPlayers=10?ServerHardcore=False?ServerCrosshair=true?AllowThirdPersonPlayer=true?ServerPVE=true -server -log
