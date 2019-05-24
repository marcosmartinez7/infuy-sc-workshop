# sc-example-bitcoin-day




# Herramientas

## IDE

- Instalar Visual Studio Code
- Ctrl + P, escribir  "ext install ". Nota: Tener en cuenta el espacio al final.
- Buscar por "Solidity", instalar la primera opcion (https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity)

## Instalacion de Truffle

- npm install -g truffle@4.1.14

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

- truffle develop 
- compile
- migrate 


## Interactuar con el contrato: enviando tokens

- Actualmente solo el deployer tiene balance puesto que el constructor asi lo establece. El deployer es  address 0
- Enviar balance desde la cuenta 0 a otra
- Realizar una transferencia desde la nueva cuenta fondeada

1. Obtener una instancia de Truffle Contract (interaccion mediante truffle framework y web3 con los contratos)
```
let infuyToken = null;
InfuyToken.deployed().then((instance)=>{infuyToken = instance});
```
2. Enviar desde el deployer a otra cuenta. 

Accounts: 
```

(0) 0x627306090abab3a6e1400e9345bc60c78a8bef57
(1) 0xf17f52151ebef6c7334fad080c5704d77216b732
(2) 0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef
```

Chequeo de balances

(0)
```
truffle(develop)> infuyToken.getBalance("0x627306090abab3a6e1400e9345bc60c78a8bef57")

BigNumber { s: 1, e: 2, c: [ 100 ] }

```


(1)
```
truffle(develop)> infuyToken.getBalance("0xf17f52151ebef6c7334fad080c5704d77216b732")
<BN: 0>
```
(2)
```
truffle(develop)> infuyToken.getBalance("0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef")
<BN: 0>
```

Envio de 10 tokens desde address 0 a address 1
```
infuyToken.transferTokens("0xf17f52151ebef6c7334fad080c5704d77216b732", 10, {from: "0x627306090abab3a6e1400e9345bc60c78a8bef57"})
```

Chequeo de balances:


Address 0 ahora tiene 90 tokens
```
truffle(develop)> infuyToken.getBalance("0x627306090abab3a6e1400e9345bc60c78a8bef57")
BigNumber { s: 1, e: 1, c: [ 90 ] }

```

Address 1 ahora tiene 10 Tokens 
```

truffle(develop)>infuyToken.getBalance("0xf17f52151ebef6c7334fad080c5704d77216b732")
BigNumber { s: 1, e: 1, c: [ 10 ] }

```

Enviemos ahora 5 tokens desde address 1 hacia address 2
```
infuyToken.transferTokens("0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef", 5, {from: "0xf17f52151ebef6c7334fad080c5704d77216b732"})

```

Ahora ambas cuentas deberian contar con  un balance de 5 infuyTokens 

(1)
```
truffle(develop)> infuyToken.getBalance("0xf17f52151ebef6c7334fad080c5704d77216b732")
BigNumber { s: 1, e: 0, c: [ 5 ] }

```
(2)
```
truffle(develop)> infuyToken.getBalance("0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef")
BigNumber { s: 1, e: 0, c: [ 5 ] }

```

Intentemos ahora enviar 6 tokens desde address 1 hacia address 2. Note que la transaccion es exitosa pues no hay errores ni precodindiciones fallidas pero los balances no son decrementados ya que 6 supera el balance de la cuenta.

```

truffle(develop)> infuyToken.transferTokens("0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef", 6, {from: "0xf17f52151ebef6c7334fad080c5704d77216b732"})

  
truffle(develop)> infuyToken.getBalance("0xf17f52151ebef6c7334fad080c5704d77216b732")


truffle(develop)> infuyToken.getBalance("0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef")


```

Finalmente repitamos el envio de tokens con un valor valido: 

```
truffle(develop)> infuyToken.transferTokens("0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef", 2, {from: "0xf17f52151ebef6c7334fad080c5704d77216b732"})

truffle(develop)> infuyToken.getBalance("0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef")
BigNumber { s: 1, e: 0, c: [ 7 ] }
truffle(develop)> infuyToken.getBalance("0xf17f52151ebef6c7334fad080c5704d77216b732")
BigNumber { s: 1, e: 0, c: [ 3 ] }


```

Cualquier consulta, crítica o feedback post-workshop a anarancio@infuy.com / mmartinez@infuy.com :)
