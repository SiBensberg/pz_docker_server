# Docker for project zomboid steam server
This builds upon the steamcmd docker and lends some code from linuxgsm both under MIT license at the point of writing.

```angular2html
https://hub.docker.com/r/cm2network/steamcmd/
https://github.com/GameServerManagers/LinuxGSM
```

## Build
```angular2html
docker build ./ -t pz_server_sb
```

## Run
- create `server-data folder`
- open folder for writing
- Simply use the provided `run_server.bash`

## Debug
For debugging there is the `debg.bash` which starts the container with an interactive shell.
