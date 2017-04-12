FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y libstdc++6 && \
    apt-get install -y curl && \
    apt-get install -y vim && \
    useradd -m steam && \
    cd /home/steam
    
RUN echo 'steam            hard    nofile          100000' >> /etc/security/limits.conf
RUN whoami
RUN su - steam
RUN whoami
RUN su - steam && whoami
RUN pwd
RUN cd /home/steam && pwd
RUN mkdir /home/steam/arkdedicated
RUN cd /home/steam && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
    
RUN ls
RUN ls -lah 
RUN ls -lah /home/steam
RUN ls -lah /home/steam/linux32

RUN /home/steam/steamcmd.sh +quit
RUN /home/steam/steamcmd.sh +login anonymous +force_install_dir ./arkdedicated +app_update 376030 validate +quit
    
RUN ./arkdedicated/ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?SessionName=ArkAtNievenheim?MapPlayerLocation=true?NoTributeDownloads=true?QueryPort=27015?ServerPassword=akk1337?ServerAdminPassword=akk?MaxPlayers=10?ServerHardcore=False?ServerCrosshair=true?AllowThirdPersonPlayer=true?ServerPVE=true -server -log
