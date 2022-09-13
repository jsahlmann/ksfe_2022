/**
\file spirale_square.sas
\brief Draws squared spirale
\details Draws squared spirale
\author Jörg Sahlmann
\date 2022-08-22
*/
/** \cond */
options mprint;

/**
*/
%macro spirale_square(ds, svgfile);
	data spirale (keep=batchline);
		retain offset x2 y2;
		offset=400;
		x2=offset;
		y2=offset;

		/* Number of segments */
		k=64;

		/* Calculation */
		do i=0 to k;
			r=2.5*i;
			x1=x2;
			y1=y2;
			dir_code=(i/4 - int(i/4))*4;

			if dir_code=0 then
				do;
					direction="right";
					x2=x1+r;
					y2=y1;
				end;
			else if dir_code=1 then
				do;
					direction="down";
					x2=x1;
					y2=y1+r;
				end;
			else if dir_code=2 then
				do;
					direction="left";
					x2=x1-r;
					y2=y1;
				end;
			else if dir_code=3 then
				do;
					direction="up";
					x2=x1;
					y2=y1-r;
				end;
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
%let svgfile=/home/post9/JSVG/spirale_square.svg;
%spirale_square(&ds1., &svgfile.);

/** \endcond */