for SERVER in $(cat servers); do ssh ${SERVER} hostname; ssh ${SERVER} uptime; done
for SERVER in $(cat servers); do ssh ${SERVER} 'hostname; uptime'; done