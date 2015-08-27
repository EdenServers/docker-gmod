# Official Garry's Mod Server Container on EdenServers

[![Run on EdenServers](https://img.shields.io/badge/EdenServers-view-blue.svg)](http://www.edenservers.us)

![](http://image.noelshack.com/fichiers/2015/35/1440632825-garrysmod2.png)

All-in-one Garry's Mod Server Container built for [EdenServers](http://www.edenservers.us).

It also includes an SCP server.

---

**This image is meant to be used on an EdenServers Server.**

Our images are built to specifically run for our services. You can run it directly with Docker though.

---
### 1.0.0 (2015-08-27)

This initial version contains:

* *steamcmd*, and a pre-installed Garry's Mod
* *scp* Server to upload and download files

---

## Install

    $ docker pull edenservers/gmod

---

## Config

Instructions for Garry's Mod config can be found [here](http://wiki.garrysmod.com/page/Linux_Dedicated_Server_Hosting).

| Environment Variable  | Description |
| ------------- | ------------- |
| MAXPLAYERS | Garry's Mod Max Players  |
| MAP    | Garry's Mod Map  |
| STARTUP_OPTIONS    | Additional startup options  |
| USERNAME    | SCP Username  |
| PASSWORD     | SCP Password  |

| Port  | Description |
| ------------- | ------------- |
| 27015 | Garry's Mod and RCON  |
| 27005 | Garry's Mod |
| 22 | SCP  |

---

## Run example

    $ docker run -e MAXPLAYERS=32 -e MAP=gm_construct -e USERNAME=edenservers -e PASSWORD=edenservers -p 27015:27015 -p 27015:27015/udp -p 27005:27005 -p 27005:27005/udp -p 1234:22 -d edenservers/gmod

---

Made by [![EdenServers](http://image.noelshack.com/fichiers/2015/35/1440630894-logo.png)](https://www.edenservers.us)
