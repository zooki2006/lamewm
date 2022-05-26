static const char col_cyan[]        = "#005577";
static const char col_gray1[]       = "#222222";
static const char col_purple[]      = "#3c325f";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_darkblue[]    = "#1E242D";
static const char col_darkishblue[] = "#161b23";
static const char col_lightblue[] = "#d5e5fe";

static const char *colors[][3]      = {
	/*               fg         bg         border   */
//	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
//	[SchemeNorm] = { col_gray3, col_darkishblue, col_darkishblue },
//	[SchemeNorm] = { col_lightblue, col_darkishblue, col_darkishblue },
	[SchemeNorm] = { col_lightblue, col_darkishblue, col_darkblue },
	[SchemeSel]  = { col_gray4, col_purple, col_purple  },
};
