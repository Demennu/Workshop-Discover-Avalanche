# Deploy Smart Contract – Simple Vault (Avalanche Testnet)

## 1. Installazione Core Wallet (estensione browser)
Scarica l'estensione ufficiale Core Wallet:
 https://chromewebstore.google.com/detail/core-wallet-crypto-made-e/agoakfejjabomempkjlepdflaleeobhb

Segui i passaggi di configurazione mostrati nelle slide o nella registrazione.

---

## 2. Crea un account su Builder Hub (Avalanche)
Accedi al faucet e crea il tuo account:
 https://build.avax.network/console/primary-network/faucet

Completa i passaggi indicati nelle slide o nel video.

---

## 3. Setup ambiente di sviluppo (macOS / Linux / Windows)

> **macOS / Linux**: usa il terminale di VS Code  
> **Windows**: usa WSL (Ubuntu)

Installa Foundry:

```shell
curl -L https://foundry.paradigm.xyz | bash
```
Riavvia il terminale (comando per macOS)
```shell
source ~/.zshenv
```
Installa Foundry tools:
```shell
foundryup
```
Verifica l’installazione:
```shell
forge --version
anvil --version
cast --version
```
## 4. Crea il progetto
Crea la cartella del progetto:
```shell
mkdir simple_vault
cd simple_vault
```
La cartella deve essere vuota. Ora inizializza Foundry:
```shell
forge init
```
Rimuovi la cartella dei test (non necessaria per il deploy):
```shell
rm -rf test
```
## 5. Configura variabili d’ambiente
Esporta la tua PRIVATE KEY (come mostrato nelle slide/video):
```shell
export PRIVATE_KEY="INSERISCI_QUI_LA_TUA_PRIVATE_KEY"
```
Esporta l’RPC per la testnet Avalanche Fuji:
```shell
export RPC="https://api.avax-test.network/ext/bc/C/rpc"
```
 Non rimuovere le virgolette!

## 6. Deploy dello smart contract
Esegui il deploy con il seguente comando:
```shell
forge script script/SimpleVault.s.sol:DeploySimpleVault \
  --rpc-url $RPC \
  --broadcast
```