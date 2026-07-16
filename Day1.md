## Day 1 ##

### Topics covered ###

### File system ###
### Different types of files present in Linux ###

-   /bin: Binaries / applications are stored here.
-   /sbin: System Binaries for admin users.
-   /boot: Files required for the Operating System to boot are stored over here.
-   /dev: Information about the devices i.e hardware can be found over here.
-   /etc: Configurations are stored over here.
-   /home: User files.
-   /lib: Libaries.
-   /media: Used for automatically mounted removable devices like USB drives / CD's.
-   /mnt: Mount i.e can find the mounted devices. Similar to the C and D drives available in the Windows Operating System.
-   /opt: Optional; softwares are installed over here.
-   /proc: Information about the system processes and resources is stored here.
-   /root: Root user; folder for user with the root permissions.
-   /sys: System files; basically can be used to interact with the kernel.
-   /tmp: Temporary directory; for each session you can store temporary files over here.
-   /usr: Applications installed to be used by the user.
-   /var: Variable; basically files which grow by time are stored over here. For e.g logs. Or can have caches.

## Navigation In Linux ##

-   cd: Change Directory
-   mkdir: Make Directory
-   rmdir: Remove An Empty Directory
-   find: Use to find a specific file
-   pwd: Prints the present working directory
-   ls: list directory contents

## Links in Linux ##

## Links are is a pointer to a file. They point to a file or a directory. ##
## There are two types of links in Linux. ##

-   Soft Link / Symbolic Links: Similar to file shortcut in Windows OS. It contains a Inode that points to the original file. Any changes to either data is reflected in the other.

-   Hard Link: Simply another filename for the same file. Removing any link, just reduces the link count, but doesn't affect other links.


