//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "cat /tmp/recordingicon 2>/dev/null",	0,	9},
	{"",	"sb-pacpackages",	0,	8},
	{"",	"sb-doppler",	0,	19},
	{"",	"sb-tasks",	10,	26},
	{"",	"sb-torrent",	20,	7},
	{"",	"sb-mailbox",	0,	12},
	{"",	"sb-news",		0,	6},
	{"",	"sb-internet",	5,	4},
	{"",	"sb-nettraf",	1,	16},
	{"",	"sb-cpu",		1,	21},
	{"",	"sb-cpubars",		1,	22},
	{"",	"sb-memory",	1,	14},
	{"",	"sb-disk",	1,	20},
	{"",	"sb-volume",	0,	10},
	{"",	"sb-clock",	1,	1},
	{"",	"sb-battery",	5,	3},
};

//Sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char *delim = "";

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:

// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }

