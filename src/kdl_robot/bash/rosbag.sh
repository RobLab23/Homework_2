
#!/bin/bash

# Verifica se è stato passato un parametro e se è un numero tra 1 e 4
if [ "$#" -ne 1 ] || ! [[ "$1" =~ ^[1-4]$ ]]; then
    echo "Errore: Devi passare un numero tra 1 e 4 come parametro."
    exit 1
fi

# Assegna il parametro a una variabile
NUMERO="$1"

# Specifica il nome del file finale
FINAL_BAGFILE=""

# Decidi il nome finale del file in base al numero
case "$NUMERO" in
    "1")
        FINAL_BAGFILE="/home/lucabor/Scrivania/RoboticsLab/src/kdl_robot/rosbag/LinTrap.bag"
        ;;
    "2")
        FINAL_BAGFILE="/home/lucabor/Scrivania/RoboticsLab/src/kdl_robot/rosbag/LinCub.bag"
        ;;
    "3")
        FINAL_BAGFILE="/home/lucabor/Scrivania/RoboticsLab/src/kdl_robot/rosbag/CircTrap.bag"
        ;;
    "4")
        FINAL_BAGFILE="/home/lucabor/Scrivania/RoboticsLab/src/kdl_robot/rosbag/CircCub.bag"
        ;;
esac

# Avvia la registrazione
rosbag record -O "$FINAL_BAGFILE" /iiwa/iiwa_joint_1_effort_controller/command /iiwa/iiwa_joint_2_effort_controller/command /iiwa/iiwa_joint_3_effort_controller/command /iiwa/iiwa_joint_4_effort_controller/command /iiwa/iiwa_joint_5_effort_controller/command /iiwa/iiwa_joint_6_effort_controller/command /iiwa/iiwa_joint_7_effort_controller/command