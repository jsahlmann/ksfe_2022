/**
\file map2svg.sas
\brief Create svg file from sganno data set
\details Create svg file from sganno data set
\author Jörg Sahlmann
\date 2022-08-20
*/
/** \cond */
proc print data=my_anno_1;
run;

proc print data=my_anno_2;
run;

proc print data=my_anno_2;
run;

/**
The following sgannotation amacros have to be mapped.

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

\param ds sganno data set
\param svgfile path and name of svg file
*/
%macro map2svg(ds, svgfile);
	data create_svg;
	    retain polypoints polygonline polygonlineend polylineline polylinelineend polycontpoints;
		set &ds. end=last;
		length line $1024;
		length polycontpoints $1024;
		length polygonline $1024;
		length polygonlineend $1024;
		length polylineline $1024;
		length polylinelineend $1024;

		if _n_=1 then
			do;
				polypoints=0;
				polycontpoints="";
				polygonline="";
				polygonlineend="";
				polylineline="";
				polylinelineend="";
				line='<svg xmlns="http://www.w3.org/2000/svg" width="1000px" height="1000px">';
				output;
				%def_arrow;
				%def_textstyle;
			end;

		if upcase(function)="ARROW" then
			do;
				%map2end;
				%map2arrow;
			end;

		if upcase(function)="IMAGE" then
			do;
				%map2end;
				%map2image;
			end;

		if upcase(function)="LINE" then
			do;
				%map2end;
				%map2line;
			end;

		if upcase(function)="OVAL" then
			do;
				%map2end;
				%map2oval;
			end;

		if upcase(function)="POLYCONT" then
			do;
				%map2polycont;
			end;

		if upcase(function)="POLYGON" then
			do;
				%map2end;
				%map2polygon;
			end;

		if upcase(function)="POLYLINE" then
			do;
				%map2end;
				%map2polyline;
			end;

		if upcase(function)="RECTANGLE" then
			do;
				%map2end;
				%map2rectangle;
			end;

		if upcase(function)="TEXT" then
			do;
				%map2end;
				%map2text;
			end;

		if upcase(function)="TEXTCONT" then
			do;
				%map2textcont;
			end;

		if last=1 then
			do;
				line="</svg>";
				output;
			end;
	run;

	filename svg_file "&svgfile.";

	data print_svg;
		set create_svg;
		file svg_file;
		put line;
	run;

	filename svg_file clear;
%mend print_svg;

option mprint;
%map2svg(my_anno_1, %str(/home/post9/JSVG/file_test.svg));
%map2svg(my_anno_2, %str(/home/post9/JSVG/file_rect.svg));
%map2svg(my_anno_3, %str(/home/post9/JSVG/file_rectTBLR.svg));

/** \endcond */