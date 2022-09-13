/**
\file first_example.sas
\brief Creates three example annotate data sets.
\details This program creates three different annotate data set with some basic commands.

-  my_anno_1: Some of the available SG macros
-  my_anno_2: Rectangles with four different anchors
-  my_anno_3: Rectangels with another four different anchors.

The DATAVALUES spaces will be used.

A coordinate system with data of x ranging from 0 to 1000 and y ranging from 0 to 1000 will be used.

The resulting figures will be printed saved with and without axes.

\author Jörg Sahlmann
\date 2022-08-20
*/
/** \cond */

%SGANNO;

/* Generate the data area as 1000 x 1000. */
data my_plot;
	x=0;
	y=0;
	output;
	x=1000;
	output;
	x=0;
	y=1000;
	output;
	x=1000;
	output;
run;

data my_anno_1;
	/* Minimal parameters for each SG macro
	%SGARROW: Required x1, x2, y1, y2
	%SGIMAGE: Required image
	%SGLINE:  Required x1, x2, y1, y2
	%SGOVAL:  Required height, weight, x1, x2
	%SGPOLYCONT: Required x1, x2
	%SGPOLYGON: Required x1, y1
	%SGPOLYLINE: Required x1, y1
	%SGRECTANGLE:  Required height, weight, x1, x2
	%SGTEXT: Required label
	%SGTEXTCONT
	*/
	%SGLINE(x1=0, y1=0, x2=1000, y2=0, linecolor="BLACK", transparency = 0.5,
	x1space="DATAVALUE", y1space="DATAVALUE",
	x2space="DATAVALUE", y2space="DATAVALUE");
	%SGLINE(x1=0, y1=100, x2=1000, y2=100, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=200, x2=1000, y2=200, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=300, x2=1000, y2=300, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=400, x2=1000, y2=400, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=500, x2=1000, y2=500, linecolor="Blaci", transparency = 0.5);
	%SGLINE(x1=0, y1=600, x2=1000, y2=600, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=700, x2=1000, y2=700, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=800, x2=1000, y2=800, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=900, x2=1000, y2=900, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=1000, x2=1000, y2=1000, linecolor="BLACK", transparency = 0.5);
	%SGLINE(x1=0, y1=0, x2=0, y2=1000, linecolor="BLACK", transparency = 0.5);
	%SGLINE(x1=100, y1=0, x2=100, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=200, y1=0, x2=200, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=300, y1=0, x2=300, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=400, y1=0, x2=400, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=500, y1=0, x2=500, y2=1000, linecolor="BLACK", transparency = 0.5);
	%SGLINE(x1=600, y1=0, x2=600, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=700, y1=0, x2=700, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=800, y1=0, x2=800, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=900, y1=0, x2=900, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=1000, y1=0, x2=1000, y2=1000, linecolor="GREY", transparency = 0.5);
	
	%SGIMAGE(image="/home/post9/JSVG/ksfelogo.png", x1=100, y1=100, 
		x1space="DATAVALUE", y1space="DATAVALUE", widthunit="DATA", heightunit="DATA", 
		transparency=0.5);
	%SGOVAL(reset="ALL", x1=250, y1=250, x1space="DATAVALUE", y1space="DATAVALUE", 
		height=100, heightunit="DATA", width=100, widthunit="DATA");
	%SGOVAL(x1=750, y1=250, height=100, width=100);
	%SGOVAL(x1=250, y1=750, height=100, width=100);
	%SGOVAL(x1=750, y1=750, height=100, width=100);
	%SGLINE(x1=250, y1=250, x2=250, x2space="DATAVALUE", y2=750, 
		y2space="DATAVALUE");
	%SGLINE(x1=250, y1=750, x2=750, y2=750);
	%SGLINE(x1=750, y1=750, x2=750, y2=250);
	%SGLINE(x1=750, y1=250, x2=250, y2=250);
	%SGARROW(x1=250, y1=250, x2=750, y2=750);
	%SGARROW(x1=750, y1=250, x2=250, y2=750);
	%SGPOLYGON(x1=0, y1=0);
	%SGPOLYCONT(x1=100, y1=200);
	%SGPOLYCONT(x1=200, y1=100);
	%SGPOLYLINE(x1=1000, y1=0);
	%SGPOLYCONT(x1=900, y1=100);
	%SGPOLYCONT(x1=1000, y1=200);
	%SGPOLYCONT(x1=900, y1=300);
	%SGPOLYCONT(x1=1000, y1=400);
	%SGPOLYCONT(x1=900, y1=500);
	%SGPOLYCONT(x1=1000, y1=600);
	%SGPOLYCONT(x1=900, y1=700);
	%SGRECTANGLE(x1=400, y1=50, width=400, height=100, anchor="BOTTOMLEFT");
	%SGTEXT(label="Textbeispiel", anchor="BOTTOMLEFT", x1=200, y1=900, width=600);
	%SGTEXTCONT(label="Fortsetzung", textcolor="BLUE");
	%SGTEXTCONT(label="Noch eine Fortsetzung", textcolor="RED");
