/**
\file spirae.sas
\brief Draws spirale
\details Draws spirale
\author Jörg Sahlmann
\date 2022-08-22
*/
/** \cond */
options mprint;

/**
*/
%macro spirale(ds, svgfile);
	data spirale (keep=batchline);
		retain offset x2 y2;
		offset=100;
		x2=offset;
		y2=offset;

		/* Number of segments */
		k=256;

		/* Number of segments for complete circle */
		dpt=32;

		/* Constant */
		pi=3.1415926;

		/* Calculation */
		do i=1 to k;
			phi=2 * pi / dpt * i;
			r=0.1 + 4 * i / dpt;
			x1=x2;
			y1=y2;
			x2=offset+cos(phi) * r;
			y2=offset+sin(phi) * r;
			batchline=catt('%svg_line(&ds.,', x1, ',', y1, ',', x2, ',', y2, ');');
			output;
		end;
	run;

	%svg_init(&ds., wpx=500, hpx=500);
	filename bat_file "/home/post9/JSVG/batch.sas";

	data batchlines;
		set spirale;
		file bat_file;
		put batchline;
	run;

	%include bat_file;
	%svg_close(&ds.);
	%svg_write(&ds., &svgfile.);
%mend spirale;

%let ds1=new_svg;
%let svgfile=/home/post9/JSVG/spirale.svg;
%spirale(&ds1., &svgfile.);

/** \endcond */