# Permissions #

##  There are 3 Basic Permissions ##
-   Read (r): View the file's contents or list directory files.
-   Write (w): Modify a file or manage directories.
-   Execute (x): Run a file as a program or enter a directory.

## Permission Groups in Linux ##

Permissions are represented as nine characters. Each of the three 'rwx' characters refers to a different operation you can perform on the file.
```
rwx     rwx     rwx
user    group   other
```

User, Group, and Other Option in Linux File Permission.
-   User (u): The user permissions apply only to the owner of the file or directory, they will not impact the actions of other users.
-   Group (g): The group permissions apply only to the group that has been assigned to the file and directory, they will not affect the actions of other users.
-   Others (o): The other permissions apply to all other users on the system.


To change permissions of a certain directory or file, you would need to use the ```chmod ``` command. 
```
Example:
To change the permission of the directory 'test' in your home folder so that only the User can access it, you can use:
chmod 700 -R test/ (-R is for recursive) or
chmod g-rwx -R test/ && chmod o-rwx -R test/ or 
chmod u=rwx -R test/
```

# Ownership #

To change the Ownership of a certain file or directory, you would need to use the ```chown ``` command.

```
Example:
To change the ownership of the directory 'test' in your home folder such that it belongs to the root user, you can use:
chown -R root:root test/
Note: here the root previous to the ':' semicolon means the user while the root after the ':' means the group. 
So the user:group format. The owner user is root and the owner group is also set to root.
You can change the ownership of anything only if you have sudo privileges.
```

To only change the Group ownership of a certain file or directory, you would need to use the ```chgrp``` command.

The difference between ```chown``` and ```chgrp``` is that ```chown``` can change both the user and group ownership while the ```chgrp``` is specifically used only for the group ownership.

```
Example:
To change the ownership of the directory for group to 'ary' group

drwxrwx--- 3 root root 4096 Jul 18 10:41 test

we can use the command in the following manner:

'chgrp ary -R test/'

Note: You would need sudo privileges to execute the command. After executing the command, you can check the permissions change to:

drwxrwx--- 3 root ary 4096 Jul 18 10:41 test

```

## Special Permissions in Linux ##

