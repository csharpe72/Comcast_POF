#!/bin/bash

SERVERS=`cat /home/servers.txt`
SSH_COPY=`which ssh-copy-id`
SSH_KEYGEN=`which ssh-keygen`
KEY_FILE="~/.ssh/id_rsa.pub"
USER=sample_user

for HOST in `cat ${SERVERS}` do;
  ${SSH_KEYGEN} -t rsa -N "" -f ${KEY_FILE}
  ${SSH_COPY} -i ${KEY_FILE} ${USER}@${HOST}:~/.ssh/authrorized_keys
done