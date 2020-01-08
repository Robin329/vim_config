
#### 一、 Vim 的配置文件
在用户目录里面，有一个 .vimrc 文件。vim 在启动的时候会按照这个文件的内容来配置 vim。

通过执行 cd ~ 进入用户目录；
通过执行 ls -a 查看是否存在该文件，如果没有则通过 touch .vimrc 创建。

在以下内容中，我们会多次编辑这个文件。
复制代码二、 让装插件简单一点
其实本来装和管理 Vim 的插件是比较的，但 Vundle 使其变得简单。简单到什么程度呢？

在 Vim 里面运行命令 PluginSearch 插件名称 ，按 Enter ；
在弹出的列表中选中某个搜索结果，按 i 就能安装

PS ： 不过下面会使用复制到配置文件的方式

它在 GitHub 的地址为：https://github.com/VundleVim/Vundle.vim 。
复制代码三、 Vundle 的下载、安装
虽然按照官方的说法用 Git 来安装 Vundle 看起来好像比较麻烦，但其实更简单些。
（1）安装 Git
可以点击 这里 查看如何安装。

通常用的系统有两个：
Ubuntu ：在命令行（terminal 终端）上执行 sudo apt-get install git；
CentOS ：执行 sudo yum install git 。
实在不行，还能按照教程通过源码安装。

复制代码（2）安装 Vundle
为了在下面粘贴时得到预期的结果，先执行 vim ~/.vimrc ，在最后一行下面添加 set paste ，保存并退出。

在 terminal 上执行:
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
vim ~/.vimrc
把以下内容复制到开头：
复制代码

```
" ----------------------------- Vundle Start -----------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on
" ----------------------------- Vundle End   -----------------------------
```

复制代码保存并退出。
四、 示例（安装目录浏览插件）
如果想安装其他插件，只需将 Plugin '插件名' 放到空行上下两句之间即可。
在 terminal 上执行： vim
在 vim 上执行： :PluginSearch NERD

执行的方式为：在命令模式下按冒号 : ，在后面输入 PluginSearch NERD ， Enter 。

结果如下图所示：


通过按 j 移动到图上的那一行；
双击 y 复制这一行；
ctrl + w + w 将光标移动到右边窗格，光标移动到空行，按 p 粘贴；
保存并退出；
在 terminal 上执行： vim ~/.vimrc ；
在 vim 上执行： PluginInstall ，等待左侧窗格 Plugin 'The-NERD-tree' 的前面出现 + 表示安装完毕。
可以在 vim 里面执行 NERDTree 打开目录浏览。直接输入 ? 查看快捷键（再按一次则关闭查看快捷键）。

通过 vim 执行 :h NERDTree 查看该插件的文档。
复制代码五、 一些插件

目录浏览
Plugin 'The-NERD-Tree'

1）打开方式
Vim 内执行 :NERDTree

2）基本使用
o ：用于展开和收起文件夹的内容，也能用来打开文件。
打开文件时不会分隔窗格，而是在已有窗格上展示。
该键可用 Enter 代替（如果你更习惯用这个的话）。
s ：打开文件。
垂直线分割窗格，并将文件内容打开到新窗格。
如果想看隐藏的文件和文件夹，直接输入 I （大写的 i ）。
复制代码
查找并打开文件
Plugin 'ctrlp.vim'

1）打开方式
ctrl + p

2）基本使用
输入文件名的一部分，它会把最有可能的文件列出来。
ctrl + j 或 k ：移动光标
ctrl + v ：打开文件（垂直线分割窗格）
Enter：打开文件（不分割窗格）
3）备注
打开 Vim 后的第一次打开会比较慢，后面会快很多，直到关闭 Vim 。
复制代码
嵌套括号不同染色

`Plugin 'luochen1990/rainbow'`

在 .vimrc 里加入：

```
" ----------------------------- plugin rainbow start -----------------------------
let g:rainbow_active = 1
" ----------------------------- plugin rainbow end   -----------------------------
```
1）打开方式
rainbow_active 设置为 1 的时候，会在开启 Vim 时启动。

如果想手动启动，将其设置为 0 。需要启动的时候执行 :RainbowToggle 。
复制代码
展示函数名和变量名
Plugin 'taglist.vim'

要先在系统上（而不是vim）安装 ctags
1）打开方式
:TlistOpen

2）基本使用
Enter ：在已打开的文件中跳转到当前选择的变量或函数。
- ：收起列表
+ ：展开列表

3）备注
在 .vimrc 里面添加：
```
" ----------------------------- plugin taglist start -----------------------------
let Tlist_Use_Right_Window = 1
" ----------------------------- plugin taglist start -----------------------------
```
这使得 taglist 在右侧窗口中显示窗口。这样可以避免其跟 NERDTree 在同一边。

#### YCM 
Ubuntu 16.04 and later:

sudo apt install build-essential cmake python3-dev
Compiling YCM with semantic support for C-family languages through libclang:

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer
Compiling YCM with semantic support for C-family languages through clangd:

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer
Note that you can install YCM with both libclang and clangd enabled. In that case clangd will be preferred unless you have the following in your vimrc:

let g:ycm_use_clangd = 0
Compiling YCM without semantic support for C-family languages:

cd ~/.vim/bundle/YouCompleteMe
python3 install.py
The following additional language support options are available:

C# support: install Mono and add --cs-completer when calling install.py.
Go support: install Go and add --go-completer when calling install.py.
JavaScript and TypeScript support: install Node.js and npm and add --ts-completer when calling install.py.
Rust support: add --rust-completer when calling install.py.
If your Python interpreter is older than 2.7.9, you will also need rustup in your PATH.
Java support: install JDK8 (version 8 required) and add --java-completer when calling install.py.
To simply compile with everything enabled, there's a --all flag. Note that this flag does not install clangd. You need to specify it manually by adding --clangd-completer. So, to install with all language features, ensure xbuild, go, tsserver, node, npm and tools are installed and in your PATH, then simply run:

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
That's it. You're done. Refer to the User Guide section on how to use YCM. Don't forget that if you want the C-family semantic completion engine to work, you will need to provide the compilation flags for your project to YCM. It's all in the User Guide.

YCM comes with sane defaults for its options, but you still may want to take a look at what's available for configuration. There are a few interesting options that are conservatively turned off by default that you may want to turn on.
