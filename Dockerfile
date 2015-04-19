FROM ubuntu
RUN apt-get update && apt-get -y install wget unzip vim curl git
ADD terraform.zip /usr/local/bin/terraform.zip
RUN cd /usr/local/bin && unzip terraform.zip 
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
ADD vimrc /root/.vimrc
RUN cd ~/.vim/bundle && git clone git://github.com/markcornick/vim-terraform.git

#RUN adduser deploy
#USER deploy
#WORKDIR /home/deploy
#RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#ADD vimrc /home/deploy/.vimrc

