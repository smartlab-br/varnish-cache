# varnish-cache

Docker with Varnish Cache engine under Alpine to be used in Smartlab's Projects

#### Run customized rules (VCL) with 32 MB of RAM
     docker run -p 8080:80 -d -e VC_BACKEND_ADDR=172.10.110.10 -e VC_BACKEND_PORT 3100 -e VC_MEMORY=32M  smartlab/varnish

#### Run default rules (VCL) with 256 MB of RAM 
     docker run -p 8080:80 -d -e VC_BACKEND_ADDR=172.10.110.10 -e VC_BACKEND_PORT 3100 -e VC_MEMORY=32M  smartlab/varnish default

#### Run in terminal mode 
     docker run -p 8080:80 -it -e VC_BACKEND_ADDR=172.10.110.10 -e VC_BACKEND_PORT 3100 -e VC_MEMORY=32M  smartlab/varnish terminal 

#### The other options with default values are:
     VC_BACKEND_ADDR 127.0.0.1
     VC_BACKEND_PORT 7777
     VC_MEMORY       256M
     VC_GRACE        12h
     VC_TTL_CACHE    1h
     VC_TTL_BROWSER  1h
