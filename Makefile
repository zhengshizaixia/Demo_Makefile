#此行为注释行
#测试变量定义 = 
OBJS2 = $(OBJS1) c.c
OBJS1 := $(OBJS0) b.c
OBJS0 = a.c
all:
	@echo $(OBJS2)
