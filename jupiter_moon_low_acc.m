(* ::Package:: *)

(* ::Title:: *)
(*Jupiter Satellite Position*)


(* ::Section:: *)
(*Summary:*)


(* ::Text:: *)
(*The note book produces a "wavy-line" diagram of the four largest moons with respect to Jupiter as viewed from an input latitude and longitude on Earth.  Code is an application of the formulas given in Jean Meeus (1998). Astronomical Algorithms. Astronomical Algorithms book.*)
(**)
(*The plot is helpful for identifying the moon's when viewing Jupiter, or for determining potential, "interesting" viewing times.  (Conjunctions, transits, occultations) The formula's used for the calculations are low accuracy, and are not precises enough for calculating the exact times of the phenomena of the moons.*)
(**)
(*x: is measured positive to Jupiter's west.*)
(*y: axis is set parrelle to Jupiter's axis of rotation, with north positive.*)
(**)
(*Notebook sections*)
(**)
(*Functions: *)
(*Formulas to determine the positions of Earth, Jupiter, and the four largest Julian moons.*)
(**)
(*Inputs:*)
(*Date to start the calculations.*)
(*Viewing Latitude and longitude*)
(*Total number of calculations*)
(**)
(*Variables:*)
(*year: calender year*)
(*month: number 1 to 12, starting month of the calculations*)
(*day:  starting calender day*)
(*hour: 0 - 24, starting time,  0 is the default.*)
(*n: number of calculations*)
(**)
(*Notes:*)
(*The calculations are low accuracy method [1]*)
(*A table is built for each moon via calculating the each moon's position every four hours.*)
(**)
(**)
(*[1] Jean Meeus (1998). Astronomical Algorithms. Astronomical Algorithms, 2nd Edition (Willman-Bell Inc., Richmond, Virginia).*)
(**)


(* ::Section:: *)
(*Functions:*)


(* ::Text:: *)
(*Calculate Julian Date*)


(* ::Input:: *)
(*jd[y_,m_,d_,ut_]:=N[(Floor[365.25*(y+4716)]+Floor[30.6001*(m+1)]+d+(2-Floor[y/100]+Floor[Floor[y/100]/4])-1524.5)+ut/24,10]*)


(* ::Text:: *)
(*Calculate days since January 1, 2000*)


(* ::Input:: *)
(*dd[y_,m_,d_,ut_]:=With[{jd =  jd[y,m,d,ut]},jd- 2451545]*)


(* ::Text:: *)
(*Long period term in the motion of Jupitier*)


(* ::Input:: *)
(*v[y_,m_,d_,ut_]:=With[{ddd = dd[y,m,d,ut]},172.74 + 0.00111588 * ddd]*)


(* ::Text:: *)
(*Mean anomalies of Earth / Jupiter*)


(* ::Input:: *)
(*mm[y_,m_,d_,ut_]:=With[{ddd = dd[y,m,d,ut]},Mod[357.529 + 0.9856003*ddd,360]]*)
(*nn[y_,m_,d_,ut_]:=With[{ddd = dd[y,m,d,ut],vvv=v[y,m,d,ut]},Mod[20.020+ 0.0830853*ddd+.329*Sin[vvv Degree],360]]*)


(* ::Input:: *)
(*nn[y_,m_,d_,ut_]:=With[{ddd = dd[y,m,d,ut],vvv=v[y,m,d,ut]},20.020+ 0.0830853*ddd+.329*Sin[vvv Degree]]*)


(* ::Text:: *)
(*Difference between the mean heliocentric logitudes of Earth and Jupiter*)


(* ::Input:: *)
(*jj[y_,m_,d_,ut_]:=With[{ddd = dd[y,m,d,ut],vvv=v[y,m,d,ut]},Mod[66.115+ 0.9025179*ddd-.329*Sin[vvv],360]]*)


(* ::Text:: *)
(*Equations of the center of Earth and Jupiter in degrees*)


(* ::Input:: *)
(*aa[y_,m_,d_,ut_]:=With[{mmm = mm[y,m,d,ut]},1.915*Sin[mmm Degree]+0.02*2*Sin[mmm Degree]*Cos[mmm Degree]]*)
(*bb[y_,m_,d_,ut_]:=With[{nnn= nn[y,m,d,ut]},5.555*Sin[nnn Degree]+0.168*2*Sin[nnn Degree]*Cos[nnn Degree]]*)


(* ::Input:: *)
(*kk[y_,m_,d_,ut_]:=With[{jjj= jj[y,m,d,ut],aaa=aa[y,m,d,ut],bbb=bb[y,m,d,ut]},jjj+aaa-bbb]*)


(* ::Text:: *)
(*Radius vector of Earth*)


(* ::Input:: *)
(*re[y_,m_,d_,ut_]:=With[{mmm= mm[y,m,d,ut]},1.00014-0.01671*Cos[mmm Degree]-0.00014*(2*Cos[mmm Degree]^2-1)]*)


(* ::Text:: *)
(*Radius vector of Jupiter*)


(* ::Input:: *)
(*rj[y_,m_,d_,ut_]:=With[{nnn= nn[y,m,d,ut]},5.20872-0.25208*Cos[nnn Degree]-0.00611*(2*Cos[nnn Degree]^2-1)]*)


(* ::Text:: *)
(*Distance Earth to Jupiter.*)


(* ::Input:: *)
(*dist[y_,m_,d_,ut_]:=With[{ree= re[y,m,d,ut],rjj=rj[y,m,d,ut],kkk=kk[y,m,d,ut]},Sqrt[(ree^2+rjj^2-2*ree*rjj*Cos[kkk Degree])]]*)


(* ::Text:: *)
(*Phase angle of Jupiter (Earth - Jupiter - Sun)*)


(* ::Input:: *)
(*s\[Psi][y_,m_,d_,ut_]:=With[{ree= re[y,m,d,ut],distt=dist[y,m,d,ut],kkk=kk[y,m,d,ut]},(ree/distt)*Sin[kkk Degree]]*)


(* ::Input:: *)
(*\[Psi][y_,m_,d_,ut_]:=With[{ss\[Psi]= s\[Psi][y,m,d,ut]},ArcSin[ss\[Psi]]/Degree]*)


(* ::Text:: *)
(*Longitudes of the Central Meridian*)


(* ::Input:: *)
(*\[Omega]1[y_,m_,d_,ut_]:=With[{\[Psi]\[Psi]= \[Psi][y,m,d,ut],ddd=dd[y,m,d,ut],distt=dist[y,m,d,ut],bbb=bb[y,m,d,ut]},Mod[210.98+877.8169088*(ddd-distt/173)+\[Psi]\[Psi]-bbb,360]]*)


(* ::Input:: *)
(*\[Omega]2[y_,m_,d_,ut_]:=With[{\[Psi]\[Psi]= \[Psi][y,m,d,ut],ddd=dd[y,m,d,ut],distt=dist[y,m,d,ut],bbb=bb[y,m,d,ut]},Mod[187.23+870.1869088*(ddd-distt/173)+\[Psi]\[Psi]-bbb,360]]*)


(* ::Text:: *)
(*Jupiter's heliocentric Longitude*)


(* ::Input:: *)
(*\[Lambda][y_,m_,d_,ut_]:=With[{vv= v[y,m,d,ut],ddd=dd[y,m,d,ut],bbb=bb[y,m,d,ut]},Mod[34.35+0.083091*ddd+0.329*Sin[vv Degree]+bbb,360]]*)


(* ::Input:: *)
(*ds[y_,m_,d_,ut_]:=With[{\[Lambda]\[Lambda]= \[Lambda][y,m,d,ut]},Mod[3.12*Sin[(\[Lambda]\[Lambda]+42.8) Degree],360]]*)


(* ::Input:: *)
(*de[y_,m_,d_,ut_]:=With[{\[Lambda]\[Lambda]= \[Lambda][y,m,d,ut],\[Psi]\[Psi]= \[Psi][y,m,d,ut],rjj=rj[y,m,d,ut],distt=dist[y,m,d,ut],dss=ds[y,m,d,ut]},Mod[dss-2.22*Sin[\[Psi]\[Psi] Degree]*Cos[(\[Lambda]\[Lambda] + 22)Degree]-(1.3*(rjj-distt)/distt)*Sin[(\[Lambda]\[Lambda] -100.5)Degree],360]]*)


(* ::Text:: *)
(*Calculate moon's angle u measured to the inferior conjuction with Jupiter*)


(* ::Input:: *)
(*u1[y_,m_,d_,ut_]:=With[{\[Psi]\[Psi]= \[Psi][y,m,d,ut],ddd=dd[y,m,d,ut],distt=dist[y,m,d,ut],bbb=bb[y,m,d,ut]},Mod[163.8069+203.4058646*(ddd-distt/173)+\[Psi]\[Psi]-bbb,360]]*)


(* ::Input:: *)
(*u2[y_,m_,d_,ut_]:=With[{\[Psi]\[Psi]= \[Psi][y,m,d,ut],ddd=dd[y,m,d,ut],distt=dist[y,m,d,ut],bbb=bb[y,m,d,ut]},Mod[358.414+101.2916335*(ddd-distt/173)+\[Psi]\[Psi]-bbb,360]]*)


(* ::Input:: *)
(*u3[y_,m_,d_,ut_]:=With[{\[Psi]\[Psi]= \[Psi][y,m,d,ut],ddd=dd[y,m,d,ut],distt=dist[y,m,d,ut],bbb=bb[y,m,d,ut]},Mod[5.7176+50.2345180*(ddd-distt/173)+\[Psi]\[Psi]-bbb,360]]*)


(* ::Input:: *)
(*u4[y_,m_,d_,ut_]:=With[{\[Psi]\[Psi]= \[Psi][y,m,d,ut],ddd=dd[y,m,d,ut],distt=dist[y,m,d,ut],bbb=bb[y,m,d,ut]},Mod[224.8092+21.48798000*(ddd-distt/173)+\[Psi]\[Psi]-bbb,360]]*)


(* ::Input:: *)
(*gg[y_,m_,d_,ut_]:=With[{ddd=dd[y,m,d,ut],distt=dist[y,m,d,ut]},Mod[331.18+50.310482*(ddd-distt/173),360]]*)


(* ::Input:: *)
(*hh[y_,m_,d_,ut_]:=With[{ddd=dd[y,m,d,ut],distt=dist[y,m,d,ut]},Mod[87.45+21.569231*(ddd-distt/173),360]]*)


(* ::Input:: *)
(*cu1[y_,m_,d_,ut_]:=With[{u11=u1[y,m,d,ut],u22=u2[y,m,d,ut]},Mod[0.473*Sin[2*(u11-u22) Degree],360]-360]*)


(* ::Input:: *)
(*cu2[y_,m_,d_,ut_]:=With[{u22=u2[y,m,d,ut],u33=u3[y,m,d,ut]},Mod[1.065*Sin[2*(u22-u33) Degree],360]]*)


(* ::Input:: *)
(*cu3[y_,m_,d_,ut_]:=With[{ggg=gg[y,m,d,ut]},Mod[0.165*Sin[ggg  Degree],360]]*)


(* ::Input:: *)
(*cu4[y_,m_,d_,ut_]:=With[{hhh=hh[y,m,d,ut]},Mod[0.843*Sin[hhh  Degree],360]]*)


(* ::Input:: *)
(*uu1[y_,m_,d_,ut_]:=With[{u11=u1[y,m,d,ut],cu11=cu1[y,m,d,ut]},u11+cu11]*)


(* ::Input:: *)
(*uu2[y_,m_,d_,ut_]:=With[{u22=u2[y,m,d,ut],cu22=cu2[y,m,d,ut]},u22+cu22]*)


(* ::Input:: *)
(*uu3[y_,m_,d_,ut_]:=With[{u33=u3[y,m,d,ut],cu33=cu3[y,m,d,ut]},u33+cu33]*)


(* ::Input:: *)
(*uu4[y_,m_,d_,ut_]:=With[{u44=u4[y,m,d,ut],cu44=cu4[y,m,d,ut]},u44+cu44]*)


(* ::Text:: *)
(*Calculate the moon's radius to Jupieter*)


(* ::Input:: *)
(*r1[y_,m_,d_,ut_]:=With[{u11=u1[y,m,d,ut],u22=u2[y,m,d,ut]},Mod[5.9057-0.0244*Cos[2*(u11-u22) Degree],360]]*)


(* ::Input:: *)
(*r2[y_,m_,d_,ut_]:=With[{u22=u2[y,m,d,ut],u33=u3[y,m,d,ut]},Mod[9.3966-0.0244*Cos[2*(u22-u33) Degree],360]]*)


(* ::Input:: *)
(*r3[y_,m_,d_,ut_]:=With[{ggg=gg[y,m,d,ut]},Mod[14.9883-0.0216*Cos[ggg  Degree],360]]*)


(* ::Input:: *)
(*r4[y_,m_,d_,ut_]:=With[{hhh=hh[y,m,d,ut]},Mod[26.3627-0.1939*Cos[hhh  Degree],360]]*)


(* ::Text:: *)
(*Calcuate the apparent x, y coordinates using the radius r, and angle uu (with corrections)*)


(* ::Input:: *)
(*x1[y_,m_,d_,ut_]:=With[{r11=r1[y,m,d,ut],u11=u1[y,m,d,ut]},r11*Sin[u11 Degree]]*)


(* ::Input:: *)
(*x2[y_,m_,d_,ut_]:=With[{r22=r2[y,m,d,ut],u22=u2[y,m,d,ut]},r22*Sin[u22 Degree]]*)


(* ::Input:: *)
(*x3[y_,m_,d_,ut_]:=With[{r33=r3[y,m,d,ut],u33=u3[y,m,d,ut]},r33*Sin[u33 Degree]]*)


(* ::Input:: *)
(*x4[y_,m_,d_,ut_]:=With[{r44=r4[y,m,d,ut],u44=u4[y,m,d,ut]},r44*Sin[u44 Degree]]*)


(* ::Input:: *)
(*y1[y_,m_,d_,ut_]:=With[{r11=r1[y,m,d,ut],u11=u1[y,m,d,ut],dee=de[y,m,d,ut]},-r11*Cos[u11 Degree]*Sin[dee Degree]]*)


(* ::Input:: *)
(*y2[y_,m_,d_,ut_]:=With[{r22=r2[y,m,d,ut],u22=u2[y,m,d,ut],dee=de[y,m,d,ut]},-r22*Cos[u22 Degree]*Sin[dee Degree]]*)


(* ::Input:: *)
(*y3[y_,m_,d_,ut_]:=With[{r33=r3[y,m,d,ut],u33=u3[y,m,d,ut],dee=de[y,m,d,ut]},-r33*Cos[u33 Degree]*Sin[dee Degree]]*)


(* ::Input:: *)
(*y4[y_,m_,d_,ut_]:=With[{r44=r4[y,m,d,ut],u44=u4[y,m,d,ut],dee=de[y,m,d,ut]},-r44*Cos[u44 Degree]*Sin[dee Degree]]*)


(* ::Section:: *)
(*Inputs*)


(* ::Text:: *)
(*Replace the year, month, day, hour, and your latitude and longitude, as desired.*)
(**)
(*n is the number calculations,  a calcuations is made for each four hours.  ie..     4 hours * 6 * 30 = one month assuming 30 days / month*)


(* ::Input:: *)
(*year=2015;*)
(*month=9;*)
(*day=1;*)
(*hour=0/(60*60*24);*)
(*n=30*6;*)
(*lat=N[FromDMS[{42,26,33}]];*)
(*lon=N[FromDMS[{83,29,7}]];*)


(* ::Section:: *)
(*Code*)


(* ::Text:: *)
(*Create Empty list for results and date*)


(* ::Input:: *)
(*date={};moon1={};moon2={};moon3={};moon4={};*)


(* ::Input:: *)
(*Do[jday=jd[year,month,day,hour];*)
(**)
(*AppendTo[moon1,{x1[year,month,day,hour],jday}];*)
(*AppendTo[moon2,{x2[year,month,day,hour],jday}];*)
(*AppendTo[moon3,{x3[year,month,day,hour],jday}];*)
(*AppendTo[moon4,{x4[year,month,day,hour],jday}];*)
(*hour=hour+4;*)
(**)
(*,n]*)


(* ::Input:: *)
(*ListLinePlot[{moon1,moon2,moon3,moon4},PlotStyle->{Red,Green,Blue,Purple},PlotLegends->{"Io","Europa","Ganymede","Callisto"},AxesLabel->{"Dist (Equiatorial Radius)","Julian Date"}]*)
