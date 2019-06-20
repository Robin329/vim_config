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
https://blog.csdn.net/zlzlei/article/details/7860494
---------------------附:详细的c.vim hotkey-------------------------

  \hm       show manual for word under the cursor (n,i)

  \hm       show manual for word under the cursor (n,i)
  \hp       show plugin help                      (n,i)

  -- Comments -----------------------------------------------------------

  \cl       end-of-line comment                 (n,v,i)
  \cj       adjust end-of-line comment(s)       (n,v,i)
  \cs       set end-of-line comment column      (n)
  \c*       code -> comment /* */               (n,v)
  \cc       code -> comment //                  (n,v)
  \co       comment -> code                     (n,v)
  \cfr      frame comment                       (n,i)
  \cfu      function comment                    (n,i)
  \cme      method description                  (n,i)
  \ccl      class description                   (n,i)
  \cd       date                                (n,v,i)
  \ct       date \& time                        (n,v,i)

  -- Statements ---------------------------------------------------------

  \sd       do 
{ }
 while                        (n,v,i)
  \sf       for                                 (n,i)
  \sfo      for 
{ }
                             (n,v,i)
  \si       if                                  (n,i)
  \sif      if 
{ }
                              (n,v,i)
  \sie      if else                             (n,v,i)
  \sife     if 
{ }
 else 
{ }
                     (n,v,i)
  \sw       while                               (n,i)
  \swh      while 
{ }
                           (n,v,i)
  \ss       switch                              (n,v,i)
  \sc       case                                (n,i)
  \s
{       { }
                                 (n,v,i)

  -- Preprocessor -------------------------------------------------------

  \p
<       #include <>
                         (n,i)
  \p"       #include ""                         (n,i)
  \pd       #define                             (n,i)
  \pu       #undef                              (n,i)
  \pie      #if  #else #endif                   (n,v,i)
  \pid      #ifdef #else #endif                 (n,v,i)
  \pin      #ifndef #else #endif                (n,v,i)
  \pind     #ifndef #def #endif                 (n,v,i)
  \pi0      #if 0 #endif                        (n,v,i)
  \pr0      remove #if 0 #endif                 (n,i)
  \pe       #error                              (n,i)
  \pl       #line                               (n,i)
  \pp       #pragma                             (n,i)

  -- Idioms -------------------------------------------------------------

  \if       function                            (n,v,i)
  \isf      static function                     (n,v,i)
  \im       main()                              (n,v,i)
  \i0       for( x=0; x<n; x+=1 )               (n,v,i)
  \in       for( x=n-1; x>=0; x-=1 )            (n,v,i)
  \ie       enum   + typedef                    (n,i)
  \is       struct + typedef                    (n,i)
  \iu       union  + typedef                    (n,i)
  \ip       printf()                            (n,i)
  \isc      scanf()                             (n,i)
  \ica      p=calloc()                          (n,i)
  \ima      p=malloc()                          (n,i)
  \isi      sizeof()                            (n,v,i)
  \ias      assert()                            (n,v)
  \ii       open input file                     (n,i)
  \io       open output file                    (n,i)

  -- Snippets -----------------------------------------------------------

  \nr       read code snippet                   (n,i)
  \nw       write code snippet                  (n,v,i)
  \ne       edit code snippet                   (n,i)
  \np       pick up prototype                   (n,v,i)
  \ni       insert prototype(s)                 (n,i)
  \nc       clear  prototype(s)                 (n,i)
  \ns       show   prototype(s)                 (n,i)
  \ntl      edit local templates                (n,i)
  \ntg      edit global templates               (n,i)
  \ntr      rebuild templates                   (n,i)

  -- C++ ----------------------------------------------------------------

  \+co      cout  <<  << endl;                  (n,i)
  \+c       class                               (n,i)
  \+cn      class (using new)                   (n,i)
  \+ci      class implementation                (n,i)
  \+cni     class (using new) implementation    (n,i)
  \+mi      method implementation               (n,i)
  \+ai      accessor implementation             (n,i)

  \+tc      template class                      (n,i)
  \+tcn     template class (using new)          (n,i)
  \+tci     template class implementation       (n,i)
  \+tcni    template class (using new) impl.    (n,i)
  \+tmi     template method implementation      (n,i)
  \+tai     template accessor implementation    (n,i)

  \+tf      template function                   (n,i)
  \+ec      error class                         (n,i)
  \+tr      try ... catch                       (n,v,i)
  \+ca      catch                               (n,v,i)
  \+c.      catch(...)                          (n,v,i)

  -- Run ----------------------------------------------------------------

  \rc       save and compile                    (n,i)
  \rl       link                                (n,i)
  \rr       run                                 (n,i)
  \ra       set comand line arguments           (n,i)
  \rm       run make                            (n,i)
  \rg       cmd. line arg. for make             (n,i)
  \rp       run splint                          (n,i)
  \ri       cmd. line arg. for splint           (n,i)
  \rk       run CodeCheck (TM)                  (n,i)
  \re       cmd. line arg. for CodeCheck (TM)   (n,i)
  \rd       run indent                          (n,v,i)
  \rh       hardcopy buffer                     (n,v,i)
  \rs       show plugin settings                (n,i)
  \rx       set xterm size                      (n, only Linux/UNIX & GUI)
  \ro       change output destination           (n,i)
