#!/bin/bash

# use chain substitute
sed -e '/^#/d' -e '/^$/d' -e 's/apache/httpd/' config

# substitute only 2 string
sed '2 s/appache/httpd/' config
# substitute only 1,3 string
sed '1,3 s/run/execute' config
# regexp use
sed '/#User/,/^$/ s/run/execute/' config

sed -e '/^#/d' -e '/^$/d' -e 's/apache/httpd/' -i.bak config

# subsitude only in string contains 'Group'
sed '/Group/ s/apache/httpd/' config

# use specific delimiter, substitute 2 inсlusion
echo 'one two /two three' | sed 's:/two:two:' | sed 's/two/twoo/2'

