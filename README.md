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

Instale o ssh
sudo apt install openssh-server

Verifique se a máquina recebeu a chave com o comando 'ls' no diretório de destino

Exemplo:
ls /home/romeu

Se estiver tudo ok, execute o seguinte comando

cat /home/romeu/id_rsa.pub >> /home/romeu/.ssh/authorized_keys

O comando acima adicionará o conteúdo da chave pública ao arquivo authorized_keys. Esse arquivo é responsável por guardar as chaves públicas das máquinas que terão permissão de executar o acesso SSH sem senha na máquina destino.


Feito isso, reinicie o serviço do SSH e verifique se o serviço está rodando corretamente com os comandos:

sudo service ssh restart
sudo service ssh status

Feito tudo isso, volte a máquina de origem (que fará o acesso SSH) e execute o comando:

ssh usuarioDeDestino@IPDeDestino

Exemplo:
ssh aluno@200.129.39.83

Se tudo foi feito corretamente, você terá acesso SSH sem senha.


* Utilizar o cron para agendar a verificação de acordo com a necessidade.
Como criar tarefas no Cron:

Comando crontab -e, serve para editar as tarefas.

Ver sua tabela crontab: crontab -l

* Sistema operacional - alguma distribuição linux, como por exemplo: Ubuntu, mint, Debian etc.
