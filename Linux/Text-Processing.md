# Text Processing #

### Note: Mini Labs are in /Linux/Mini-Labs.md ###

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


### CUT ###

The cut command is used to extract specific parts of each line from a file or input. 

You can extract data based on byte position, character position, or fields separated by delimiter.

Examples:

To extract certain specific words:

Using the byte position, we will have to specify the position of the byte for the same using the -b flag:
```
cat hardlink.txt
Hello Everyone. This is a Hard Link.

cut -b 1-14 hardlink.txt
Hello Everyone
```
Using the character position, we will have to specify the position of the character for the same using the -c flag:
```
cat hardlink.txt
Hello Everyone. This is a Hard Link.

cut -c 1-14 hardlink.txt
Hello Everyone
```

This works same as the byte character, except it's more useful when there is no emphasis on the byte but the character, as there can be different types of characters in multiple languages. The charcter positions helps over there.

Using the fields with a delimiter by using the -d  with an input delimiter in quotes and a -f fields flag for the fields to output.

Example: To extract the usernames from /etc/passwd file.
```
cut -d ":" -f 1 /etc/passwd | tail -3

amaura
impidimp
eevee
```

Another example: To extract the uids from /etc/passwd file.
```
cut -d ":" -f 3 /etc/passwd | tail -3

1002
1003
1004
```

Another example: To extract the shells of users from the /etc/passwd file.
```
cut -d ":" -f 7 /etc/passwd | tail -3
/bin/bash
/bin/bash
/bin/bash
```

### SORT ###

The sort command is used to sort the text of a file based on its content.

Example:

Sorting a file normal way:

```
sort -f file.txt

eight
five
four
nine
one
seven
six
ten
three
two
```

Sorting a file in reverse:
```
sort -r file.txt

two
three
ten
six
seven
one
nine
four
five
eight
```

Sorting a file but printing only the unique contents:
```
sort -u file.txt

eight
five
four
nine
one
seven
six
ten
three
two
```

Sorting a file according to the numeric value:
```
sort -n file.txt

1.five
1.four
1.ten
2.six
2.three
3.four
3.one
4.five
4.two
5.ten
```

