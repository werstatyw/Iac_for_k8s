#!/usr/bin/python3.9

import os
os.system("kubectl logs deployment/server-dev | grep auth ")