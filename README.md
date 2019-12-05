# Controle De Uso Do Firefox
## 1 - Aplicação
* Script que ao ser iniciado, lê de um arquivo de configuração, uma lista de pares usuário:máquina.
* Esse Script deve verificar periodicamente se o Firefox está em execução para cada máquina sobe o usuário.

## 2 - Eventos Tratados

* O Firefox foi detectado pela primeira vez em uma dada máquina. Um aviso deve ser exibido ao usuário informando que ele deve fechar o navegador e voltar a programar.

* Ele terá até a ṕróxima verificação para fechar o Firefox, caso contrário os processos serão finalizados pelo script.

* Caso nas últimas três verificações o usuário estivesse com o Firefox ativo, deve encessar a seção do usuário.

## 3 - Requisitos Para Executar o Script
* Ter acesso via
