# Text Processing #

### Different types of commands for text processing. ###

### GREP ###
It stands for Global Regular Expression Print. It is used search for specific words, phrases, or regular expressions patterns within files.
Example:
```
cat /etc/ssh/sshd_config | grep Port
```

Output:
```
# For options that accept multiple values, like 'Port', subsequent definitions
# configuration must be re-generated after changing Port, AddressFamily, or
#Port 22
#GatewayPorts no
```
We can also use Grep without using cat to print the file.
Example:
```
grep Port /etc/ssh/sshd_config

# For options that accept multiple values, like 'Port', subsequent definitions
# configuration must be re-generated after changing Port, AddressFamily, or
#Port 22
#GatewayPorts no
```

We can use the -c flag to check the number of occurences of a given word we would like to search
Example:
```
grep -c Port /etc/ssh/sshd_config

4
```

We can use the -n flag to check the number of line at which the word occurs.
Example:
```
grep -n Port /etc/ssh/sshd_config

13:# For options that accept multiple values, like 'Port', subsequent definitions
27:# configuration must be re-generated after changing Port, AddressFamily, or
35:#Port 22
112:#GatewayPorts no
```

grep is case sensitive. To make sure that your searches include different cases, we can use the -i flag.
Example:
```
grep -i port /etc/ssh/sshd_config

# For options that accept multiple values, like 'Port', subsequent definitions
# configuration must be re-generated after changing Port, AddressFamily, or
#Port 22
#GatewayPorts no
```

To search for a specific word in the whole directory we can use the following command:
Example:
```
grep -i hello *

test1.txt:Hello ABC
test2.txt:Hello DEF
test3.txt:Hello GHI
test4.txt:Hello JKL
test5.txt:Hello MNO
```

To recursively search for a keyword in a directory as well as the subdirectories we can use the -r flag.
Example:
```
grep -r Error /var/log

---Too long output to add here---

```
