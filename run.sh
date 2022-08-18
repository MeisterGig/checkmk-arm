#!/bin/sh
echo "             __              __                __              __    "
echo ".----.-----.|__|______.----.|  |--.-----.----.|  |--.--------.|  |--."
echo "|   _|  _  ||  |______|  __||     |  -__|  __||    <|        ||    < "
echo "|__| |   __||__|      |____||__|__|_____|____||__|__|__|__|__||__|__|"
echo "     |__|     "
if [ ! -d /opt/omd/sites/mon ]; then
  ./init.sh
fi
if ! id mon &>/dev/null; then
    groupadd -g 1000 mon
    useradd -g 1000 -u 1000 -ms /bin/bash -d /opt/omd/sites/mon mon
    usermod -aG mon www-data
    usermod -aG omd mon
    omd enable mon
fi


echo "   _____ _______       _____ _______ _____ _   _  _____       ";
echo "  / ____|__   __|/\   |  __ \__   __|_   _| \ | |/ ____|      ";
echo " | (___    | |  /  \  | |__) | | |    | | |  \| | |  __       ";
echo "  \___ \   | | / /\ \ |  _  /  | |    | | | . \` | | |_ |      ";
echo "  ____) |  | |/ ____ \| | \ \  | |   _| |_| |\  | |__| |_ _ _ ";
echo " |_____/   |_/_/    \_\_|  \_\ |_|  |_____|_| \_|\_____(_|_|_)";
echo "                                                              ";
echo "                                                              ";

omd start mon
sleep infinity
