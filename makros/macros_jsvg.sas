/**
\file macros_jsvg.sas
\brief Macros for mapping individual sgannotation macros to svg items
\details Macros for mapping individual sgannotation macros to svg items

%SGARROW
%SGIMAGE
%SGLINE
%SGOVAL
%SGPOLYCONT
%SGPOLYGON
%SGPOLYLINE
%SGRECTANGLE
%SGTEXT
%SGTEXTCONT

\author Jörg Sahlmann
*/
/** \cond */

/**
Definition of arrows is not part of the line definition.
It has to be defined as an own entity and referenced by the line.
*/
%macro def_arrow;
	line='<defs>';
	output;
	line='<marker id="markerPfeil" markerWidth="130" markerHeight="13" refx="2" refy="6" orient="auto">';
	output;
	line='<path d="M2,2 v8 l8,-4z "/>';
	output;
	line='</marker>';
	output;
	line='</defs>';
	output;
%mend def_arrow;

/**
*/
%macro def_textstyle;
    line='<style>';
    output;
    line='.annotext {font: 14px; fill: blue; }';
    output;
    line='</style>';
    output;
%mend def_textstyle;

/**
*/
%macro map2end;
	if polypoints >=2 and polygonlineend NE "" then do;
	line=catt(polygonline, polycontpoints, polygonlineend);
	polypoints=0;
	polycontpoints="";
	polygonline="";
	polygonlineend="";
	output;
	end;
	else if polypoints >=2 and polylinelineend NE "" then do;
	line=catt(polylineline, polycontpoints, polylinelineend);
	polypoints=0;
	polycontpoints="";
	polylineline="";
	polylinelineend="";
	output;
	end;
%mend map2end;

/**
*/
%macro map2arrow;
	if linecolor="" then do;
	aktlinecolor="black";
	end;
	else do;
	aktlinecolor=linecolor;
	end;
	line='<line';
	line=catt(line, ' x1="', x1, '"');
	line=catt(line, ' x2="', x2, '"');
	line=catt(line, ' y1="', y1, '"');
	line=catt(line, ' y2="', y2, '"');
	line=catt(line, ' stroke="', aktlinecolor, '"');
	line=catt(line, ' style="marker-end: url(#markerPfeil);"');
	line=catt(line, ' />');
	output;
%mend map2arrow;

/**
*/
%macro map2image;
    aktwidth = 357;
    aktheight = 78;
	line='<image';
	line=catt(line, ' href="', image, '"');
	line=catt(line, ' x="', x1, '"');
	line=catt(line, ' y="', y1, '"');
	line=catt(line, ' width="', aktwidth, '"');
	line=catt(line, ' height="', aktheight, '"');
	line=catt(line, ' />');
	output;
%mend map2image;

/**
<line x1="0" y1="80" x2="100" y2="20" stroke="black" />

No default color for linecolor//line: Set to blue.
*/
%macro map2line;
	if linecolor="" then do;
	aktlinecolor="black";
	end;
	else do;
	aktlinecolor=linecolor;
	end;
	if width="" then do;
	aktwidth="3";
	end;
	else do;
	aktwidth=width;
	end;
	aktwidth=3;
	line='<line';
	line=catt(line, ' x1="', x1, '"');
	line=catt(line, ' x2="', x2, '"');
	line=catt(line, ' y1="', y1, '"');
	line=catt(line, ' y2="', y2, '"');
	line=catt(line, ' stroke="', aktlinecolor, '"');
	line=catt(line, ' style="stroke-width:', aktwidth, ';"');
	line=catt(line, ' />');
	output;
%mend map2line;

/**
<ellipse cx="'&x1.'" cy="'&y1.'" rx="'&width.'" ry="'&height.'" fill="red" />

No default color for fillcolor//fill
*/
%macro map2oval;
	if linecolor="" then do;
	aktlinecolor="black";
	end;
	else do;
	aktlinecolor=linecolor;
	end;
	if fillcolor="" then do;
	aktfillcolor="white";
	end;
	else do;
	aktfillcolor=fillcolor;
	end;
	line='<ellipse';
	line=catt(line, ' cx="', x1, '"');
	line=catt(line, ' cy="', y1, '"');
	line=catt(line, ' rx="', width / 2, '"');
	line=catt(line, ' ry="', height / 2, '"');
	line=catt(line, ' stroke="', aktlinecolor, '"');
	line=catt(line, ' fill="', aktfillcolor, '"');
	line=catt(line, ' />');
	output;
