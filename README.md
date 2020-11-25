
# START UP RAILS - Guia de início rápido

### Clone este repositório

• https://github.com/pablicio/start_up_rails.git

### Na pasta do VagrantFile

• vagrant up (Sobe a imagem)

### Quando terminar o processo entre na VM

• vagrant ssh (acessa a máquina virtual)

### No ambiente local(fora da VM)

• clone seus repositórios no mesmo nível do VagrantFile

### Já dentro da VM

• acesse seu repositorio que clonou cd /home/vagrant/seurepositorio

### Configure o .env

    POSTGRESQL_USER='seuuser'
    POSTGRESQL_DATABASE='seubd'
    POSTGRESQL_HOST='localhost'
    POSTGRESQL_PASSWORD='seupwd'

### Na raiz de seu projeto execute

• bundle install

• rake db:drop db:create db:migrate

### Levante sua aplicação

    rails s -b 0.0.0.0

### Mais comandos vagrant

• vagrant halt (mata as imagems)

• vagrant reload (halt + up)

• vagrant reload --provision (halt + up e rebuilda toda a imagem trazendo os novos recursos)

