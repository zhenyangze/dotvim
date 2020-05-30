# dotvim

require: `php` `composer` `git` `vim8`

### 1、Install Lib(for ubuntu)

#### install base lib
```shell
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev  python3-dev ruby-dev liblua5.1 lua5.1-dev libperl-dev git
```
#### install search tool
```shell
sudo apt install fzf
sudo apt install silversearcher-ag
sudo apt install tmux
sudo apt-get install ctags
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
```

#### install gnu global
```shell
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

### 2、Clone Code
```shell
git clone https://github.com/zhenyangze/dotvim.git
cd dotvim && ./install.sh
```
### 3、Install Plugin
open vim and then execute `:PlugInstall`

### 4、Screen
![image2](http://wx1.sinaimg.cn/large/0060lm7Tly1fw20btpf51j31kw0ynalp.jpg)

![image3](http://wx3.sinaimg.cn/large/0060lm7Tly1fw20bu3hnpj31kw0ynqg3.jpg)

![image1](http://wx4.sinaimg.cn/large/0060lm7Tly1fw20bs1a16j31kw0yntjc.jpg)