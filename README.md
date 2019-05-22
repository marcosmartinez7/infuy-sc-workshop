# sc-example-bitcoin-day


Smart Contract example for the bitcoin day workshop



# Herramientas

## IDE

- Instalar Visual Studio Code
- Ctrl + P, escribir  "ext install ". Nota: Tener en cuenta el espacio al final.
- Buscar por "Solidity", instalar la primera opcion (https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity)

## Instalacion de Truffle

- npm install truffle -g

## Creacion de proyecto en Truffle

1. Crear un nuevo directorio para el proyecto Truffle: 

- mkdir RskToken
- cd RskToken
 

2. Ejecutar truffle init. Este comando creara la estructura principal del proyecto sin ningun smart contract.  

TODO EXPLICAR CADA COSA

.
├── contracts
│   └── Migrations.sol
├── migrations
│   └── 1_initial_migration.js
├── test
└── truffle-config.js

3. 

- Crear solidity files en la carpeta contracts. 
- Crear un segundo js script que se encargue de hacer el deploy de esos contratos

## Deploy  


- truffle develop 
- compile
- migrate 


## Interactuar con el contrato: enviando tokens 

- actualmente solo el owner tiene balance puesto que el constructor asi lo establece
- enviar balance desde la cuenta owner a otra
- realizar una transferencia desde la nueva cuenta fondeada

1. Obtener una instancia de Truffle Contract (interaccion mediante truffle framework y web3 con los contratos)

let rskToken = null;
RskToken.deployed().then((instance)=>{rskToken = instance});

2. Enviar desde el owner a otra cuenta. Owner es address 0

Accounts: 

(0) 0x595973f644a5c31f748d35f5492b118f5e2b7ad3
(1) 0x3aebb2dd226c2f8ec9370f1e4793cc90e7ed0671
(2) 0x1c74bdf085c77eccfb4a7a935d3be87a88b6fd17

Check balance of addreses

(0)

truffle(develop)> let balance = await rskToken.getBalance("0x595973f644a5c31f748d35f5492b118f5e2b7ad3")
undefined
truffle(develop)> balance
<BN: 64>
truffle(develop)> balance.toString(10)
'100'


(1)

truffle(develop)> rskToken.getBalance("0x3aebb2dd226c2f8ec9370f1e4793cc90e7ed0671")
<BN: 0>

(2)

truffle(develop)> rskToken.getBalance("0x1c74bdf085c77eccfb4a7a935d3be87a88b6fd17")
<BN: 0>


Send 10 tokens from address 0

let sent = rskToken.transferTokens("0x3aebb2dd226c2f8ec9370f1e4793cc90e7ed0671", 5, {from: "0x595973f644a5c31f748d35f5492b118f5e2b7ad3"})

sent
{ tx:
   '0x94a08125859988992e9015f2f11efa59ee2697fa53f7e387f65ed48f8336fbdc',
  receipt:
   { transactionHash:
      '0x94a08125859988992e9015f2f11efa59ee2697fa53f7e387f65ed48f8336fbdc',
     transactionIndex: 0,
     blockHash:
      '0xdd7a68fc50e044bc7e60bd0346b13fed20f8ed3664bd2541f73e40a452d51cff',
     blockNumber: 11,
     from: '0x595973f644a5c31f748d35f5492b118f5e2b7ad3',
     to: '0xfeaa4fde3a7bd1a6730a8d3a61349caa5b1253c9',
     gasUsed: 51019,
     cumulativeGasUsed: 51019,
     contractAddress: null,
     logs: [ [Object] ],
     status: true,
     logsBloom:
      '0x00000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080008000000000000000000000000000000000000000000000000000000000000000000000000000000808000000000000010000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000080000000000000000000000004000000000000000002000000000000',
     v: '0x1b',
     r:
      '0xa792be25cc7f618882ddfd62df9931660cb9be0d70403457cfb0ed8d049f8726',
     s:
      '0x7b205b9dffcf86978cb1d862b213e1d1fa5f211267ad3364a482f1c2bafff9b7',
     rawLogs: [ [Object] ] },
  logs:
   [ { logIndex: 0,
       transactionIndex: 0,
       transactionHash:
        '0x94a08125859988992e9015f2f11efa59ee2697fa53f7e387f65ed48f8336fbdc',
       blockHash:
        '0xdd7a68fc50e044bc7e60bd0346b13fed20f8ed3664bd2541f73e40a452d51cff',
       blockNumber: 11,
       address: '0xfEaA4fde3A7BD1A6730a8d3a61349CAa5b1253C9',
       type: 'mined',
       id: 'log_ef654000',
       event: 'Transfer',
       args: [Result] } ] }


Now check the balances again


Address 0 now has 90

