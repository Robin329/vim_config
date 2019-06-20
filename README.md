# vim_config使用说明

##### 1.快捷键说明

`F2`：打开文件目录

`F3`：

`F4`

`F5`：搜索文件，同时按两下F5可以取消

`F6`：对比修改之前和后的差异

`F7`：查看最近打开的文件

`F8`：打开函数索引

`F9`：打开函数名列表

##### 2.cscope_to_file.py

a.先使用`ctags -R`索引代码

b.再使用`python cscope_to_file.py`生成`cscope.files`，有了这个文件我们在执行`cscope -Rbkq`

##### 3.更新c.vim插件

1.修改AUTHOR COMPANY等得默认值：
vim ~/.vim/c-support/templates/Templates

2.详细的使用方法：
---------------------附:详细的c.vim hotkey-------------------------

  \hm       show manual for word under the cursor (n,i)

