#!/bin/bash

# hecho por avivyap, :]
#un parseado y pa' dentro


#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
orangeColour="\e[38;5;208m\033[1m"
whiteColour="\e[0;97m\033[1m"
whiteUltra="\e[38;5;231m"


trap ctrl_c INT

function ctrl_c(){

        echo -e "${redColour}[!] Saliendo.......${endColour}"
        exit 1
        tput cnorm

}

function helpPanel(){

        echo -e "\n${yellowColour}[+]${endColour}${grayColour} Uso: ./portsClean.sh${endColour}\n"
        echo -e "\t${purpleColour}f)${endColour}${blueColour} Especifica el archivo del que quieres extraer los puertos${endColour}\n"
                echo -e "\t${purpleColour}o)${endColour}${blueColour} Especifica el nombre del archivo en el que quieres volcar el resultado de esta herramienta (opcional)${endColour}\n"
        echo -e "\t${grayColour} Ejemplo: ./portsClean.sh -f puertos -o archivo_generado${endColour}"
        tput cnorm
}

function portClean(){

        echo -e "\n${whiteColour}[*]${endColour}${blueColour} Extrayendo informacion..........${endColour}\n"

        ip=$(cat $file| awk '{print $2}' | xargs | awk '{print $3}')
        echo -e "\t${whiteColour}[*]${endColour}${blueColour} Direccion ip:${endColour} ${purpleColour}$ip${endColour}\n"

        echo -e "\t${whiteColour}[*]${endColour}${blueColour} Puertos:${endColour}\n"
        for linea in $(grep "Ports:" $file | xargs | tr ' ' '\n');do
        if [[ $linea =~ open ]];then
                linea_2=$(echo "$linea" | tr '/' '\n' | xargs)
                puerto=$(echo "$linea_2" | awk '{print $1}')
                servicio=$(echo "$linea_2" | awk '{print $4}')
                echo -e "\t\t${whiteColour}[*]${endColour}${turquoiseColour} $puerto${endColour} ${whiteColour}->${endColour} ${purpleColour}$servicio${endColour}\n"
                puertos+="$puerto,"
    fi
        done
        puertos=$(echo $puertos | sed 's/,$//')
        echo -e "\n${whiteColour}[+]${endColour}${blueColour} Puertos copiados en la clipboard${endColour}\n"
        echo -n "$puertos" | xclip -selection clipboard
                tput cnorm
}


function guardarArchivo(){

        tput cnorm
        echo -e "\n${whiteColour}[+]${endColour}${blueColour} Creando archivo $output...${endColour}\n"
        exec >"$output" 2>&1
        portClean
}

tput civis
declare -i parametro=0;while getopts ":f:o:" arg;do

        case $arg in
                f) file=$OPTARG; let parametro+=1;;
                                o) output=$OPTARG; let parametro+=1;;
        esac
done
if [ $parametro == "0" ];then
        helpPanel
else

        if [ $parametro == "2" ];then

       guardarArchivo

        else

                portClean

        fi

fi
