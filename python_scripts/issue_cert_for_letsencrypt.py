#!/usr/bin/python3.9

import os
portal_name=input('Enter portal name:')
print(portal_name)
os.system("kubectl exec -it k8s-admin -- bash -c 'certbot certonly --manual --preferred-challenges http -d" && "portal_name'")