%mend map2oval;

/**
*/
%macro map2polycont;
	polycontpoints=catt(polycontpoints, ',' , x1, ',' , y1);
	polypoints=polypoints + 1;
%mend map2polycont;

/**
*/
%macro map2polygon;
	if linecolor="" then do;
	aktlinecolor="black";
	end;
	else do;
	aktlinecolor=linecolor;
	end;
	if fillcolor="" then do;
	aktfillcolor="white";
	end;
	else do;
	aktfillcolor=fillcolor;
	end;
	polypoints=1;
	polycontpoints='';
	polygonline=catt('<polygon points="', x1, ',', y1);
	polygonlineend=catt(',', x1, ',', y1, '" stroke="', aktlinecolor, '"');
	polygonlineend=catt(polygonlineend, ' fill="', aktfillcolor, '" />');
%mend map2polygon;

/**
*/
%macro map2polyline;
	if linecolor="" then do;
	aktlinecolor="black";
	end;
	else do;
	aktlinecolor=linecolor;
	end;
	if fillcolor="" then do;
	aktfillcolor="none";
	end;
	else do;
	aktfillcolor=fillcolor;
	end;
	polypoints=1;
	polycontpoints='';
	polylineline=catt('<polyline points="', x1, ',', y1);
	polylinelineend=catt('" stroke="', aktlinecolor, '"');
	polylinelineend=catt(polylinelineend, ' style="fill:', aktfillcolor, ';" />');
%mend map2polyline;

/**
<rect x="50" y="20" width="150" height="150">

SGANNO: The reference point is set to border left point of rectangle.

SVG: The x and y coordinates refer to the left and top edges of the rectangle,
in the current user coordinate system.
*/
%macro map2rectangle;
	if linecolor="" then do;
	aktlinecolor="black";
	end;
	else do;
	aktlinecolor=linecolor;
	end;
	if fillcolor="" then do;
	aktfillcolor="white";
	end;
	else do;
	aktfillcolor=fillcolor;
	end;
	if anchor="" or upcase(anchor)="CENTER" then do;
	aktx1=x1 - width / 2;
	akty1=y1 - height / 2;
	end;
	else if upcase(anchor)="TOPLEFT" then do;
	aktx1=x1;
	akty1=y1 - height;
	end;
	else if upcase(anchor)="TOP" then do;
	aktx1=x1 - width / 2;
	akty1=y1 - height;
	end;
	else if upcase(anchor)="TOPRIGHT" then do;
	aktx1=x1 - width;
	akty1=y1 - height;
	end;
	else if upcase(anchor)="RIGHT" then do;
	aktx1=x1 - width;
	akty1=y1 - height / 2;
	end;
	else if upcase(anchor)="BOTTOMRIGHT" then do;
	aktx1=x1 - width;
	akty1=y1;
	end;
	else if upcase(anchor)="BOTTOM" then do;
	aktx1=x1 - width / 2;
	akty1=y1;
	end;
	else if upcase(anchor)="BOTTOMLEFT" then do;
	aktx1=x1;
	akty1=y1;
	end;
	else if upcase(anchor)="LEFT" then do;
	aktx1=x1;
	akty1=y1 - height / 2;
	end;
	line='<rect';
	line=catt(line, ' x="', aktx1, '"');
	line=catt(line, ' y="', akty1, '"');
	line=catt(line, ' width="', width, '"');
	line=catt(line, ' height="', height, '"');
	line=catt(line, ' stroke="', aktlinecolor, '"');
	line=catt(line, ' fill="', aktfillcolor, '"');
	line=catt(line, ' />');
	output;
%mend map2rectangle;

/**
*/
%macro map2text;
	line='<text';
	line=catt(line, ' x="', x1, '"');
	line=catt(line, ' y="', y1, '"');
	line=catt(line, ' >');
	line=catt(line, label);
	line=catt(line, ' </text>');
	output;
%mend map2text;

/**
*/
%macro map2textcont;
	line='<text';
	line=catt(line, ' dx="', x1, '"');
	line=catt(line, ' dy="', y1, '"');
	line=catt(line, ' >');
	line=catt(line, label);
	line=catt(line, ' </text>');
	output;
%mend map2textcont;

/** \endcond */