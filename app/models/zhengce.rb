# http://zzzany.site50.net/http:/zzzany.site50.net/rubyregexp.html
# http://rubyer.me/blog/357/
# http://www.kuqin.com/rubycndocument/man/lanstyle_seiki.html
class Zhengce

  # \d
  # 数字。即[0-9]
  puts "aaa0" =~ /\d/  # 3 匹配数字
  puts /\d/ =~ "abc2"  # 3
  puts "kkmm1" =~ /\d/ # 4 匹配数字

  # [\u{4e00}-\u{9fff}]
  # 中文
  puts "abcdef我熬啊" =~ /[\u{4e00}-\u{9fff}]/u   #6  匹配中文
  puts "abcdef我熬啊" =~ /\p{Han}/u  # 6


  # \w
  # 字母和数字。等同于[0-9A-Za-z]。
  puts "-=123a" =~  /\w/ # 2 匹配字母
  puts "-=a3a" =~  /\w/ # 2 匹配字母   

  # \s
  # 空字符。相当于[ \t\n\r\f]
  puts "aaa bbb" =~ /aa\s/ # 1
  puts "aaa bbb" =~ /\s/ # 3

  # ^
  # 行首。与字符串的头部或换行符之后的位置相匹配。
  # \A
  # 字符串头部。与^不同的是，它不受有无换行符的影响 。
  puts "abcd\nefghg" =~ /^e/ # 5
  puts "1\n2\n3\n4" =~ /^3/  # 4
  puts "1\n2\n3\n4" =~ /\A1/ # 0
  puts "abcd\nefghg" =~ /\A/ # 0

  # $
  # 行尾。与字符串的尾部或换行符之前的位置相匹配。不包括换行符本身。
  # \Z
  # 字符串尾部。若字符串以换行符结尾，则匹配换行符前的位置。
  puts "abcd\nefghg" =~ /g$/ # 9
  puts "1\n2\n3\n4" =~ /3$/  # 4
  puts "1\n2\n3\n4" =~ /4\Z/ # 6
  puts "abcd\nefghg" =~ /\Z/ # 10

  # .
  # 匹配除换行符以外的任意一个字符。使用正则表达式选项 m(多行模式。请参考正则表达式字面值) 时，则匹配包括换行符在内的任意一个字符。在匹配多字节字符的正则表达式中，则匹配一个字(非单字节)。
  # 当遇到不完整的多字节字符的一部分(无法判断该字符是多字节字符？二进制？还是ASCII)时，也不会匹配。
  puts /./e =~ "CV--aa" # 0
  puts /./ =~ "あ"  # 0
  /a.*b/.match("a123bcab") #=><MatchData "a123bcab:>


  # \b
  # 在字符范围描述符之外时表示词边界(匹配从\w到\W)。在字符范围描述符之内时表示退格符(0x08)。
  puts "232342eaaabbbddd43452532543" =~ /b/ # 10

  # 从头取出3位数字(数字必须相连)。
  str = "123456 789"
  puts str.scan(/\G\d\d\d/) {|m| p m }


  # [ ]
  # 指定字符范围。请参考字符范围
  puts "1445345abc" =~ /[a-z]/

  # *
  # 前面元素至少出现0次。尽可能匹配较长的部分。
  # *?
  # 负责指定数量(quantifiers)。表示前面元素至少出现0次(尽量匹配短的部分)
  # +
  # 负责指定数量(quantifiers)。表示前面元素至少出现1次
  # +?
  # 负责指定数量(quantifiers)。表示前面元素至少出现1次(尽量匹配短的部分)


  # {m}
  # {m,}
  # {m,n}
  # 指定元素重复出现的次数(interval quantifier)。分别表示前面元素重复出现
  # m 次
  # 至少 m 次
  # 至少 m 次，至多 n 次
  # {,n} 或 {,} 将导致匹配失败。
  str = "foofoofoo"
  p str[/(foo){1}/]   # => "foo"
  p str[/(foo){2,}/]  # => "foofoofoo"
  p str[/(foo){1,2}/] # => "foofoo"

  # 正则表达式 ?, *, + 分别等同于 {0,1}, {0,} {1,} 。
  # {m}?
  # {m,}?
  # {m,n}?
  # 指定元素重复出现的次数(interval quantifier)。分别表示前面元素重复出现
  # m 次
  # 至少 m 次
  # 至少 m 次，至多 n 次
  # (尽量匹配短的部分)。
  str = "foofoofoo"
  p str[/f{1}?/] # f
  p str[/(o){2,8}?/] # f

  # ?
  # 负责指定数量(quantifiers)。表示前面元素至多出现1次。
  # ??
  # 负责指定数量(quantifiers)。表示前面元素至多出现1次(尽量匹配短的部分)
  # |
  # 选择(alternative)。
  # ( )
  # 正则表达式的群组化。与括号中的正则表达式相匹配的字符串将被保存下来，供后方参考使用。
  p /(ab)+/=~"123abab"
  p /(ab)+/.match("123abab") #=><MatchData "abab" 1:"ab">
  # \1, \2 ... \n
  # 后方参考(back reference)。请参考后方参考。
  p /((foo)bar)foobarfoo/
  re = /(foo|bar|baz)\1/
  p re =~ 'foofoo'   # => 0
  p re =~ 'barbar'   # => 0
  p re =~ 'bazbaz'   # => 0
  p re =~ 'foobar'   # => nil

  # (?# )
  # 注释。括号中的任意字符串将被忽视。

  # (?: )
  # 不具备后方参考功能的群组化。它不为\1,\2(或$1,$2)提供服务，是一种单纯的群组功能。
  /(cba)/ =~ "abccba"
  p $1  # cba

  /(?:abc)/ =~ "abc"
  p $1


   
  # Regexp .match(text)
  md = /(\d\d):(\d\d)(..)/.match("12:50am")
  puts "Hour is #$1, minute #$2"
  puts "Hour is #{md[1]}, minute #{md[2]}"
  # Regexp .quote(text) | .escape(text)
  # String .index(Regexp)  | =~

  # String .scan(Regexp)
  "abcabcabz".scan(%r{abc}).each {|item| puts item} # 输出2行abc
  puts "2010-11-22 2022-08-25".scan(/\d{4}-\d{2}-\d{2}/)
  puts "2010-11-22 2022-08-25".scan(/(\d{4})-(\d{2})-(\d{2})/)

  #String .slice(Regexp)
  string = "Date: 2012-12-23"
  regex = /\d{4}-\d{2}-\d{2}/
  p string.slice(regex) # 2012-12-23

  #String.split(Regexp)
  p "2012-12-23".split(/-/)

  # String.sub | .gsub(Regexp,String)
  str = "ABDADA"
  p str.sub(/A/, "*")   #返回"*BDADA"
  p str.gsub(/A/, "*") #返回"*BD*D*"



end