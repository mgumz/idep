###################################################

CC = cl /c /nologo /EHsc
LINK = link /nologo

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

all: adep.exe cdep.exe ldep.exe

clean:
	rm -fr $(SRC_ADEP:.cpp=.obj) $(SRC_LDEP:.cpp=.obj) $(SRC_CDEP:.cpp=.obj)

###################################################

adep.exe : $(SRC_ADEP:.cpp=.obj)
	$(LINK) -out:$@ $^

cdep.exe : $(SRC_CDEP:.cpp=.obj)
	$(LINK) -out:$@ $^

ldep.exe : $(SRC_LDEP:.cpp=.obj)
	$(LINK) -out:$@ $^

###################################################

%.obj : %.cpp
	$(CC) $<

