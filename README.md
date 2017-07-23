# Ethreum

Setting up a private BlockChain Network using Ethereum

1)Install Go CLient for Ethereum  (Geth )

  -sudo apt-get install software-properties-common
  -sudo add-apt-repository -y ppa:ethereum/ethereum
  -sudo apt-get update
  -sudo apt-get install ethereum
 
 Confirm it by typing geth --help

2) Setting up the  ehtereum home
        sudo mkdir ethereum
        sudo gedit ~/. profile
        export ethereum_home="/home/faizal/ethereum"

3)Setting up a Network 

       To get a Hands-on  ,i have set-up a virtual machine hosting ubuntu where ehtereum and geth is installed following the above command.

    Creating a Genesis file (Any Blockchain N/W needs to have a genesis block for the chain to link the subsequent blocks)
      The genesis file shoud be the same in both the machines
            genesis.json
			  {
		    "config": {
			"chainId": 1092,
			"homesteadBlock": 0,
			"eip155Block": 0,
			"eip158Block": 0
		    },
		    "nonce": "0x0000000000000042",     
		    "alloc": {
		       
		    },
		    "timestamp": "0x00", 
		    "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000", 
		    "extraData": "0x3535353535353535353535353535353535353535353535353535353535353535", 
		    "gasLimit": "0x8000000", 
		    "difficulty": "0x400", 
		    "mixhash": "0x0000000000000000000000000000000000000000000000000000000000000000", 
		    "coinbase": "0x3333333333333333333333333333333333333333"  
		}  

       
                 chainId is the ID for the Chain N/W,
		 nonce is for POW purpose nonce and mixhash are used to prove some computataion has be done to solve  				 mathematical  problem as mentioned in yellow Paper,
		 ParentHash is 256 bit hash and in case of  genesis file it is set to 0,
		 difficulty is set to minimal 

   
4) Instructions for dataDir 
 
       The following instructions has to be done  in both machines.

      a) Copy the gensis.json file into ethereum_home in both the machines.
      b) Initialise the block -- sudo geth --datadir "$ethereum_home/node1" init "$ethereum_home/genesis.json
      c) Start the N/W mentioning  port and specify networkid
             sudo geth --datadir "$ethereum_home/node1" --port 30304 --nodiscover --rpc --rpcport 8545 --rpccorsdomain "*"  			-networkid   1092 console
      d)In the 2nd machine console type admin.nodeInfo.enode and copy the enode and replace [:] with ip address of the machine
            
		"enode://6b17a2de281cb1aebbc3dd065472c0f9e293c31074b9ba3850003a5b08a55a0e0563ff08c4e7da9580caac2e8881611ed9cdbb4fd593e7638878d5e4586cf8fd@192.168.0.118:30304?discport=0"

     e) Add second machine as peer in first node
         
            admin.addPeer("enode://6b17a2de281cb1aebbc3dd065472c0f9e293c31074b9ba3850003a5b08a55a0e0563ff08c4e7da9580caac2e8881611ed9cdbb4fd593e7638878d5e4586cf8fd@192.168.0.118:30304?discport=0")

     d)Verifying the Peers
      
        admin.peers function will display the list of peers
        net.listening will let out a boolean indicating its listening value
        net.peerCount will display the peer count value
 
     e) Create a Acccount 
         Personal.newAccount(),enter a passPhrase
         Remeber the passphrase

     f) miner.start to start the computation process
 
 5) Smart Contract
    
     Smart contracts is usually written in Solidity language,It can be written in online JIT Solidity compiler or using truffle
     I will proceed with truffle           
        
6)Installing Truffle
     
    We need nodejs to install truffle as it is a npm project

       npm install -g truffle  (Truffle installed on a golobal level)

7)Writing smart contract
 
     a) create a directory for smart contract and from the terminal type truffle init which will create the Dapp folder structure
     b) Editor of your choice.I ahve used Sublime Text 3
           In sublime text 3 ,to get syntax highligting and code completion
  
          --  In sublime text 3 enter Ctrl+shift+P to install the package,select ethereum 

     c) Sample contract 

        Balance.sol
          
			    pragma solidity ^0.4.4;

		contract Balance{

		 uint public amount;

		 function Balance(uint _amount){
		 	amount = _amount;
		 }	

		 function withDrawAmount(uint _amount){
		 	amount = -_amount;
		 }

		 function addAmount(uint _amount){
		 	amount = +_amount;
		 }
		}

    d)  Navigate to  migration folder ,open the file deploy_contracts.js file and add the line 

           deployer.deploy(Balance);        comment other lines

   c) compile it using the command "truffle compile"

   d) Depoy file to deploy the smart contract is truffle.js ,sample file as below

			module.exports = {
		  networks: {
		    development: {
		      host: "localhost",
		      port: 8545,
		      network_id: "*" // Match any network id
		    }
		  }
		};


   e)  Command to deploy is "truffle migrate"     


 
            
