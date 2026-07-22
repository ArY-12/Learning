# Users #

```Creation of users in Linux:```

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

How to check the users already existing on the system?
```cat /etc/passwd```

Default Configuration file for 'useradd' command:
``` /etc/default/useradd```.
We can change the configurations over here to change the default behaviour of the `useradd` command

```Deletion of users in Linux:```

How to delete the users?

```
userdel username
```

Note: This only deletes the user from the system. If their directory exists in the /home directory, it won't get deleted by default.

To delete the user directory in /home, we can use the command:

```
userdel -r username
```

This deletes the home directory with the user.




