/**
\file macros_jsvg_create.sas
\brief Contains macros for creating svg files from the scratch.
\details Contains macros for creating svg files from the scratch.
\author Jörg Sahlmann
\date 2022-08-22
*/
/** \cond */
options mprint;

/**
*/
%macro svg_init(ds, wpx = 1000, hpx = 1000);
	data &ds.;
		length line $1024;
	run;

	data &ds._temp;
		length line $1024;
		line=catt('<svg xmlns="http://www.w3.org/2000/svg" width="', &wpx., 'px" height="', &hpx.,'px">');
		output;
	run;

	data &ds.;
		set &ds._temp;
	run;

%mend svg_init;

/**
*/
%macro svg_close(ds);
	data &ds._temp;
		length line $1024;
		line="</svg>";
		output;
	run;

	data &ds.;
		set &ds. &ds._temp;
	run;

%mend svg_close;

/**
*/
%macro svg_ellipse(ds, cx, cy, rx, ry, stroke="black", fill="white");
	data &ds._temp;
		length line $1024;
		line='<ellipse';
		line=catt(line, ' cx="', &cx., '"');
		line=catt(line, ' cy="', &cy., '"');
		line=catt(line, ' rx="', &rx., '"');
		line=catt(line, ' ry="', &ry., '"');
		line=catt(line, ' stroke="', &stroke., '"');
		line=catt(line, ' fill="', &fill., '"');
		line=catt(line, ' />');
	run;

	data &ds.;
		set &ds. &ds._temp;
	run;

%mend svg_ellipse;

/**
*/
%macro svg_line(ds, x1, y1, x2, y2, stroke="black", strokewidth=2);
	data &ds._temp;
		length line $1024;
		line='<line';
		line=catt(line, ' x1="', &x1., '"');
		line=catt(line, ' x2="', &x2., '"');
		line=catt(line, ' y1="', &y1., '"');
		line=catt(line, ' y2="', &y2., '"');
		line=catt(line, ' stroke="', &stroke., '"');
		line=catt(line, ' stroke-width="', &strokewidth., '"');
		line=catt(line, ' />');
	run;

	data &ds.;
		set &ds. &ds._temp;
	run;

%mend svg_line;

/**
*/
%macro svg_rect(ds, x, y, width, height, stroke="black", fill = "white");
	data &ds._temp;
		length line $1024;
		line='<rect';
		line=catt(line, ' x="', &x., '"');
		line=catt(line, ' y="', &y., '"');
		line=catt(line, ' width="', &width., '"');
		line=catt(line, ' height="', &height., '"');
		line=catt(line, ' stroke="', &stroke., '"');
		line=catt(line, ' fill="', &fill., '"');
		line=catt(line, ' />');
	run;

	data &ds.;
		set &ds. &ds._temp;
	run;

%mend svg_line;

/**
*/
%macro svg_copy(ds, dsadd);
	data &ds._temp (keep = line);
		length line $1024;
		set &dsadd.;
	run;

	data &ds.;
		set &ds. &ds._temp;
	run;

%mend svg_line;

/**
*/
%macro svg_write(ds, svgfile);
	filename svg_file "&svgfile.";

	data _null_;
		set &ds.;
		file svg_file;
		put line;
	run;

	filename svg_file clear;
%mend svg_write;

%let ds1=new_svg;
%let svgfile=/home/post9/JSVG/file.svg;
%svg_init(&ds1.);
%svg_rect(&ds1., 50, 50, 100, 100);
%svg_line(&ds1., 50, 50, 150, 150);
%svg_ellipse(&ds1, 100, 100, 25, 25);
%svg_close(&ds1.);
%svg_write(&ds1., &svgfile.);

/** \endcond */