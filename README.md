# Infuy Token




# Herramientas

## IDE

- Instalar Visual Studio Code
- Ctrl + P, escribir  "ext install ". Nota: Tener en cuenta el espacio al final.
- Buscar por "Solidity", instalar la primera opcion (https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity)

o 

- Instalar IntelliJ con solidity plugin (recomendado):  https://plugins.jetbrains.com/plugin/9475-intellij-solidity





## Instalacion de Truffle y Ganache

Truffle:

npm install -g truffle

Ganache:
https://www.trufflesuite.com/ganache


## Creacion de proyecto en Truffle

1. Crear un nuevo directorio para el proyecto Truffle: 

- mkdir InfuyToken
- cd InfuyToken
 

2. Ejecutar truffle init. Este comando creará la estructura principal del proyecto.  

```
.
├── contracts
│   └── Migrations.sol
├── migrations
│   └── 1_initial_migration.js
├── test
└── truffle-config.js
```
3. 

- Crear solidity files en la carpeta contracts. 
- Crear un segundo js script que se encargue de hacer el deploy de esos contratos. El script debe estar incluido en la carpeta migration, bajo el nombre:
```

2_deploy_contracts.js
```

## Documentacion de referencia

- Truffle: https://truffleframework.com/docs/truffle/overview
- Web3js: https://web3js.readthedocs.io/en/1.0/
- Solidity: https://solidity.readthedocs.io/en/v0.4.24/


## Deploy  

Ejecutar

- truffle development (o si deseas utilizar Ganache como UI, truffle console --network regtest)
- compile
- migrate 


## Interactuar con el contrato: enviando tokens

- Actualmente solo el deployer tiene balance puesto que el constructor asi lo establece. El deployer es  address 0
- Enviar balance desde la cuenta 0 a otra
- Realizar una transferencia desde la nueva cuenta fondeada

1. Obtener una instancia de Truffle Contract (interaccion mediante truffle framework y web3 con los contratos)
```
const infuyToken = await InfuyToken.deployed()
```
2. Enviar desde el deployer a otra cuenta. 

Accounts: 
```

(0) 0xa44008862458CfB946fD01b6B520bA673f56e3ec
(1) 0xEc53cBC63aB0C382e3142D456813313b0c9e7c27
(2) 0x2a0ebde42559A9DEC3d29B5d6cF35932e299445C
```


Chequeo de balances

(0)
```
truffle(development)> balance = await infuyToken.getBalance("0xa44008862458CfB946fD01b6B520bA673f56e3ec")

balance.toString() = 100

```


(1)
```
truffle(development)> balance1 = await infuyToken.getBalance("0xEc53cBC63aB0C382e3142D456813313b0c9e7c27")
balance1.toString()
<BN: 0>
```
(2)
```
truffle(development)> balance2 = await infuyToken.getBalance("0x2a0ebde42559A9DEC3d29B5d6cF35932e299445C")
balance2.toString()
<BN: 0>
```

Envio de 10 tokens desde address 0 a address 1
```
infuyToken.transfer("0xEc53cBC63aB0C382e3142D456813313b0c9e7c27", 10, {from: "0xa44008862458CfB946fD01b6B520bA673f56e3ec"})
```

Chequeo de balances:


Address 0 ahora tiene 90 tokens
```
truffle(development)> balance = await infuyToken.getBalance("0xa44008862458CfB946fD01b6B520bA673f56e3ec")
balance.toString() = 90

```

Address 1 ahora tiene 10 Tokens 
```

truffle(development)> balance1= await infuyToken.getBalance("0xEc53cBC63aB0C382e3142D456813313b0c9e7c27")
balance1.toString() = 10

```

Enviemos ahora 5 tokens desde address 1 hacia address 2
```
infuyToken.transfer("0x2a0ebde42559A9DEC3d29B5d6cF35932e299445C", 5, {from: "0xEc53cBC63aB0C382e3142D456813313b0c9e7c27"})

```

Ahora ambas cuentas deberian contar con  un balance de 5 infuyTokens 

(1)
```
truffle(development)> balance1= await infuyToken.getBalance("0xEc53cBC63aB0C382e3142D456813313b0c9e7c27")
balance1.toString() = 5
```
(2)
```
truffle(development)>  balance2= await infuyToken.getBalance("0x2a0ebde42559A9DEC3d29B5d6cF35932e299445C")
balance1.toString() = 5

```

Intentemos ahora enviar 6 tokens desde address 1 hacia address 2. Note que la transaccion es exitosa pues no hay errores ni precodindiciones fallidas pero los balances no son decrementados ya que 6 supera el balance de la cuenta.

```

truffle(development)> infuyToken.transfer("0x2a0ebde42559A9DEC3d29B5d6cF35932e299445C", 6, {from: "0xEc53cBC63aB0C382e3142D456813313b0c9e7c27"})

  
truffle(development)> balance1= await infuyToken.getBalance("0xEc53cBC63aB0C382e3142D456813313b0c9e7c27")
balance1.toString() = 5


truffle(development)>  balance2= await infuyToken.getBalance("0x2a0ebde42559A9DEC3d29B5d6cF35932e299445C")
balance1.toString() = 5
```


Cualquier consulta, crítica o feedback post-workshop a mmartinez@infuy.com :)
