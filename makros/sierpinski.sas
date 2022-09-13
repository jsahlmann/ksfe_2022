data ds;
	x1=200;
	y1=100;
	x2=800;
	y2=100;
	iter=0;
run;

%macro sierp_rep;
data ds (keep = iter x1 y1 x2 y2);
	set ds;
	xx1=x1;
	yy1=y1;
	xx2=x2;
	yy2=y2;
	fac=sqrt(3)/4;
	p1x=(x1+x2)/2;
	p1y=y1;
	p2x=x1+(x2-x1)/4;
	p2y=y1+(x2-x1)*fac;
	p3x=x1+3*(x2-x1)/4;
	p3y=p2y;
	* Dreieck 1 Basis P1P1';
	x1=xx1;
	y1=yy1;
	x2=p1x;
	y2=p1y;
	iter=iter+1;
	output;
	* Dreieck 2 Basis P1'P2;
	x1=p1x;
	y1=p1y;
	x2=xx2;
	y2=yy2;
	output;
	* Dreieck 3 Basis P3'P2';
	x1=p2x;
	y1=p2y;
	x2=p3x;
	y2=p3y;
	output;
run;
%mend sierp_rep;

%macro sierp_x3;
data dsx3;
  set ds;
  x3=(x1+x2)/2;
  y3=y1+(x2-x1)*sqrt(3)/2;
  y1 = 650 - y1;
  y2 = 650 - y2;
  y3 = 650 - y3;
  /*
  batchline=catt('%svg_ellipse(&ds.,', x1, ',', y1, ',', 10, ',', 10, ', stroke = "green");');
  output;
  batchline=catt('%svg_ellipse(&ds.,', x2, ',', y2, ',', 10, ',', 10, ', stroke = "blue");');
  output;
  batchline=catt('%svg_ellipse(&ds.,', x3, ',', y3, ',', 10, ',', 10, ', stroke = "red");');
  output;
  */
  batchline=catt('%svg_line(&ds.,', x1, ',', y1, ',', x2, ',', y2, ', stroke = "green");');
  output;
  batchline=catt('%svg_line(&ds.,', x2, ',', y2, ',', x3, ',', y3, ', stroke = "blue");');
  output;
  batchline=catt('%svg_line(&ds.,', x1, ',', y1, ',', x3, ',', y3, ', stroke = "red");');
  output;
run;
%mend sierp_x3;

%macro sierpinski(ds, svgfile);

	%svg_init(&ds., wpx=1000, hpx=1000);
	filename bat_file "/home/post9/JSVG/batch.sas";
	
	%sierp_rep;
	%sierp_rep;
	%sierp_rep;
	%sierp_rep;
	%sierp_rep;
	%sierp_x3;

	data batchlines;
		set dsx3;
		file bat_file;
		put batchline;
	run;

	%include bat_file;
	%svg_close(&ds.);
	%svg_write(&ds., &svgfile.);

%mend sierpinski;

%let ds1=new_svg;
%let svgfile=/home/post9/JSVG/sierpinski.svg;
%sierpinski(&ds1., &svgfile.);


