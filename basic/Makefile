run:
	bash files/create_ssh_key.sh
	cp files/authorized_keys control/files
	cp files/id_rsa control/files
	cp files/id_rsa.pub control/files
	cp files/authorized_keys managed/files
	cp files/id_rsa managed/files
	cp files/id_rsa.pub managed/files
	docker-compose up -d --force-recreate --build
	echo "Decrypting the vault file"
	docker exec -it basic-control-node ansible-vault decrypt /root/.ansible/group_vars/vault
	docker exec -it basic-control-node cat /root/.ansible/group_vars/vault 
	echo "Encrypting the vault file"
	docker exec -it basic-control-node ansible-vault encrypt /root/.ansible/group_vars/vault
	docker exec -it basic-control-node cat /root/.ansible/group_vars/vault
	echo "Applying the hello playbook to the managed node"
	docker exec -it basic-control-node bash -c "cd ~/.ansible && ansible-playbook site.yml"

destroy:
	docker-compose down
	rm files/authorized_keys
	rm files/id_rsa*
	rm control/files/authorized_keys
	rm control/files/id_rsa*
	rm managed/files/authorized_keys
	rm managed/files/id_rsa*