truffle(develop)>  balance = await rskToken.getBalance("0x595973f644a5c31f748d35f5492b118f5e2b7ad3")
truffle(develop)> balance.toString(10)
'90'

Address 1 now has 10 

truffle(develop)> balance = rskToken.getBalance("0x3aebb2dd226c2f8ec9370f1e4793cc90e7ed0671")
truffle(develop)> balance.toString(10)
'10'


Now lets send 5 tokens from address 1 to address 2

 sent = rskToken.transferTokens("0x1c74bdf085c77eccfb4a7a935d3be87a88b6fd17", 5, {from: "0x3aebb2dd226c2f8ec9370f1e4793cc90e7ed0671"})

{ tx:
   '0x47d7b3f6cecbe61a607d052f2077aee230411115851b209a25631e1eed40d154',
  receipt:
   { transactionHash:
      '0x47d7b3f6cecbe61a607d052f2077aee230411115851b209a25631e1eed40d154',
     transactionIndex: 0,
     blockHash:
      '0x5205fd438f41fd9eeb2e8b0edfecc58d4edcbdf8cb9f8099555c7db687c152f3',
     blockNumber: 15,
     from: '0x3aebb2dd226c2f8ec9370f1e4793cc90e7ed0671',
     to: '0xfeaa4fde3a7bd1a6730a8d3a61349caa5b1253c9',
     gasUsed: 36019,
     cumulativeGasUsed: 36019,
     contractAddress: null,
     logs: [ [Object] ],
     status: true,
     logsBloom:
      '0x00000000000000000000000000000000000000004000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080008000000000000000000000000000000000000000000000000000000000000000000010000000000808000000004000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000',
     v: '0x1b',
     r:
      '0x090aa8a1518fc14c33768017315de95f0dc449120d66cb1d498131b1bb4b1f51',
     s:
      '0x0739ac6beaf8834e4817521ae3f3233ef4f03ff5c803ff8a384092a03aa14fe3',
     rawLogs: [ [Object] ] },
  logs:
   [ { logIndex: 0,
       transactionIndex: 0,
       transactionHash:
        '0x47d7b3f6cecbe61a607d052f2077aee230411115851b209a25631e1eed40d154',
       blockHash:
        '0x5205fd438f41fd9eeb2e8b0edfecc58d4edcbdf8cb9f8099555c7db687c152f3',
       blockNumber: 15,
       address: '0xfEaA4fde3A7BD1A6730a8d3a61349CAa5b1253C9',
       type: 'mined',
       id: 'log_cbb00958',
       event: 'Transfer',
       args: [Result] } ] }

Now both accounts must have 5 RskTokens of balance



(1)

truffle(develop)> balance = await rskToken.getBalance("0x3aebb2dd226c2f8ec9370f1e4793cc90e7ed0671")
truffle(develop)> balance.toString(10)
'5'

(2)

truffle(develop)> balance = await rskToken.getBalance("0x1c74bdf085c77eccfb4a7a935d3be87a88b6fd17")
truffle(develop)> balance.toString(10)
'5'


Lets try now to send 6 tokens from account 1 to account 2. Note the transaction succeeds but the balance wasnt decreased.


 truffle(develop)> sent = rskToken.transferTokens("0x1c74bdf085c77eccfb4a7a935d3be87a88b6fd17", 6, {from: "0x3aebb2dd226c2f8ec9370f1e4793cc90e7ed0671"})
{ tx:
   '0x31ceb114da1d4a19d479db574063d85c3a505748ade08bb7a70f893cdd2e92e0',
  receipt:
   { transactionHash:
      '0x31ceb114da1d4a19d479db574063d85c3a505748ade08bb7a70f893cdd2e92e0',
     transactionIndex: 0,
     blockHash:
      '0x3eb3e1c09c1755b780322619a2e8ea8be0d968e5dcad2b43803ef9859e9ca956',
     blockNumber: 21,
     from: '0x3aebb2dd226c2f8ec9370f1e4793cc90e7ed0671',
     to: '0xfeaa4fde3a7bd1a6730a8d3a61349caa5b1253c9',
     gasUsed: 23556,
     cumulativeGasUsed: 23556,
     contractAddress: null,
     logs: [],
     status: true,
     logsBloom:
      '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
     v: '0x1b',
     r:
      '0xe6543dd97b4eca2dc8a37a53060fb34bf92825d4b1e4b824581a0b57f6d38557',
     s:
      '0x0450c4ab21bbe7961e0ea4060b84d3700f630737db62f192ffc461780d77b971',
     rawLogs: [] },
  logs: [] }
truffle(develop)> balance = await rskToken.getBalance("0x3aebb2dd226c2f8ec9370f1e4793cc90e7ed0671")
truffle(develop)> balance.toString(10)
'5'







