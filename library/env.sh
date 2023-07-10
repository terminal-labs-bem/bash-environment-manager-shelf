if [[ $SIDE == "external" ]]; then
     cp .tmp/_externalenv.sh .tmp/_env.sh
elif [[ $SIDE == "internal" ]]; then
     cp .tmp/_internalenv.sh .tmp/_env.sh
fi

source .tmp/_env.sh

chown -R $INTERNALUSER:$INTERNALUSER .tmp
chmod -R 777 .tmp
