FROM ubuntu
RUN apt-get update && apt-get -y install wget unzip vim curl git
ADD docker-machine /usr/local/bin/docker-machine
RUN chmod +x /usr/local/bin/docker-machine
ADD terraform.zip /usr/local/bin/terraform.zip
RUN cd /usr/local/bin && unzip terraform.zip 
RUN cd /usr/local/bin && wget https://get.docker.com/builds/Linux/x86_64/docker-latest -O docker && chmod +x docker

# Docker compose
RUN curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
ADD vimrc /root/.vimrc
RUN cd ~/.vim/bundle && git clone git://github.com/markcornick/vim-terraform.git

RUN adduser deploy
USER deploy
WORKDIR /home/deploy
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
ADD vimrc /home/deploy/.vimrc
RUN cd ~/.vim/bundle && git clone git://github.com/markcornick/vim-terraform.git
ADD example.tf example.tf

