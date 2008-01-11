###################################################

CC_WIN32 = cl /c /nologo /EHsc
CSUF_WIN32 = .obj
CCOUT_WIN32 = /Fo
LINK_WIN32 = link /nologo
LSUF_WIN32 = .exe
LINKOUT_WIN32 = /out:

CC_UNIX = g++ -c
CSUF_UNIX = .o
CCOUT_UNIX = -o 
LINK_UNIX = g++
LSUF_UNIX = 
LINKOUT_UNIX = -o 

CC = $(CC_$(SYSTEM))
CSUF = $(CSUF_$(SYSTEM))
CCOUT = $(CCOUT_$(SYSTEM))
LINK = $(LINK_$(SYSTEM))
LINKOUT = $(LINKOUT_$(SYSTEM))
LSUF = $(LSUF_$(SYSTEM))

###################################################

SRC_IDEP = \
		   idep_adep.cpp \
		   idep_altab.cpp \
		   idep_alutil.cpp \
		   idep_binrel.cpp \
		   idep_cdep.cpp \
		   idep_fdepitr.cpp \
		   idep_ldep.cpp \
		   idep_namea.cpp \
		   idep_nimap.cpp \
		   idep_string.cpp \
		   idep_tokitr.cpp

SRC_ADEP = \
		   adep.cpp \
		   $(SRC_IDEP)

SRC_CDEP = \
		   cdep.cpp \
		   $(SRC_IDEP)

SRC_LDEP = \
		   ldep.cpp \
		   $(SRC_IDEP)

###################################################

all: adep$(LSUF) cdep$(LSUF) ldep$(LSUF)

clean:
	rm -fr $(SRC_ADEP:.cpp=$(CSUF)) $(SRC_LDEP:.cpp=$(CSUF)) $(SRC_CDEP:.cpp=$(CSUF))

###################################################

adep$(LSUF) : $(SRC_ADEP:.cpp=$(CSUF))
	$(LINK) $(LINKOUT)$@ $^

cdep$(LSUF) : $(SRC_CDEP:.cpp=$(CSUF))
	$(LINK) -out:$@ $^

ldep$(LSUF) : $(SRC_LDEP:.cpp=$(CSUF))
	$(LINK) -out:$@ $^

###################################################

%$(CSUF) : %.cpp
	$(CC) $(CCOUT)$@ $<

