# Service File #

### What is a service file? ###
It is a plain text configuration file used by the systemd initialization system to manage, start, stop, and supervise background processes.

### Where do these files live? ###
-   /etc/systemd/system/ => For custom service files or admin created service files.
-   /lib/systemd/system/ or /usr/lib/systemd/system/ => Default location for files installed by the system's package manager.

### Anatomy of a service file ###

A service file has 3 sections:
-   Unit: Holds the metadata and ordering. 
-   Service: Defines what runs.
-   Install: Defines boot behaviour.

```
[Unit]
Description=My startup script
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/myscript.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```


Example of a service file
To change the permissions of a file:
```
[Unit]
Description=Changing Permission Script
After=network.target

[Service]
Type=oneshot
ExecStart=chmod 777 /home/ary/nginx.conf
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```
