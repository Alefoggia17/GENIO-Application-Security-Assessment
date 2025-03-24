#!/bin/bash

# Intestazione con ASCII Art personalizzata
echo ""
echo "---------------------------------------------------------------------------------------------------"
echo ""
echo "#####  #######  #     #  #  #######     #####  #######  #####  #     # ######   #  ####### #     # "
echo "#     # #       ##    #  #  #     #    #     # #       #       #     # #     #  #     #     #   #  "
echo "#       #       # #   #  #  #     #    #       #       #       #     # #     #  #     #      # #   "
echo "#  #### #####   #  #  #  #  #     #     #####  #####   #       #     # ######   #     #       #    "
echo "#     # #       #   # #  #  #     #          # #       #       #     # #   #    #     #       #    "
echo "#     # #       #    ##  #  #     #    #     # #       #       #     # #    #   #     #       #    "
echo "##### # ######  #     #  #  #######     #####  #######  #####   #####  #     #  #     #       #    "
echo ""
echo "              Benvenuti al Security Assessment delle applicazioni GENIO "
echo "---------------------------------------------------------------------------------------------------"
echo ""

# Scelta modalità di esecuzione
echo "Scegli la modalità di esecuzione:"
echo "1) Esegui un'analisi singola"
echo "2) Esegui due analisi in parallelo"
echo "3) Esci"
echo ""
read -p "Inserisci il numero corrispondente alla modalità desiderata: " mode

if [[ "$mode" == "1" ]]; then
    # Menu di scelta per l'utente (analisi singola)
    echo ""
    echo "Scegli quale analisi eseguire:"
    echo "1) Analisi Statica"
    echo "2) Analisi Dinamica"
    echo "3) Monitoraggio"
    echo "4) Esci"
    echo ""
    read -p "Inserisci il numero corrispondente all'analisi da eseguire: " choice

    case $choice in
        1)
            echo ""
            echo "########################################"
            echo "#          GENIO Static Analysis       #"
            echo "########################################"
            echo ""
            python3 static/static-analysis.py
            ;;
        2)
            echo ""
            echo "########################################"
            echo "#          GENIO Dynamic Analysis      #"
            echo "########################################"
            echo ""
            python3 dynamic/dynamic-analysis.py
            ;;
        3)
            echo ""
            echo "########################################"
            echo "#         GENIO Monitoring             #"
            echo "########################################"
            echo ""
            python3 monitoring/observer.py
            ;;
        4)
            echo "Uscita..."
            exit 0
            ;;
        *)
            echo "Scelta non valida. Riprova."
            ;;
    esac

elif [[ "$mode" == "2" ]]; then
    # Scelta di due analisi da eseguire in parallelo
    echo ""
    echo "Scegli due analisi da eseguire in parallelo:"
    echo "1) Statica + Dinamica"
    echo "2) Statica + Monitoraggio"
    echo "3) Dinamica + Monitoraggio"
    echo "4) Esci"
    echo ""
    read -p "Inserisci il numero corrispondente alla combinazione desiderata: " parallel_choice

    case $parallel_choice in
        1)
            echo ""
            echo "########################################"
            echo "#   GENIO Static & Dynamic Analysis    #"
            echo "########################################"
            echo ""
            python3 static/static-analysis.py & python3 dynamic/dynamic-analysis.py
            wait
            ;;
        2)
            echo ""
            echo "########################################"
            echo "#   GENIO Static Analysis & Monitoring #"
            echo "########################################"
            echo ""
            python3 static/static-analysis.py & python3 monitoring/observer.py
            wait
            ;;
        3)
            echo ""
            echo "########################################"
            echo "#   GENIO Dynamic Analysis & Monitoring #"
            echo "########################################"
            echo ""
            python3 dynamic/dynamic-analysis.py & python3 monitoring/observer.py
            wait
            ;;
        4)
            echo "Uscita..."
            exit 0
            ;;
        *)
            echo "Scelta non valida. Riprova."
            ;;
    esac

elif [[ "$mode" == "3" ]]; then
    echo "Uscita..."
    exit 0
else
    echo "Scelta non valida. Riprova."
fi
