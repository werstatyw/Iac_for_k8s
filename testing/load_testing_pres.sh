kubectl run -it --rm wrk \
--image=williamyeh/wrk \
--restart=Never \
--command \
--  wrk -t2 -c5 -d5s -H 'Host: wers.mooo.com' --timeout 2s https://wers.mooo.com