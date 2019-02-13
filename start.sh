#!/bin/sh

mkdir -p /var/lib/varnish/`hostname` && chown nobody /var/lib/varnish/`hostname`

env | grep VC | while IFS='=' read -r n v; do
    sed -i s/"$n"/"$v"/g /etc/varnish/varnish-cache.vcl
done

if [ "$1" = 'terminal' ] ; then
    echo TERMINAL mode
    exec /bin/sh
fi

if [ "$1" = 'default' ] ; then
    echo DEFAULT VCL mode
    varnishd -s malloc,${VC_MEMORY} -a :80 -b ${VC_BACKEND_ADDR}:${VC_BACKEND_PORT}
else
    echo PERSONAL VCL mode
    varnishd -s malloc,${VC_MEMORY} -a :80 -f /etc/varnish/varnish-cache.vcl 
fi

sleep 1
varnishlog -b

