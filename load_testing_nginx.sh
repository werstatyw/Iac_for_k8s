#1000 requests

kubectl run -it --rm wrk \                  
--image=williamyeh/wrk \
--restart=Never \
--command \
--  wrk -t 44 -c 1000 -d 180s  https://saharok.store

#normal baseline

kubectl run -it --rm wrk \                  
--image=williamyeh/wrk \
--restart=Never \
--command \
--  wrk -t2 -c5 -d5s -H 'Host: saharok.store' --timeout 2s https://saharok.store