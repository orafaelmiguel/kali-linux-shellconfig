# Kali Linux Scripts

Shell scripts para automação relacionada à configuração do Kali Linux, com o intuito de automatizar configs como ativar SSH no boot e isolar redes através de adaptadores de rede.

Opção através da CLI caso deseje permitir conexões remotas via SSH (porta 22).

Exibição do status SSH.

Caso permita conexões remotas, o script irá iniciar o serviço SSH e configurará um firewall (UFW) para permitir tráfego na porta 22.

Para testes de rede isolados, o script de network configura adaptadores de rede para isolar a máquina em duas interfaces de rede diferentes: uma interface NAT e uma interface "Host-Only".
O script configura dois adaptadores de rede:

    O adaptador NAT (eth0) para fornecer acesso à internet.
    O adaptador "Host-Only" (eth1) com um IP estático (192.168.56.2/24) para a comunicação isolada entre a máquina e o host.

# Como executar

Para rodar, os scripts precisam de permissão de root.

Caso apresente algum erro, tente tornar os scripts executáveis antes de qualquer coisa:
```
chmod +x ssh_config.sh
```
No directory dos scripts.

Depois execute como root:
```
sudo ./ssh_config.sh
```
