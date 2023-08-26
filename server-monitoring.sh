#!/bin/bash
#
# @leonardosanfins
#

senha=mpvopen

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://192.168.15.21)

if [ $resposta_http -ne 200 ]
then
mail -s "Problema no servidor" leosanfinsh@gmail.com<<del
Houve um problema no servidor.
del
	
	expect -c "
		spawn ssh root@192.168.15.21
		expect \"password:\"
		send \"$senha\r\"
		expect \"~]#\"
		send \"systemctl restart httpd\r\"
		expect \"~]#\"
	"
fi
