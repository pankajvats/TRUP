BAMTOOLS_ROOT=/opt/bamtools
ZLIB_ROOT=/usr/lib/x86_64-linux-gnu/libz
BOOST_ROOT=/usr/lib/x86_64-linux-gnu/libboost
CXX=g++
BAMFLAGS=-lbamtools
CXXFLAGS=-lz
LBFLAGS=-Wl,-rpath,$(BAMTOOLS_ROOT)/lib/lib/:$(BOOST_ROOT)/lib
BOOSTFLAGS=-lboost_regex
PREFIX=./
SRC=./src
TOOLSB=./tools_binaries_linux_x86_64/
BIN=/bin/
SOURCE_STA=Rseq_bam_stats.cpp
SOURCE_EXP=Rseq_bam_reads2expr.cpp
SOURCE_RIR=reads_in_region.cpp
SOURCE_DC=discordant_consistency.cpp
SOURCE_DM=discordant_mate.cpp
STA=Rseq_bam_stats
EXP=Rseq_bam_reads2expr
RIR=reads_in_region
DC=discordant_consistency
DM=discordant_mate

all: Rseq_bam_stats Rseq_bam_reads2expr reads_in_region discordant perl_scripts R_scripts other_tools

.PHONY: all

Rseq_bam_stats:
	@mkdir -p $(PREFIX)/$(BIN)
	@echo "* compiling" $(SOURCE_STA)
	@$(CXX) $(SRC)/$(SOURCE_STA) -o $(PREFIX)/$(BIN)/$(STA) $(BAMFLAGS) $(CXXFLAGS) $(LBFLAGS) $(BOOSTFLAGS) -I $(BAMTOOLS_ROOT)/include/ -I $(ZLIB_ROOT)/include/ -I $(BOOST_ROOT)/include/ -L $(BAMTOOLS_ROOT)/lib/ -L $(ZLIB_ROOT)/lib/ -L $(BOOST_ROOT)/lib/

Rseq_bam_reads2expr:
	@echo "* compiling" $(SOURCE_EXP)
	@$(CXX) $(SRC)/$(SOURCE_EXP) -o $(PREFIX)/$(BIN)/$(EXP) $(BAMFLAGS) $(CXXFLAGS) $(LBFLAGS) $(BOOSTFLAGS) -I $(BAMTOOLS_ROOT)/include/ -I $(ZLIB_ROOT)/include/ -I $(BOOST_ROOT)/include/ -L $(BAMTOOLS_ROOT)/lib/ -L $(ZLIB_ROOT)/lib/ -L $(BOOST_ROOT)/lib/

reads_in_region:
	@echo "* compiling" $(SOURCE_RIR)
	@$(CXX) $(SRC)/$(SOURCE_RIR) -o $(PREFIX)/$(BIN)/$(RIR) $(BAMFLAGS) $(CXXFLAGS) $(LBFLAGS) $(BOOSTFLAGS) -I $(BAMTOOLS_ROOT)/include/ -I $(ZLIB_ROOT)/include/ -I $(BOOST_ROOT)/include/ -L $(BAMTOOLS_ROOT)/lib/ -L $(ZLIB_ROOT)/lib/ -L $(BOOST_ROOT)/lib/

discordant:
	@echo "* compiling" $(SOURCE_DC)
	@$(CXX) $(SRC)/$(SOURCE_DC) -o $(PREFIX)/$(BIN)/$(DC) $(BAMFLAGS) $(CXXFLAGS) $(LBFLAGS) $(BOOSTFLAGS) -I $(BAMTOOLS_ROOT)/include/ -I $(ZLIB_ROOT)/include/ -I $(BOOST_ROOT)/include/ -L $(BAMTOOLS_ROOT)/lib/ -L $(ZLIB_ROOT)/lib/ -L $(BOOST_ROOT)/lib/
	@echo "* compiling" $(SOURCE_DM)
	@$(CXX) $(SRC)/$(SOURCE_DM) -o $(PREFIX)/$(BIN)/$(DM) $(BAMFLAGS) $(CXXFLAGS) $(LBFLAGS) $(BOOSTFLAGS) -I $(BAMTOOLS_ROOT)/include/ -I $(ZLIB_ROOT)/include/ -I $(BOOST_ROOT)/include/ -L $(BAMTOOLS_ROOT)/lib/ -L $(ZLIB_ROOT)/lib/ -L $(BOOST_ROOT)/lib/

perl_scripts:
	@echo "* copying perl scripts"
	@cp $(SRC)/*.pl $(PREFIX)/$(BIN)/
	@echo "* done."

R_scripts:
	@echo "* copying R scripts"
	@cp $(SRC)/*.R $(PREFIX)/$(BIN)/
	@echo "* done."

other_tools:
	@echo "* copying x86_64 linux binaries of other tools"
	@cp $(TOOLSB)/* $(PREFIX)/$(BIN)/
	@echo "* done."

RTrace:
	@echo "* copying RTrace.pl"
	@cp $(SRC)/RTrace.pl $(PREFIX)/$(BIN)/
	@echo "* done."

html:
	@echo "* copying html report script"
	@cp $(SRC)/html_report.R $(PREFIX)/$(BIN)/
	@echo "* done."

pickARP:
	@echo "* copying pick_ARP.pl"
	@cp $(SRC)/pick_ARP.pl $(PREFIX)/$(BIN)/
	@echo "* done."

pickFusion:
	@echo "* copying pick_fusion_transcripts_from_BLAT.pl"
	@cp $(SRC)/pick_fusion_transcripts_from_BLAT.pl $(PREFIX)/$(BIN)/
	@echo "* done."

filter:
	@echo "* copying filter_out_FP_from_blatps.pl"
	@cp $(SRC)/filter_out_FP_from_blatps.pl $(PREFIX)/$(BIN)/
	@echo "* done."

clean:
	@echo "Cleaning up everthing."
	@rm -rf $(PREFIX)/$(BIN)/


.PHONY: clean
