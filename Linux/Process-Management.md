# Process Management # 

How to check the processes running inside Linux?

```
ps -ef 
```
```
ps aux
```

View processes in real time:
```
top
```

View them in more user friendly manner: 
```
htop
```

Find a specific Processes:
```
ps -ef | grep nginx
```

List processes for specific users:
```
ps -u username
```

Background / Foreground Processes:

To run processes in background:
```
command & 
```

To make the processes come into foreground:
```
fg
```

Nice & Renice:
Each process in the CPU has a nice value ranging from -20 to 19. With lower nice value being more priority than higher.

How to assign a nice value to a process:
```
nice -n <value> <process>
```

How to change priority of the nice value of the process:
```
sudo renice -n <value> -p <processID>
```

