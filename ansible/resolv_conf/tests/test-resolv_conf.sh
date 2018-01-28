#!/bin/bash
#Sample test for module

#1 for fail, 0 for success
test_result=1;

echo "TESTING RESOLV_CONF"

echo "SETUP"
if [ ! -d test-out ]; then mkdir test-out; fi

echo "TEST"

run_args=" --rm "

res=`docker run $run_args resolv_conf /bin/bash -c 'cat /etc/resolv.conf.docker'`

if [[ $res =~ "search domain-search-1 domain-search-2" ]] && [[ $res =~ "nameserver public_dns_1" ]] && [[ $res =~ "nameserver public_dns_2" ]]; then
	echo "[SUCCESS] resolv conf file properly configured"
	test_result=0
else
	echo "[FAIL] resolv conf file unproperly configured"
	echo $res
fi

echo "TEARDOWN"

exit $test_result;
