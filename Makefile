#此行为注释行
#测试变量定义
include ./src/Makefile
Readme = 用户指引
help:
	@echo $(Readme)
OBJS2 = $(OBJS1) c.c
OBJS1 := $(OBJS0) b.c
OBJS0 = a.c
test1:
	@echo $(OBJS2)
#变量替换
SRCS0 := a.c b.c c.c
OBJS3 := $(SRCS0:%.c=%.o)
test2:
	@echo "SRCS: " $(SRCS0)
	@echo "OBJS: " $(OBJS3)
#变量追加
SRCS1 := a.c b.c c.c
SRCS1 += d.c
test3:
	@echo "SRCS: " $(SRCS1)
#变量覆盖
SRCS2 := d.c
override SRCS2 := a.c b.c c.c
test4:
	@echo "SRCS: " $(SRCS2)
#目标变量a
test5: TARGET1-SRCS := d.c
test5:
	@echo "SRCS: " $(TARGET1-SRCS)
test6:
	@echo "SRCS: " $(TARGET1-SRCS)
#Makefile命令前缀
test7:
	echo "没有前缀"
	cat this_file_not_exist
	echo "错误之后的命令"
test8:
	@echo "前缀@"
	@cat this_file_not_exist
	@echo "错误之后的命令"
test9:
	-echo "前缀-"
	-cat this_file_not_exist
	-echo "错误之后的命令"
test10:
	@echo "主makefile begin"
	@make src-test1
	@echo "主makefile end"
export VALUE := a.c b.c c.c
#export
test11:
	@echo "主makefile begin"
	@make src-test1
	@echo "主makefile end"
#定义命令包
define run-hello-makefile
@echo -n "Hello"
@echo " Makefile!"
@echo "这里可以执行多条 Shell 命令!"
endef
test12:
	$(run-hello-makefile)
#判断语句
test13:
ifeq ("aa", "bb")
	@echo "equal"
else
	@echo "not equal"
endif
#字符串替换函数
str1 := string
str2 := $(subst s,S,$(str1))
test14:
	@echo $(str2)
#字符串过滤函数
test15:
	@echo $(filter %.o %.a,a.c b.o c.a)
#排序函数
test16:
	@echo $(sort bac abc acb cab)
#foreach函数
targets := a b c d
objects := $(foreach i,$(targets),$(i).o)
test17:
	@echo $(targets)
	@echo $(objects)
#origin函数
val-in-file := test-file
override val-override := test-override
test18:
	@echo $(origin not-define)    # not-define 没有定义
	@echo $(origin CC)            # CC 是Makefile默认定义的变量
	@echo $(origin PATH)         # PATH 是 bash 环境变量
	@echo $(origin val-in-file)    # 此Makefile中定义的变量
	@echo $(origin val-in-cmd)    # 这个变量会加在 make 的参数中
	@echo $(origin val-override) # 此Makefile中定义的override变量
	@echo $(origin @)             # 自动变量, 具体前面的介绍
#error函数
error:
	$(error there is an error!)
	@echo "这里不会执行!"
#warning函数
warning:
	$(warning there is an warning!)
	@echo "这里会执行!"
#伪目标
.PHONY: clean
clean:
	-rm -f *.o
