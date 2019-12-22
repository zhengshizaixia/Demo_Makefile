#此行为注释行
#测试变量定义
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
#伪目标
.PHONY: clean   <-- 这句没有也行, 但是最好加上
clean:
	-rm -f *.o