run;

data my_anno_2;
	%SGLINE(x1=0, y1=0, x2=1000, y2=0, linecolor="BLACK", transparency = 0.5,
	x1space="DATAVALUE", y1space="DATAVALUE",
	x2space="DATAVALUE", y2space="DATAVALUE");
	%SGLINE(x1=0, y1=100, x2=1000, y2=100, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=200, x2=1000, y2=200, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=300, x2=1000, y2=300, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=400, x2=1000, y2=400, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=500, x2=1000, y2=500, linecolor="Blaci", transparency = 0.5);
	%SGLINE(x1=0, y1=600, x2=1000, y2=600, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=700, x2=1000, y2=700, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=800, x2=1000, y2=800, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=900, x2=1000, y2=900, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=1000, x2=1000, y2=1000, linecolor="BLACK", transparency = 0.5);
	%SGLINE(x1=0, y1=0, x2=0, y2=1000, linecolor="BLACK", transparency = 0.5);
	%SGLINE(x1=100, y1=0, x2=100, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=200, y1=0, x2=200, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=300, y1=0, x2=300, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=400, y1=0, x2=400, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=500, y1=0, x2=500, y2=1000, linecolor="BLACK", transparency = 0.5);
	%SGLINE(x1=600, y1=0, x2=600, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=700, y1=0, x2=700, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=800, y1=0, x2=800, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=900, y1=0, x2=900, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=1000, y1=0, x2=1000, y2=1000, linecolor="GREY", transparency = 0.5);

	%SGLINE(reset = "ALL", x1=0, y1=200, x2=1000, y2=200, linecolor="RED",
		x1space="DATAVALUE", y1space="DATAVALUE", x2space="DATAVALUE", y2space="DATAVALUE", transparency = 0.5);
	%SGLINE(x1=200, y1=0, x2=200, y2=1000, linecolor="BLUE",
		x1space="DATAVALUE", y1space="DATAVALUE", x2space="DATAVALUE", y2space="DATAVALUE", transparency = 0.5);
	%SGRECTANGLE(x1=200, y1=150, width=300, height=100, linecolor="RED", 
		anchor="BOTTOMLEFT", x1space="DATAVALUE", y1space="DATAVALUE", 
		widthunit="DATA", heightunit="DATA", transparency=0.6);
	%SGRECTANGLE(x1=200, y1=150, width=300, height=100, linecolor="GREEN", 
		anchor="BOTTOMRIGHT");
	%SGRECTANGLE(x1=200, y1=150, width=300, height=100, linecolor="BLUE", 
		anchor="TOPLEFT");
	%SGRECTANGLE(x1=200, y1=150, width=300, height=100, linecolor="BLACK", 
		anchor="TOPRIGHT");
run;

