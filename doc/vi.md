# 方向 hjkl
# 删  x dw d$ d_(we$) dd 2dd
# 撤回 u U
# 剪贴 dd -> p
# 替换 r R cw c$
# 文件状态  CTRL-g
# 搜索  /   n N 
# 配对括号 %
# 修正错误 :s/old/new/g   :#,#s/old/new/g :%s/old/new/g  :%s/old/new/gc
# VIM 内执行外部命令的方法    :!
# 保存文件  :w TEST
# 有选择性的保存 :#,# w TEST
# 提取和合并文件 :r FILENAME
# 插入 a A o O 
# 复制 2y $y p

# 移动 ^ $  0  g_ 
# 打开 :e :w :saves :x :q! :bn :bp
# 重复执行 .  N
# 跳转 Ng(:N) gg G w e W E 
# 移动光标 %  * #
# 变大小写 gU gu 
# 移动 0 ^ $ g_ fa 3fa t  F T 
# 区域选择 <action>a<object> 或 <action>i<object>   (dyv)（ai)(wWsp.;]}...)
# 块操作: <C-v>   块操作，典型的操作： 0 <C-v> <C-d> I-- [ESC]
# 自动提示： <C-n> 和 <C-p>   在 Insert 模式下，你可以输入一个词的开头，然后按 <C-p>或是<C-n>，自动补齐功能就出现了……
# 宏录制： qa 操作序列 q, @a, @@    qaYp<C-a>q   @a @@ 100@

# 可视化选择： v,V,<C-v>
# J → 把所有的行连接起来（变成一行）
# < 或 > → 左右缩进

# 在所有被选择的行后加上点东西
# <C-v>
# 选中相关的行 (可使用 j 或 <C-d> 或是 /pattern 或是 % 等……)
# $ 到行最后
# A, 输入字符串，按 ESC。
 
# 分屏: :split 和 vsplit.
# :split → 创建分屏 (:vsplit创建垂直分屏)
# <C-w><dir> : dir就是方向，可以是 hjkl 或是 ←↓↑→ 中的一个，其用来切换分屏。
# <C-w>_ (或 <C-w>|) : 最大化尺寸 (<C-w>| 垂直分屏)
# <C-w>+ (或 <C-w>-) : 增加尺寸

# 分屏启动Vim
# vim -On file1 file2 ...
# 大写的O参数来垂直分屏  小写的o参数来水平分屏
#  n是数字，表示分成几个屏。

# 关闭
# Ctrl+W c

# 分屏
# Ctrl+W s
# :sp filename
# Ctrl+W v
# :vsp filename
