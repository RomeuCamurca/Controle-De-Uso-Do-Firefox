# Controle De Uso Do Firefox
## 1 - Aplicação
* Script que ao ser iniciado, lê de um arquivo de configuração, uma lista de pares usuário:máquina.
* Esse Script deve verificar periodicamente se o Firefox está em execução para cada máquina sobe o usuário.

## 2 - Eventos Tratados

* O Firefox foi detectado pela primeira vez em uma dada máquina. Um aviso deve ser exibido ao usuário informando que ele deve fechar o navegador e voltar a programar.

* Ele terá até a ṕróxima verificação para fechar o Firefox, caso contrário os processos serão finalizados pelo script.

* Caso nas últimas três verificações o usuário estivesse com o Firefox ativo, deve encessar a seção do usuário.

## 3 - Requisitos Para Executar o Script
* Ter acesso via ssh sem senha configurado pela máquina que irá monitar as demais.
Tutorial para acesso via ssh sem senha:

- Na máquina que irá acessar as outras faça o seguinte:


Instale o ssh

sudo apt install openssh-server

Gere as chaves pública e privada

ssh-keygen -t rsa

Essas chaves encontram-se no diretório /home/seuUsuario/.ssh/

A chave pública terá o nome de id_rsa.pub

Envie essa chave pública para a máquina que será acessada. Pode-se utilizar o comando SCP

scp /home/seuUsuario/.ssh/id_rsa.pub usuarioDaMaquinaDestino@IPdaMaquinaDestino:caminhoQueAChaveSeraSalva

Exemplo:
scp /home/romeu/.ssh/id_rsa.pub aluno@200.129.39.83:/home/aluno/


- Na máquina que será acessada faça o seguinte:



* Utilizar o cron para agendar a verificação de acordo com a necessidade.
* Sistema operacional - alguma distribuição linux, como por exemplo: Ubuntu, mint, Debian etc.