data my_anno_3;
	%SGLINE(x1=0, y1=0, x2=1000, y2=0, linecolor="BLACK", transparency = 0.5,
	x1space="DATAVALUE", y1space="DATAVALUE",
	x2space="DATAVALUE", y2space="DATAVALUE");
	%SGLINE(x1=0, y1=100, x2=1000, y2=100, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=200, x2=1000, y2=200, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=300, x2=1000, y2=300, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=400, x2=1000, y2=400, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=500, x2=1000, y2=500, linecolor="Blaci", transparency = 0.5);
	%SGLINE(x1=0, y1=600, x2=1000, y2=600, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=700, x2=1000, y2=700, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=800, x2=1000, y2=800, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=900, x2=1000, y2=900, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=0, y1=1000, x2=1000, y2=1000, linecolor="BLACK", transparency = 0.5);
	%SGLINE(x1=0, y1=0, x2=0, y2=1000, linecolor="BLACK", transparency = 0.5);
	%SGLINE(x1=100, y1=0, x2=100, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=200, y1=0, x2=200, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=300, y1=0, x2=300, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=400, y1=0, x2=400, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=500, y1=0, x2=500, y2=1000, linecolor="BLACK", transparency = 0.5);
	%SGLINE(x1=600, y1=0, x2=600, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=700, y1=0, x2=700, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=800, y1=0, x2=800, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=900, y1=0, x2=900, y2=1000, linecolor="GREY", transparency = 0.5);
	%SGLINE(x1=1000, y1=0, x2=1000, y2=1000, linecolor="GREY", transparency = 0.5);
	
	%SGLINE(reset = "ALL", x1=0, y1=200, x2=1000, y2=200, linecolor="RED",
		x1space="DATAVALUE", y1space="DATAVALUE", x2space="DATAVALUE", y2space="DATAVALUE", transparency = 0.5);
	%SGLINE(x1=200, y1=0, x2=200, y2=1000, linecolor="BLUE",
		x1space="DATAVALUE", y1space="DATAVALUE", x2space="DATAVALUE", y2space="DATAVALUE", transparency = 0.5);
	%SGRECTANGLE(x1=200, y1=150, width=300, height=100, linecolor="RED", 
		anchor="BOTTOM", x1space="DATAVALUE", y1space="DATAVALUE", 
		widthunit="DATA", heightunit="DATA", transparency=0.6);
	%SGRECTANGLE(x1=200, y1=150, width=300, height=100, linecolor="GREEN", 
		anchor="RIGHT");
	%SGRECTANGLE(x1=200, y1=150, width=300, height=100, linecolor="BLUE", 
		anchor="LEFT");
	%SGRECTANGLE(x1=200, y1=150, width=300, height=100, linecolor="BLACK", 
		anchor="TOP");
run;

ods listing gpath='/home/post9/JSVG/';
ods graphics / imagename="ksfe_mit_achsen" imagefmt=png;

proc sgplot data=my_plot sganno=my_anno_1;
	scatter x=x y=y / MARKERATTRS=(COLOR=white);
	*xaxis label="" display=NONE;
	*yaxis label="" display=NONE;
run;

ods graphics / imagename="ksfe_ohne_achsen" imagefmt=png;

proc sgplot data=my_plot sganno=my_anno_1;
	scatter x=x y=y / MARKERATTRS=(COLOR=white);
	xaxis label="" display=NONE;
	yaxis label="" display=NONE;
run;

ods graphics / imagename="rect_mit_achsen" imagefmt=png;

proc sgplot data=my_plot sganno=my_anno_2;
	scatter x=x y=y / MARKERATTRS=(COLOR=white);
	*xaxis label="" display=NONE;
	*yaxis label="" display=NONE;
run;

ods graphics / imagename="rect_ohne_achsen" imagefmt=png;

proc sgplot data=my_plot sganno=my_anno_2;
	scatter x=x y=y / MARKERATTRS=(COLOR=white);
	xaxis label="" display=NONE;
	yaxis label="" display=NONE;
run;

ods graphics / imagename="rectTBLR_mit_achsen" imagefmt=png;

proc sgplot data=my_plot sganno=my_anno_3;
	scatter x=x y=y / MARKERATTRS=(COLOR=white);
	*xaxis label="" display=NONE;
	*yaxis label="" display=NONE;
run;

ods graphics / imagename="rectTBLR_ohne_achsen" imagefmt=png;

proc sgplot data=my_plot sganno=my_anno_3;
	scatter x=x y=y / MARKERATTRS=(COLOR=white);
	xaxis label="" display=NONE;
	yaxis label="" display=NONE;
run;

/** \endcond */