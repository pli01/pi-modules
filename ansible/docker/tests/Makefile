ansible-log="ansible-docker.log"

default: test
test: check-lint syntax-check check-idempotence check-ansible-warnings clean 
	./test-docker.sh
syntax-check:
	pi-build-tools init-ansible-config ..
	cd .. && ansible-playbook playbooks/test.yml -i tests/inventory --syntax-check
	rm ../ansible.cfg
check-ansible-warnings:
	./test-ansible-warnings.sh ../tests-setup/docker $(ansible-log)
check-idempotence:
	./test-idempotence.sh docker
check-lint:
	ansible-lint -x ANSIBLE0013 ../roles/docker
clean:
	if [ -d test-out ]; then rm -rf test-out ; fi
	if [ -f ../ansible.cfg ]; then rm ../ansible.cfg ; fi
