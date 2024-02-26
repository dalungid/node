# to create a new wallet, use the following command. don’t forget to save the mnemonic
crossfid keys add $WALLET

# to restore exexuting wallet, use the following command
crossfid keys add $WALLET --recover

# save wallet and validator address
WALLET_ADDRESS=$(crossfid keys show $WALLET -a)
VALOPER_ADDRESS=$(crossfid keys show $WALLET --bech val -a)
echo "export WALLET_ADDRESS="$WALLET_ADDRESS >> $HOME/.bash_profile
echo "export VALOPER_ADDRESS="$VALOPER_ADDRESS >> $HOME/.bash_profile
source $HOME/.bash_profile

# check sync status, once your node is fully synced, the output from above will print "false"
crossfid status 2>&1 | jq .SyncInfo

# before creating a validator, you need to fund your wallet and check balance
crossfid query bank balances $WALLET_ADDRESS
