.PHONY: all deploy netbox ansible destroy

all: setup netbox ansible deploy

setup:
	docker network create netobs --subnet 198.51.100.0/24

deploy:
	clab deploy --reconfigure

netbox:
	cd netbox-docker && docker compose down -v
	cd netbox-docker && docker compose up -d --force-recreate

ansible:
	docker run -it --rm \
		-v ${PWD}/playbooks/ansible-inventory.yml:/ansible-inventory.yml \
		-v ${PWD}/playbooks/onboard.yml:/onboard.yml \
		--network netobs \
		alpine/ansible ansible-playbook -i ansible-inventory.yml onboard.yml

destroy:
	cd netbox-docker && docker compose down -v
	clab destroy