# dotvim

### require
> require php,composeer
> vim 8 `https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source`

### ubuntu

#### install base lib
```
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev  python3-dev ruby-dev liblua5.1 lua5.1-dev libperl-dev git
```
#### install search tool
```
sudo apt install fzf
sudo apt install silversearcher-ag
sudo apt install tmux
sudo apt-get install ctags
```

#### install gnu global
```
sudo apt install flex
sudo apt install gperf
sudo apt-get -y install ncurses-dev
sudo apt-get -y install exuberant-ctags
sudo apt-get install texinfo

wget http://tamacom.com/global/global-6.6.2.tar.gz
tar -zxvf global-6.6.2.tar.gz
cd global-6.6.2
sh reconf.sh 
./configure
make
```

### one step
```shell
git clone https://github.com/zhenyangze/dotvim.git
cd dotvim && ./install.sh
```
### second step
open vim and then execute `:PlugInstall`

### install ycm (if not installed)
```shell
cd ~/.vim/plugged/YouCompleteMe
./install.py
```

### screen
![image1](http://wx2.sinaimg.cn/large/0060lm7Tly1fw1zsyj883j31kw0yn49p.jpg)
![image2](http://wx1.sinaimg.cn/large/0060lm7Tly1fw1zsz198vj31kw0ynqed.jpg
)
