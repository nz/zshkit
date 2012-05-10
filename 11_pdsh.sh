# I'm usually using pdsh to tail logs, so let's compress with a fast cipher
export PDSH_SSH_ARGS_APPEND='-C -c blowfish'
