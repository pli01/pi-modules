#!/bin/bash

MODULE_NAME=$1

clean(){
	if [ -f idempotence.log ]; then rm idempotence.log; fi
}

trap clean EXIT KILL

run_args=" --rm "

docker run $run_args $MODULE_NAME /bin/bash -c 'cd /opt/ && ansible-playbook -i test-config -c local playbooks/test.yml -e dns_resolv_conf_file="/etc/resolv.conf.docker"' |& tee -a  idempotence.log
IS_IDEMPOTENT=`grep -oP "unreachable=0|failed=0" idempotence.log | wc -l`
if [ "$IS_IDEMPOTENT" != "2" ]; then
	echo "[FAILED] module is not idempotent !!!"
	tail -n 3 idempotence.log
	exit 1
else
	echo "[SUCCESS] module is idempotent"
	tail -n 3 idempotence.log
fi
