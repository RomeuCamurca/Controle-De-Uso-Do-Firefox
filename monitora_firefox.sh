#!/bin/bash
touch primeiro.txt
touch segundo.txt
touch terceiro.txt

for i in `cat $1`
do
        usuario=`echo $i | cut -d ':' -f 1`
        ip=`echo $i | cut -d ':' -f 2`
        pid=$(ssh $usuario@$ip "pgrep firefox")
        if [ $? == 0 ]
        then
		verificaPrimeiro=`grep $ip primeiro.txt`
		if [ $? != 0 ]
		then
			verificaSegundo=`grep $ip segundo.txt`
			if [ $? != 0 ]
			then
				verificaTerceiro=`grep $ip terceiro.txt`
				if [ $? != 0 ]
				then
					echo $ip >> primeiro.txt
					ssh -X $usuario@$ip 'DISPLAY=:0 notify-send "Feche o Firefox e Volte a Programar!" -i "/usr/share/icons/Humanity/apps/48/bash.svg"'
				else
					sed -i s/$ip// terceiro.txt
					sed -i '/^$/d' terceiro.txt 
					echo $ip >> primeiro.txt
					ssh -X $usuario@$ip 'DISPLAY=:0 notify-send "Feche o Firefox e Volte a Programar!" -i "/usr/share/icons/Humanity/apps/48/bash.svg"'
				fi
			else
				sed -i s/$ip// segundo.txt
				sed -i '/^$/d' segundo.txt
				echo $ip >> terceiro.txt
				ssh $usuario@$ip "killall -u $usuario"
			fi
		else
			sed -i s/$ip// primeiro.txt
			sed -i '/^$/d' primeiro.txt
			echo $ip >> segundo.txt
			ssh $usuario@$ip kill $pid
		fi
	else
		echo "O USUARIO: $usuario, IP: $ip Não Está Com O Firefox Ativo!"
        fi
done
