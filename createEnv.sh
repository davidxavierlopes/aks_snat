. ./properties

az group create -n $RG -l $LOCATION
az aks create -n $CLUSTER -g $RG -l $LOCATION --node-count 2
az aks get-credentials -n $CLUSTER -g $RG

kubectl create deploy requester --image=nginx --replicas=60 -- /bin/sh -c "while sleep 0.01; do curl wttr.in; done"
