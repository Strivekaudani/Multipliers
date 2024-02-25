while [[ $# -gt 0 ]]
do
case $1 in
    -d|--do)
        shift
        DO_SCRIPT="-do $1"
        shift
        ;;
    -t|--top)
        shift
        TOP_MODULE="my_lib.$1_tb"
        shift
        ;;
    -c|--no-gui)
        NO_GUI="-c"
        shift
        ;;
    *)
        echo "Unrecognized Argument $1"
        shift
        ;;
esac
done

vsim -voptargs=+acc $NO_GUI $DO_SCRIPT $TOP_MODULE
