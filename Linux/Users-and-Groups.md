# Users #

Creation of  users in Linux: 

Users can be created through the sudo access.

Example: 
```
sudo useradd -m username
```
This command would create a new user 'username'. The '-m' flag is used to create a new user directory in the /home directory.

We can set the password for the user using the below command:
```
sudo passwd username
```

We can also set a custom shell for the user while creation or after creation.

Example:
```
sudo useradd -m username -s /bin/bash
```
The -s flag is used to specify the shell.

Or for existing user:
```
sudo usermod username -s /bin/bash
```

