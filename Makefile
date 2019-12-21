#此行为注释行
#测试变量定义
OBJS2 = $(OBJS1) c.c
OBJS1 := $(OBJS0) b.c
OBJS0 = a.c
test1:
	@echo $(OBJS2)
#变量替换
SRCS0 := a.c b.c c.c
OBJS3 := $(SRCS:%.c=%.o)
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