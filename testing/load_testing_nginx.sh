#1000 requests

kubectl run -it --rm wrk \
--image=williamyeh/wrk \
--restart=Never \
--command \
--  wrk -t 44 -c 1000 -d 180s  https://wersss.mooo.com

#normal baseline

kubectl run -it --rm wrk \
--image=williamyeh/wrk \
--restart=Never \
--command \
--  wrk -t2 -c5 -d5s -H 'Host: saharok.store' --timeout 2s https://wersss.mooo.com

#testing clusterip:

kubectl run -it --rm wrkclusip --image=williamyeh/wrk --restart=Never --command --  wrk -t 44 -c 1000 -d 180s http://10.152.183.92:5000
#testing nodeport


kubectl run -it --rm wrknodeport --image=williamyeh/wrk --restart=Never --command --  wrk -t 44 -c 1000 -d 180s http://10.1.139.128:31247

#testing ingress

kubectl run -it --rm wrkingress --image=williamyeh/wrk --restart=Never --command --  wrk -t 44 -c 1000 -d 180s  https://wersss.mooo.com/