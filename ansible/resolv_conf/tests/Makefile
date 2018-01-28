ansible-log="ansible-resolv_conf.log"

default: test
test: check-lint syntax-check check-idempotence check-ansible-warnings clean 
	./test-resolv_conf.sh
syntax-check:
	pi-build-tools init-ansible-config ..
	cd .. && ansible-playbook playbooks/test.yml -i tests/inventory --syntax-check
	rm ../ansible.cfg
check-ansible-warnings:
	./test-ansible-warnings.sh ../tests-setup/docker $(ansible-log)
check-idempotence:
	./test-idempotence.sh resolv_conf
check-lint:
	ansible-lint ../roles/resolv_conf
clean:
	if [ -d test-out ]; then rm -rf test-out ; fi
	if [ -f ../ansible.cfg ]; then rm ../ansible.cfg ; fi
