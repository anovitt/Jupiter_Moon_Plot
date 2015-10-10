(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 10.2' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1064,         20]
NotebookDataLength[     81899,       2060]
NotebookOptionsPosition[     79530,       1977]
NotebookOutlinePosition[     79873,       1992]
CellTagsIndexPosition[     79830,       1989]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Jupiter Satellite Position", "Title",
 CellChangeTimes->{{3.6306659173737445`*^9, 3.63066594037506*^9}, {
   3.653480403686584*^9, 3.653480407995593*^9}, {3.653481021895701*^9, 
   3.6534810241567044`*^9}, 3.6534814857038717`*^9}],

Cell[CellGroupData[{

Cell["Summary:", "Section",
 CellChangeTimes->{{3.6534801386727*^9, 3.6534801409237027`*^9}, {
  3.6534804132455997`*^9, 3.653480421834613*^9}}],

Cell[TextData[{
 "The note book produces a \[OpenCurlyDoubleQuote]wavy-line\
\[CloseCurlyDoubleQuote] diagram of the four largest moons with respect to \
Jupiter as viewed from an input latitude and longitude on Earth.  Code is an \
application of the formulas given in Jean Meeus (1998). Astronomical \
Algorithms. Astronomical Algorithms book.\n\nThe plot is helpful for \
identifying the moon\[CloseCurlyQuote]s when viewing Jupiter, or for \
determining potential, \[OpenCurlyDoubleQuote]interesting\
\[CloseCurlyDoubleQuote] viewing times.  (Conjunctions, transits, \
occultations) The formula\[CloseCurlyQuote]s used for the calculations are \
low accuracy, and are not precises enough for calculating the exact times of \
the phenomena of the moons.\n\nx: is measured positive to Jupiter\
\[CloseCurlyQuote]s west.\ny: axis is set parrelle to Jupiter\
\[CloseCurlyQuote]s axis of rotation, with north positive.\n\n",
 StyleBox["Notebook sections",
  FontWeight->"Bold",
  FontVariations->{"Underline"->True}],
 "\n\n",
 StyleBox["Functions: ",
  FontWeight->"Bold"],
 "\nFormulas to determine the positions of Earth, Jupiter, and the four \
largest Julian moons.\n\n",
 StyleBox["Inputs:",
  FontWeight->"Bold"],
 "\nDate to start the calculations.\nViewing Latitude and longitude\nTotal \
number of calculations\n\n",
 StyleBox["Variables:",
  FontWeight->"Bold"],
 "\n",
 StyleBox["year",
  FontSlant->"Italic"],
 ": calender year\n",
 StyleBox["month",
  FontSlant->"Italic"],
 ": number 1 to 12, starting month of the calculations\n",
 StyleBox["day",
  FontSlant->"Italic"],
 ":  starting calender day\n",
 StyleBox["hour",
  FontSlant->"Italic"],
 ": 0 - 24, starting time,  0 is the default.\n",
 StyleBox["n",
  FontSlant->"Italic"],
 ": number of calculations\n\n",
 StyleBox["Notes:",
  FontWeight->"Bold"],
 "\nThe calculations are low accuracy method [1]\nA table is built for each \
moon via calculating the each moon\[CloseCurlyQuote]s position every four \
hours.\n\n\n[1] Jean Meeus (1998). Astronomical Algorithms. Astronomical \
Algorithms, 2nd Edition (Willman-Bell Inc., Richmond, Virginia).\n"
}], "Text",
 CellChangeTimes->{{3.653480509434744*^9, 3.6534805479348016`*^9}, {
   3.653480692774016*^9, 3.653480794861183*^9}, {3.653480825611231*^9, 
   3.6534808821503124`*^9}, {3.653480928054431*^9, 3.653481012900655*^9}, 
   3.6534812208693156`*^9, 3.653481265347392*^9, {3.653481385494723*^9, 
   3.6534815473529882`*^9}, {3.653481604261073*^9, 3.6534816107650824`*^9}, {
   3.653481707192241*^9, 3.6534817459652967`*^9}, {3.6534817771703415`*^9, 
   3.653481893432512*^9}, {3.653482028008726*^9, 3.6534822226130495`*^9}, {
   3.6534822786511307`*^9, 3.6534823501202383`*^9}, {3.6534827678700285`*^9, 
   3.6534828246151147`*^9}, {3.653482869537179*^9, 3.653482871449182*^9}, {
   3.653482958618329*^9, 3.6534829893833895`*^9}, 3.653483055104495*^9, {
   3.653483180710676*^9, 3.653483299859857*^9}, {3.6534833364119754`*^9, 
   3.6534833614320135`*^9}, {3.6534833956830683`*^9, 3.653483475348195*^9}, {
   3.653483612661394*^9, 3.653483674139493*^9}, {3.653484002953213*^9, 
   3.653484065186307*^9}}]
}, Open  ]],

Cell[CellGroupData[{

Cell["Functions:", "Section",
 CellChangeTimes->{{3.6493244193274813`*^9, 3.649324422307485*^9}, {
   3.6534662358216715`*^9, 3.653466239144477*^9}, 3.6534801443287077`*^9}],

Cell["Calculate Julian Date", "Text",
 CellChangeTimes->{{3.653479657448204*^9, 3.6534796731472263`*^9}, 
   3.653480064067319*^9, 3.6534805057347383`*^9, 3.653481611985084*^9}],

Cell[BoxData[
 RowBox[{
  RowBox[{"jd", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"N", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"Floor", "[", 
        RowBox[{"365.25", "*", 
         RowBox[{"(", 
          RowBox[{"y", "+", "4716"}], ")"}]}], "]"}], "+", 
       RowBox[{"Floor", "[", 
        RowBox[{"30.6001", "*", 
         RowBox[{"(", 
          RowBox[{"m", "+", "1"}], ")"}]}], "]"}], "+", "d", "+", 
       RowBox[{"(", 
        RowBox[{"2", "-", 
         RowBox[{"Floor", "[", 
          RowBox[{"y", "/", "100"}], "]"}], "+", 
         RowBox[{"Floor", "[", 
          RowBox[{
           RowBox[{"Floor", "[", 
            RowBox[{"y", "/", "100"}], "]"}], "/", "4"}], "]"}]}], ")"}], "-",
        "1524.5"}], ")"}], "+", 
     RowBox[{"ut", "/", "24"}]}], ",", "10"}], "]"}]}]], "Input"],

Cell["Calculate days since January 1, 2000", "Text",
 CellChangeTimes->{{3.649324612206792*^9, 3.649324626912815*^9}, {
  3.6534803750725155`*^9, 3.6534803819275494`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"dd", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"jd", " ", "=", "  ", 
      RowBox[{"jd", "[", 
       RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], "}"}], ",", 
    RowBox[{"jd", "-", " ", "2451545"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493245681397204`*^9, 3.6493245962737684`*^9}, {
   3.649326294776291*^9, 3.6493263373487654`*^9}, 3.6493264477501593`*^9}],

Cell["Long period term in the motion of Jupitier", "Text",
 CellChangeTimes->{{3.653483725497595*^9, 3.6534837385086145`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"v", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"ddd", " ", "=", " ", 
      RowBox[{"dd", "[", 
       RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], "}"}], ",", 
    RowBox[{"172.74", " ", "+", " ", 
     RowBox[{"0.00111588", " ", "*", " ", "ddd"}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493246827209024`*^9, 3.649324684111904*^9}, {
  3.6493248537221756`*^9, 3.6493249181172705`*^9}, {3.649326375880833*^9, 
  3.6493264612597833`*^9}}],

Cell["Mean anomalies of Earth / Jupiter", "Text",
 CellChangeTimes->{{3.6493251191185856`*^9, 3.649325129859601*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"mm", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"ddd", " ", "=", " ", 
      RowBox[{"dd", "[", 
       RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"357.529", " ", "+", " ", 
       RowBox[{"0.9856003", "*", "ddd"}]}], ",", "360"}], "]"}]}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"nn", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"ddd", " ", "=", " ", 
       RowBox[{"dd", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"vvv", "=", 
       RowBox[{"v", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"20.020", "+", " ", 
       RowBox[{"0.0830853", "*", "ddd"}], "+", 
       RowBox[{".329", "*", 
        RowBox[{"Sin", "[", 
         RowBox[{"vvv", " ", "Degree"}], "]"}]}]}], ",", "360"}], "]"}]}], 
   "]"}]}]}], "Input",
 CellChangeTimes->{{3.6493249406063085`*^9, 3.6493249916183925`*^9}, {
  3.649325037918463*^9, 3.6493251046275654`*^9}, {3.6493266980122037`*^9, 
  3.649326776839142*^9}, {3.649326813951607*^9, 3.6493268854163327`*^9}, {
  3.649326920999995*^9, 3.6493269250872025`*^9}, {3.6493272280865517`*^9, 
  3.6493272362885647`*^9}, {3.6493319209163103`*^9, 3.649331922328313*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"nn", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"ddd", " ", "=", " ", 
       RowBox[{"dd", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"vvv", "=", 
       RowBox[{"v", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"20.020", "+", " ", 
     RowBox[{"0.0830853", "*", "ddd"}], "+", 
     RowBox[{".329", "*", 
      RowBox[{"Sin", "[", 
       RowBox[{"vvv", " ", "Degree"}], "]"}]}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493278586195097`*^9, 3.6493278619995146`*^9}, {
  3.6493319410273438`*^9, 3.649331942319347*^9}}],

Cell["\<\
Difference between the mean heliocentric logitudes of Earth and Jupiter\
\>", "Text",
 CellChangeTimes->{{3.6534839696241465`*^9, 3.653483993563197*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"jj", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"ddd", " ", "=", " ", 
       RowBox[{"dd", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"vvv", "=", 
       RowBox[{"v", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"66.115", "+", " ", 
       RowBox[{"0.9025179", "*", "ddd"}], "-", 
       RowBox[{".329", "*", 
        RowBox[{"Sin", "[", "vvv", "]"}]}]}], ",", "360"}], "]"}]}], 
   "]"}]}]], "Input",
 CellChangeTimes->{{3.649326964196471*^9, 3.6493269952405257`*^9}, {
  3.649327039076603*^9, 3.649327063163045*^9}}],

Cell["Equations of the center of Earth and Jupiter in degrees", "Text",
 CellChangeTimes->{{3.6534841142033796`*^9, 3.6534841292394032`*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"aa", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"mmm", " ", "=", " ", 
      RowBox[{"mm", "[", 
       RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"1.915", "*", 
      RowBox[{"Sin", "[", 
       RowBox[{"mmm", " ", "Degree"}], "]"}]}], "+", 
     RowBox[{"0.02", "*", "2", "*", 
      RowBox[{"Sin", "[", 
       RowBox[{"mmm", " ", "Degree"}], "]"}], "*", 
      RowBox[{"Cos", "[", 
       RowBox[{"mmm", " ", "Degree"}], "]"}]}]}]}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"bb", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"nnn", "=", " ", 
      RowBox[{"nn", "[", 
       RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"5.555", "*", 
      RowBox[{"Sin", "[", 
       RowBox[{"nnn", " ", "Degree"}], "]"}]}], "+", 
     RowBox[{"0.168", "*", "2", "*", 
      RowBox[{"Sin", "[", 
       RowBox[{"nnn", " ", "Degree"}], "]"}], "*", 
      RowBox[{"Cos", "[", 
       RowBox[{"nnn", " ", "Degree"}], "]"}]}]}]}], "]"}]}]}], "Input",
 CellChangeTimes->{{3.6493272799496336`*^9, 3.6493273665707674`*^9}, {
  3.649327412730835*^9, 3.6493274850959435`*^9}, {3.649327525954005*^9, 
  3.6493275319390144`*^9}, {3.649328878948512*^9, 3.6493289043895535`*^9}, {
  3.6493296595216837`*^9, 3.6493296649816933`*^9}, {3.649331956633368*^9, 
  3.649331989135419*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"kk", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"jjj", "=", " ", 
       RowBox[{"jj", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"aaa", "=", 
       RowBox[{"aa", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"bbb", "=", 
       RowBox[{"bb", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"jjj", "+", "aaa", "-", "bbb"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.649329605232588*^9, 3.6493296170730085`*^9}, {
  3.649329696805749*^9, 3.6493297532934484`*^9}}],

Cell["Radius vector of Earth", "Text",
 CellChangeTimes->{{3.6534841436284246`*^9, 3.6534841481734314`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"re", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"mmm", "=", " ", 
      RowBox[{"mm", "[", 
       RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], "}"}], ",", 
    RowBox[{"1.00014", "-", 
     RowBox[{"0.01671", "*", 
      RowBox[{"Cos", "[", 
       RowBox[{"mmm", " ", "Degree"}], "]"}]}], "-", 
     RowBox[{"0.00014", "*", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"2", "*", 
         RowBox[{
          RowBox[{"Cos", "[", 
           RowBox[{"mmm", " ", "Degree"}], "]"}], "^", "2"}]}], "-", "1"}], 
       ")"}]}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493303250344524`*^9, 3.6493303524905005`*^9}, {
   3.6493309979165916`*^9, 3.6493310779859*^9}, 3.649331134893742*^9, {
   3.6493319931854243`*^9, 3.64933200080344*^9}}],

Cell["Radius vector of Jupiter", "Text",
 CellChangeTimes->{{3.6534841552884417`*^9, 3.6534841620714517`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"rj", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"nnn", "=", " ", 
      RowBox[{"nn", "[", 
       RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], "}"}], ",", 
    RowBox[{"5.20872", "-", 
     RowBox[{"0.25208", "*", 
      RowBox[{"Cos", "[", 
       RowBox[{"nnn", " ", "Degree"}], "]"}]}], "-", 
     RowBox[{"0.00611", "*", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"2", "*", 
         RowBox[{
          RowBox[{"Cos", "[", 
           RowBox[{"nnn", " ", "Degree"}], "]"}], "^", "2"}]}], "-", "1"}], 
       ")"}]}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.649331145086325*^9, 3.6493311960401363`*^9}, {
  3.6493320044554462`*^9, 3.6493320109074564`*^9}}],

Cell["Distance Earth to Jupiter.", "Text",
 CellChangeTimes->{{3.6534841775354753`*^9, 3.653484189922493*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"dist", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"ree", "=", " ", 
       RowBox[{"re", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"rjj", "=", 
       RowBox[{"rj", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"kkk", "=", 
       RowBox[{"kk", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Sqrt", "[", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"ree", "^", "2"}], "+", 
       RowBox[{"rjj", "^", "2"}], "-", 
       RowBox[{"2", "*", "ree", "*", "rjj", "*", 
        RowBox[{"Cos", "[", 
         RowBox[{"kkk", " ", "Degree"}], "]"}]}]}], ")"}], "]"}]}], 
   "]"}]}]], "Input",
 CellChangeTimes->{{3.649331282556602*^9, 3.649331385397414*^9}, {
  3.6493314165314665`*^9, 3.6493314239684815`*^9}, {3.6493314545375333`*^9, 
  3.6493314581905394`*^9}, {3.649332015279464*^9, 3.649332016589466*^9}}],

Cell["Phase angle of Jupiter (Earth - Jupiter - Sun)", "Text",
 CellChangeTimes->{{3.653484216943533*^9, 3.653484241714571*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"s\[Psi]", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"ree", "=", " ", 
       RowBox[{"re", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"distt", "=", 
       RowBox[{"dist", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"kkk", "=", 
       RowBox[{"kk", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{"ree", "/", "distt"}], ")"}], "*", 
     RowBox[{"Sin", "[", 
      RowBox[{"kkk", " ", "Degree"}], "]"}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.649332118690634*^9, 3.6493321970427494`*^9}, {
  3.6493322575848446`*^9, 3.6493322616468515`*^9}, {3.649332723710574*^9, 
  3.649332724460575*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"\[Psi]", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"ss\[Psi]", "=", " ", 
      RowBox[{"s\[Psi]", "[", 
       RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"ArcSin", "[", "ss\[Psi]", "]"}], "/", "Degree"}]}], 
   "]"}]}]], "Input",
 CellChangeTimes->{{3.6493323131829314`*^9, 3.64933238073304*^9}}],

Cell["Longitudes of the Central Meridian", "Text",
 CellChangeTimes->{{3.653484270924614*^9, 3.653484283245633*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"\[Omega]1", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Psi]\[Psi]", "=", " ", 
       RowBox[{"\[Psi]", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"ddd", "=", 
       RowBox[{"dd", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"distt", "=", 
       RowBox[{"dist", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"bbb", "=", 
       RowBox[{"bb", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"210.98", "+", 
       RowBox[{"877.8169088", "*", 
        RowBox[{"(", 
         RowBox[{"ddd", "-", 
          RowBox[{"distt", "/", "173"}]}], ")"}]}], "+", "\[Psi]\[Psi]", "-", 
       "bbb"}], ",", "360"}], "]"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493326360594406`*^9, 3.649332711637557*^9}, {
  3.6493327455076127`*^9, 3.6493327772226667`*^9}, {3.649332828785773*^9, 
  3.6493328836838617`*^9}, {3.649332955721972*^9, 3.6493329562119727`*^9}, {
  3.649332990041023*^9, 3.649332997814035*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"\[Omega]2", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Psi]\[Psi]", "=", " ", 
       RowBox[{"\[Psi]", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"ddd", "=", 
       RowBox[{"dd", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"distt", "=", 
       RowBox[{"dist", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"bbb", "=", 
       RowBox[{"bb", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"187.23", "+", 
       RowBox[{"870.1869088", "*", 
        RowBox[{"(", 
         RowBox[{"ddd", "-", 
          RowBox[{"distt", "/", "173"}]}], ")"}]}], "+", "\[Psi]\[Psi]", "-", 
       "bbb"}], ",", "360"}], "]"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493330240730767`*^9, 3.6493330478371115`*^9}}],

Cell["Jupiter\[CloseCurlyQuote]s heliocentric Longitude", "Text",
 CellChangeTimes->{{3.6534843003036575`*^9, 3.6534843149966803`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"\[Lambda]", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"vv", "=", " ", 
       RowBox[{"v", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"ddd", "=", 
       RowBox[{"dd", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"bbb", "=", 
       RowBox[{"bb", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"34.35", "+", 
       RowBox[{"0.083091", "*", "ddd"}], "+", 
       RowBox[{"0.329", "*", 
        RowBox[{"Sin", "[", 
         RowBox[{"vv", " ", "Degree"}], "]"}]}], "+", "bbb"}], ",", "360"}], 
     "]"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493331800433426`*^9, 3.6493332843365126`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"ds", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"\[Lambda]\[Lambda]", "=", " ", 
      RowBox[{"\[Lambda]", "[", 
       RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"3.12", "*", 
       RowBox[{"Sin", "[", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"\[Lambda]\[Lambda]", "+", "42.8"}], ")"}], " ", "Degree"}],
         "]"}]}], ",", "360"}], "]"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493336944454083`*^9, 3.649333755042303*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"de", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Lambda]\[Lambda]", "=", " ", 
       RowBox[{"\[Lambda]", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"\[Psi]\[Psi]", "=", " ", 
       RowBox[{"\[Psi]", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"rjj", "=", 
       RowBox[{"rj", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"distt", "=", 
       RowBox[{"dist", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"dss", "=", 
       RowBox[{"ds", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"dss", "-", 
       RowBox[{"2.22", "*", 
        RowBox[{"Sin", "[", 
         RowBox[{"\[Psi]\[Psi]", " ", "Degree"}], "]"}], "*", 
        RowBox[{"Cos", "[", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Lambda]\[Lambda]", " ", "+", " ", "22"}], ")"}], 
          "Degree"}], "]"}]}], "-", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1.3", "*", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"rjj", "-", "distt"}], ")"}], "/", "distt"}]}], ")"}], 
        "*", 
        RowBox[{"Sin", "[", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Lambda]\[Lambda]", " ", "-", "100.5"}], ")"}], 
          "Degree"}], "]"}]}]}], ",", "360"}], "]"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493338747319355`*^9, 3.6493340719019413`*^9}}],

Cell["\<\
Calculate moon\[CloseCurlyQuote]s angle u measured to the inferior conjuction \
with Jupiter\
\>", "Text",
 CellChangeTimes->{{3.6534843630527496`*^9, 3.6534843933057933`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"u1", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Psi]\[Psi]", "=", " ", 
       RowBox[{"\[Psi]", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"ddd", "=", 
       RowBox[{"dd", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"distt", "=", 
       RowBox[{"dist", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"bbb", "=", 
       RowBox[{"bb", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"163.8069", "+", 
       RowBox[{"203.4058646", "*", 
        RowBox[{"(", 
         RowBox[{"ddd", "-", 
          RowBox[{"distt", "/", "173"}]}], ")"}]}], "+", "\[Psi]\[Psi]", "-", 
       "bbb"}], ",", "360"}], "]"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493346889681206`*^9, 3.649334756797385*^9}, {
  3.6493347979474688`*^9, 3.6493349012116413`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"u2", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Psi]\[Psi]", "=", " ", 
       RowBox[{"\[Psi]", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"ddd", "=", 
       RowBox[{"dd", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"distt", "=", 
       RowBox[{"dist", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"bbb", "=", 
       RowBox[{"bb", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"358.414", "+", 
       RowBox[{"101.2916335", "*", 
        RowBox[{"(", 
         RowBox[{"ddd", "-", 
          RowBox[{"distt", "/", "173"}]}], ")"}]}], "+", "\[Psi]\[Psi]", "-", 
       "bbb"}], ",", "360"}], "]"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.649334950507724*^9, 3.649334975597764*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"u3", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Psi]\[Psi]", "=", " ", 
       RowBox[{"\[Psi]", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"ddd", "=", 
       RowBox[{"dd", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"distt", "=", 
       RowBox[{"dist", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"bbb", "=", 
       RowBox[{"bb", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"5.7176", "+", 
       RowBox[{"50.2345180", "*", 
        RowBox[{"(", 
         RowBox[{"ddd", "-", 
          RowBox[{"distt", "/", "173"}]}], ")"}]}], "+", "\[Psi]\[Psi]", "-", 
       "bbb"}], ",", "360"}], "]"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.649334990262787*^9, 3.649335015392828*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"u4", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"\[Psi]\[Psi]", "=", " ", 
       RowBox[{"\[Psi]", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"ddd", "=", 
       RowBox[{"dd", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"distt", "=", 
       RowBox[{"dist", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"bbb", "=", 
       RowBox[{"bb", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"224.8092", "+", 
       RowBox[{"21.48798000", "*", 
        RowBox[{"(", 
         RowBox[{"ddd", "-", 
          RowBox[{"distt", "/", "173"}]}], ")"}]}], "+", "\[Psi]\[Psi]", "-", 
       "bbb"}], ",", "360"}], "]"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493350288968477`*^9, 3.649335049466881*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"gg", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"ddd", "=", 
       RowBox[{"dd", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"distt", "=", 
       RowBox[{"dist", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"331.18", "+", 
       RowBox[{"50.310482", "*", 
        RowBox[{"(", 
         RowBox[{"ddd", "-", 
          RowBox[{"distt", "/", "173"}]}], ")"}]}]}], ",", "360"}], "]"}]}], 
   "]"}]}]], "Input",
 CellChangeTimes->{{3.6493351314250097`*^9, 3.649335187712095*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"hh", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"ddd", "=", 
       RowBox[{"dd", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"distt", "=", 
       RowBox[{"dist", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"87.45", "+", 
       RowBox[{"21.569231", "*", 
        RowBox[{"(", 
         RowBox[{"ddd", "-", 
          RowBox[{"distt", "/", "173"}]}], ")"}]}]}], ",", "360"}], "]"}]}], 
   "]"}]}]], "Input",
 CellChangeTimes->{{3.649335201698119*^9, 3.6493352292871594`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"cu1", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"u11", "=", 
       RowBox[{"u1", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"u22", "=", 
       RowBox[{"u2", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"Mod", "[", 
      RowBox[{
       RowBox[{"0.473", "*", 
        RowBox[{"Sin", "[", 
         RowBox[{"2", "*", 
          RowBox[{"(", 
           RowBox[{"u11", "-", "u22"}], ")"}], " ", "Degree"}], "]"}]}], ",", 
       "360"}], "]"}], "-", "360"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493353829833994`*^9, 3.649335448302495*^9}, {
  3.649335743307969*^9, 3.6493357448389716`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"cu2", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"u22", "=", 
       RowBox[{"u2", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"u33", "=", 
       RowBox[{"u3", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"1.065", "*", 
       RowBox[{"Sin", "[", 
        RowBox[{"2", "*", 
         RowBox[{"(", 
          RowBox[{"u22", "-", "u33"}], ")"}], " ", "Degree"}], "]"}]}], ",", 
      "360"}], "]"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493355563346815`*^9, 3.6493356072547607`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"cu3", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"ggg", "=", 
      RowBox[{"gg", "[", 
       RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"0.165", "*", 
       RowBox[{"Sin", "[", 
        RowBox[{"ggg", "  ", "Degree"}], "]"}]}], ",", "360"}], "]"}]}], 
   "]"}]}]], "Input",
 CellChangeTimes->{{3.649335638310812*^9, 3.6493356687768574`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"cu4", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"hhh", "=", 
      RowBox[{"hh", "[", 
       RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"0.843", "*", 
       RowBox[{"Sin", "[", 
        RowBox[{"hhh", "  ", "Degree"}], "]"}]}], ",", "360"}], "]"}]}], 
   "]"}]}]], "Input",
 CellChangeTimes->{{3.649335679218872*^9, 3.6493356990459023`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"uu1", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"u11", "=", 
       RowBox[{"u1", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"cu11", "=", 
       RowBox[{"cu1", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"u11", "+", "cu11"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.649335783381031*^9, 3.649335810117071*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"uu2", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"u22", "=", 
       RowBox[{"u2", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"cu22", "=", 
       RowBox[{"cu2", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"u22", "+", "cu22"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493358207280855`*^9, 3.6493358344101048`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"uu3", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"u33", "=", 
       RowBox[{"u3", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"cu33", "=", 
       RowBox[{"cu3", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"u33", "+", "cu33"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493358432451196`*^9, 3.649335858851144*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"uu4", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"u44", "=", 
       RowBox[{"u4", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"cu44", "=", 
       RowBox[{"cu4", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"u44", "+", "cu44"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.649335868804159*^9, 3.6493358854021864`*^9}}],

Cell["Calculate the moon\[CloseCurlyQuote]s radius to Jupieter", "Text",
 CellChangeTimes->{{3.6534844210928335`*^9, 3.653484433581851*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"r1", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"u11", "=", 
       RowBox[{"u1", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"u22", "=", 
       RowBox[{"u2", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"5.9057", "-", 
       RowBox[{"0.0244", "*", 
        RowBox[{"Cos", "[", 
         RowBox[{"2", "*", 
          RowBox[{"(", 
           RowBox[{"u11", "-", "u22"}], ")"}], " ", "Degree"}], "]"}]}]}], 
      ",", "360"}], "]"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.649336242906757*^9, 3.6493362829238195`*^9}, 
   3.649336372542964*^9}],

Cell[BoxData[
 RowBox[{
  RowBox[{"r2", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"u22", "=", 
       RowBox[{"u2", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"u33", "=", 
       RowBox[{"u3", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"9.3966", "-", 
       RowBox[{"0.0244", "*", 
        RowBox[{"Cos", "[", 
         RowBox[{"2", "*", 
          RowBox[{"(", 
           RowBox[{"u22", "-", "u33"}], ")"}], " ", "Degree"}], "]"}]}]}], 
      ",", "360"}], "]"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493363890109897`*^9, 3.649336420760038*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"r3", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"ggg", "=", 
      RowBox[{"gg", "[", 
       RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"14.9883", "-", 
       RowBox[{"0.0216", "*", 
        RowBox[{"Cos", "[", 
         RowBox[{"ggg", "  ", "Degree"}], "]"}]}]}], ",", "360"}], "]"}]}], 
   "]"}]}]], "Input",
 CellChangeTimes->{{3.6493364389440646`*^9, 3.6493364669001055`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"r4", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"hhh", "=", 
      RowBox[{"hh", "[", 
       RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], "}"}], ",", 
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{"26.3627", "-", 
       RowBox[{"0.1939", "*", 
        RowBox[{"Cos", "[", 
         RowBox[{"hhh", "  ", "Degree"}], "]"}]}]}], ",", "360"}], "]"}]}], 
   "]"}]}]], "Input",
 CellChangeTimes->{{3.64933647542412*^9, 3.6493365092541695`*^9}}],

Cell["\<\
Calcuate the apparent x, y coordinates using the radius r, and angle uu (with \
corrections)\
\>", "Text",
 CellChangeTimes->{{3.6534844474858713`*^9, 3.6534844897929378`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"x1", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"r11", "=", 
       RowBox[{"r1", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"u11", "=", 
       RowBox[{"u1", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"r11", "*", 
     RowBox[{"Sin", "[", 
      RowBox[{"u11", " ", "Degree"}], "]"}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.649336836395694*^9, 3.6493369004797926`*^9}, {
  3.649336958183879*^9, 3.6493369622758856`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"x2", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"r22", "=", 
       RowBox[{"r2", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"u22", "=", 
       RowBox[{"u2", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"r22", "*", 
     RowBox[{"Sin", "[", 
      RowBox[{"u22", " ", "Degree"}], "]"}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.649337044376011*^9, 3.6493370650460443`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"x3", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"r33", "=", 
       RowBox[{"r3", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"u33", "=", 
       RowBox[{"u3", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"r33", "*", 
     RowBox[{"Sin", "[", 
      RowBox[{"u33", " ", "Degree"}], "]"}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493370460670137`*^9, 3.649337078540064*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"x4", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"r44", "=", 
       RowBox[{"r4", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"u44", "=", 
       RowBox[{"u4", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{"r44", "*", 
     RowBox[{"Sin", "[", 
      RowBox[{"u44", " ", "Degree"}], "]"}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{
  3.6493370474570155`*^9, {3.6493370823800697`*^9, 3.6493370922330847`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"y1", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"r11", "=", 
       RowBox[{"r1", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"u11", "=", 
       RowBox[{"u1", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"dee", "=", 
       RowBox[{"de", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"-", "r11"}], "*", 
     RowBox[{"Cos", "[", 
      RowBox[{"u11", " ", "Degree"}], "]"}], "*", 
     RowBox[{"Sin", "[", 
      RowBox[{"dee", " ", "Degree"}], "]"}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.649337134106159*^9, 3.649337185870237*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"y2", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"r22", "=", 
       RowBox[{"r2", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"u22", "=", 
       RowBox[{"u2", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"dee", "=", 
       RowBox[{"de", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"-", "r22"}], "*", 
     RowBox[{"Cos", "[", 
      RowBox[{"u22", " ", "Degree"}], "]"}], "*", 
     RowBox[{"Sin", "[", 
      RowBox[{"dee", " ", "Degree"}], "]"}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.6493372285693083`*^9, 3.649337249877341*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"y3", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"r33", "=", 
       RowBox[{"r3", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"u33", "=", 
       RowBox[{"u3", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"dee", "=", 
       RowBox[{"de", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"-", "r33"}], "*", 
     RowBox[{"Cos", "[", 
      RowBox[{"u33", " ", "Degree"}], "]"}], "*", 
     RowBox[{"Sin", "[", 
      RowBox[{"dee", " ", "Degree"}], "]"}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.649337230559311*^9, 3.6493372731393814`*^9}, {
  3.6493373490735025`*^9, 3.6493373551365128`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"y4", "[", 
   RowBox[{"y_", ",", "m_", ",", "d_", ",", "ut_"}], "]"}], ":=", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"r44", "=", 
       RowBox[{"r4", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"u44", "=", 
       RowBox[{"u4", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}], ",", 
      RowBox[{"dee", "=", 
       RowBox[{"de", "[", 
        RowBox[{"y", ",", "m", ",", "d", ",", "ut"}], "]"}]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"-", "r44"}], "*", 
     RowBox[{"Cos", "[", 
      RowBox[{"u44", " ", "Degree"}], "]"}], "*", 
     RowBox[{"Sin", "[", 
      RowBox[{"dee", " ", "Degree"}], "]"}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{
  3.6493372352103176`*^9, {3.6493372789223905`*^9, 3.649337287554403*^9}, {
   3.6493373460424986`*^9, 3.6493373478225007`*^9}}]
}, Open  ]],

Cell[CellGroupData[{

Cell["Inputs", "Section",
 CellChangeTimes->{{3.6306661000771947`*^9, 3.630666103581395*^9}}],

Cell["\<\
Replace the year, month, day, hour, and your latitude and longitude, as \
desired.

n is the number calculations,  a calcuations is made for each four hours.  \
ie..     4 hours * 6 * 30 = one month assuming 30 days / month\
\>", "Text",
 CellChangeTimes->{{3.6534845119179754`*^9, 3.653484632595166*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"year", "=", "2015"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"month", "=", "9"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"day", "=", "1"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"hour", "=", 
   RowBox[{"0", "/", 
    RowBox[{"(", 
     RowBox[{"60", "*", "60", "*", "24"}], ")"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"n", "=", 
   RowBox[{"30", "*", "6"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"lat", "=", 
   RowBox[{"N", "[", 
    RowBox[{"FromDMS", "[", 
     RowBox[{"{", 
      RowBox[{"42", ",", "26", ",", "33"}], "}"}], "]"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"lon", "=", 
   RowBox[{"N", "[", 
    RowBox[{"FromDMS", "[", 
     RowBox[{"{", 
      RowBox[{"83", ",", "29", ",", "7"}], "}"}], "]"}], "]"}]}], 
  ";"}]}], "Input",
 CellChangeTimes->{{3.630667406703929*^9, 3.6306674450531225`*^9}, {
   3.630667836771528*^9, 3.630667851834389*^9}, {3.6306683952634716`*^9, 
   3.630668397222584*^9}, 3.6306684319675713`*^9, {3.6306691180508127`*^9, 
   3.6306691344107485`*^9}, {3.631183283766692*^9, 3.6311832923981857`*^9}, {
   3.6339883260717106`*^9, 3.6339883267197475`*^9}, {3.6402523181419005`*^9, 
   3.640252332634326*^9}, {3.6402524457189245`*^9, 3.6402524460309253`*^9}, {
   3.64932399639182*^9, 3.6493240156988497`*^9}, {3.649337759649017*^9, 
   3.6493377681500287`*^9}, 3.650443437266984*^9, {3.650444862967873*^9, 
   3.6504448633878736`*^9}, {3.6504469461447124`*^9, 
   3.6504470037868137`*^9}, {3.650447113236606*^9, 3.6504471154830103`*^9}}]
}, Open  ]],

Cell[CellGroupData[{

Cell["Code", "Section",
 CellChangeTimes->{{3.6504431682115364`*^9, 3.6504431714335423`*^9}}],

Cell["Create Empty list for results and date", "Text",
 CellChangeTimes->{{3.650443189970575*^9, 3.650443206654601*^9}, 
   3.6534816149480886`*^9}],

Cell[BoxData[
 RowBox[{
  RowBox[{"date", "=", 
   RowBox[{"{", "}"}]}], ";", 
  RowBox[{"moon1", "=", 
   RowBox[{"{", "}"}]}], ";", 
  RowBox[{"moon2", "=", 
   RowBox[{"{", "}"}]}], ";", 
  RowBox[{"moon3", "=", 
   RowBox[{"{", "}"}]}], ";", 
  RowBox[{"moon4", "=", 
   RowBox[{"{", "}"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.650443221657622*^9, 3.6504433027917566`*^9}, {
  3.6504437095144672`*^9, 3.6504437448315268`*^9}, {3.6504438775047436`*^9, 
  3.6504438782147446`*^9}, {3.6504439354078264`*^9, 3.6504439398898344`*^9}, {
  3.6504440629290476`*^9, 3.6504440630890474`*^9}}],

Cell[BoxData[
 RowBox[{"Do", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"jday", "=", 
     RowBox[{"jd", "[", 
      RowBox[{"year", ",", "month", ",", "day", ",", "hour"}], "]"}]}], ";", 
    "\[IndentingNewLine]", "\[IndentingNewLine]", 
    RowBox[{"AppendTo", "[", 
     RowBox[{"moon1", ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"x1", "[", 
         RowBox[{"year", ",", "month", ",", "day", ",", "hour"}], "]"}], ",", 
        "jday"}], "}"}]}], "]"}], ";", "\[IndentingNewLine]", 
    RowBox[{"AppendTo", "[", 
     RowBox[{"moon2", ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"x2", "[", 
         RowBox[{"year", ",", "month", ",", "day", ",", "hour"}], "]"}], ",", 
        "jday"}], "}"}]}], "]"}], ";", "\[IndentingNewLine]", 
    RowBox[{"AppendTo", "[", 
     RowBox[{"moon3", ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"x3", "[", 
         RowBox[{"year", ",", "month", ",", "day", ",", "hour"}], "]"}], ",", 
        "jday"}], "}"}]}], "]"}], ";", "\[IndentingNewLine]", 
    RowBox[{"AppendTo", "[", 
     RowBox[{"moon4", ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"x4", "[", 
         RowBox[{"year", ",", "month", ",", "day", ",", "hour"}], "]"}], ",", 
        "jday"}], "}"}]}], "]"}], ";", "\[IndentingNewLine]", 
    RowBox[{"hour", "=", 
     RowBox[{"hour", "+", "4"}]}], ";"}], "\[IndentingNewLine]", 
   "\[IndentingNewLine]", ",", "n"}], "]"}]], "Input",
 CellChangeTimes->{{3.6504433448358293`*^9, 3.650443365755865*^9}, {
   3.6504433997659273`*^9, 3.650443431055975*^9}, {3.6504435867522554`*^9, 
   3.6504436272353163`*^9}, {3.65044386184072*^9, 3.650443884225753*^9}, {
   3.650443944379841*^9, 3.6504439446898413`*^9}, {3.650444003174946*^9, 
   3.6504440036549463`*^9}, {3.650444107414116*^9, 3.6504441515751867`*^9}, {
   3.650444189798253*^9, 3.650444190168253*^9}, {3.6504443645476665`*^9, 
   3.6504443925002656`*^9}, {3.6504445721863976`*^9, 
   3.6504445725763984`*^9}, {3.6504447612327175`*^9, 
   3.6504448576668653`*^9}, {3.6504449020599403`*^9, 3.650444929327983*^9}, {
   3.6504450019101086`*^9, 3.65044501019112*^9}, {3.650445051893195*^9, 
   3.6504450884712567`*^9}, 3.65044528709859*^9, {3.6504470104168253`*^9, 
   3.6504470114152274`*^9}, {3.6504471223938227`*^9, 3.65044713244024*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListLinePlot", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"moon1", ",", "moon2", ",", "moon3", ",", "moon4"}], "}"}], ",", 
   RowBox[{"PlotStyle", "->", 
    RowBox[{"{", 
     RowBox[{"Red", ",", "Green", ",", "Blue", ",", "Purple"}], "}"}]}], ",", 
   RowBox[{"PlotLegends", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
     "\"\<Io\>\"", ",", "\"\<Europa\>\"", ",", "\"\<Ganymede\>\"", ",", 
      "\"\<Callisto\>\""}], "}"}]}], ",", 
   RowBox[{"AxesLabel", "->", 
    RowBox[{"{", 
     RowBox[{
     "\"\<Dist (Equiatorial Radius)\>\"", ",", "\"\<Julian Date\>\""}], 
     "}"}]}]}], "]"}]], "Input",
 CellChangeTimes->{{3.65044494743402*^9, 3.650444962108042*^9}, {
  3.650445273841567*^9, 3.650445319964636*^9}, {3.6534848036514373`*^9, 
  3.653484844434504*^9}, {3.653484894385701*^9, 3.65348494084877*^9}, {
  3.653485005832878*^9, 3.6534850310949154`*^9}, {3.6534852993764224`*^9, 
  3.65348538479257*^9}, {3.653485491646757*^9, 3.6534855138307915`*^9}, {
  3.6534856063699336`*^9, 3.6534856243309755`*^9}}],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {{{}, {}, {
        Hue[0.67, 0.6, 0.6], 
        Directive[
         PointSize[0.011111111111111112`], 
         AbsoluteThickness[1.6], 
         RGBColor[1, 0, 0]], 
        LineBox[CompressedData["
1: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
         "]]}, {
        Hue[0.9060679774997897, 0.6, 0.6], 
        Directive[
         PointSize[0.011111111111111112`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 1, 0]], 
        LineBox[CompressedData["
1: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
         "]]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.011111111111111112`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[CompressedData["
1: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
         "]]}, {
        Hue[0.37820393249936934`, 0.6, 0.6], 
        Directive[
         PointSize[0.011111111111111112`], 
         AbsoluteThickness[1.6], 
         RGBColor[0.5, 0, 0.5]], 
        LineBox[CompressedData["
1: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
usg=
         "]]}}}, {}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 2.4572650083333333`*^6}, 
     PlotRange -> {{-26.44165960301145, 26.274537133015787`}, {2.4572665*^6, 
      2.4572963333333335`*^6}}, DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"Dist (Equiatorial Radius)\"", TraditionalForm], 
       FormBox["\"Julian Date\"", TraditionalForm]}, 
     AxesOrigin -> {0, 2.4572650083333333`*^6}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, 
     PlotRange -> {{-26.44165960301145, 26.274537133015787`}, {2.4572665*^6, 
      2.4572963333333335`*^6}}, PlotRangeClipping -> True, 
     PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{"\"Io\"", "\"Europa\"", "\"Ganymede\"", "\"Callisto\""}, 
      "LineLegend", DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.2], 
                    AbsoluteThickness[1.6], 
                    RGBColor[1, 0, 0]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.2], 
                    AbsoluteThickness[1.6], 
                    RGBColor[1, 0, 0]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.2], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 1, 0]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.2], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 1, 0]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.2], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.2], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.2], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.5, 0, 0.5]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.2], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.5, 0, 0.5]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #4}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"LineLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.011111111111111112`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[1, 0, 0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0.6666666666666666, 0., 0.], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[1, 0, 0]"], Appearance -> None, BaseStyle -> {},
                     BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[1, 0, 0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[1, 0, 0], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.011111111111111112`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 1, 0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0.6666666666666666, 0.], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 1, 0]"], Appearance -> None, BaseStyle -> {},
                     BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 1, 0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> A\
utomatic, Method -> "Preemptive"], 
                    RGBColor[0, 1, 0], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.011111111111111112`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.6666666666666666], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 0, 1]"], Appearance -> None, BaseStyle -> {},
                     BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.011111111111111112`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.5, 0, 0.5], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[0.33333333333333337`, 0., 0.33333333333333337`], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0.5, 0, 0.5]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.5, 0, 0.5]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.5, 0, 0.5], Editable -> False, Selectable -> 
                    False]}], "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2, ",", #3, ",", #4}], "}"}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{"True", ",", "True", ",", "True", ",", "True"}], 
               "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",
 CellChangeTimes->{
  3.650444964300046*^9, 3.6504450332261653`*^9, {3.650445072413231*^9, 
   3.650445098942278*^9}, 3.6504452757515717`*^9, {3.6504453067306175`*^9, 
   3.650445321915639*^9}, 3.6504470192776413`*^9, 3.6504471496782703`*^9, 
   3.653481967230623*^9, 3.653484817037461*^9, 3.653484849516511*^9, 
   3.653484946202778*^9, 3.65348503429692*^9, 3.6534853042674294`*^9, 
   3.653485387594574*^9, {3.6534854987827673`*^9, 3.653485514950793*^9}, 
   3.65348562729098*^9}]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{755, 793},
WindowMargins->{{338, Automatic}, {Automatic, 50}},
FrontEndVersion->"10.2 for Microsoft Windows (64-bit) (July 29, 2015)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1486, 35, 236, 3, 90, "Title"],
Cell[CellGroupData[{
Cell[1747, 42, 144, 2, 63, "Section"],
Cell[1894, 46, 3131, 64, 714, "Text"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5062, 115, 173, 2, 63, "Section"],
Cell[5238, 119, 177, 2, 30, "Text"],
Cell[5418, 123, 883, 26, 31, "Input"],
Cell[6304, 151, 171, 2, 30, "Text"],
Cell[6478, 155, 511, 12, 31, "Input"],
Cell[6992, 169, 126, 1, 30, "Text"],
Cell[7121, 172, 586, 14, 31, "Input"],
Cell[7710, 188, 117, 1, 30, "Text"],
Cell[7830, 191, 1570, 40, 92, "Input"],
Cell[9403, 233, 769, 20, 52, "Input"],
Cell[10175, 255, 163, 3, 30, "Text"],
Cell[10341, 260, 804, 22, 52, "Input"],
Cell[11148, 284, 141, 1, 30, "Text"],
Cell[11292, 287, 1603, 42, 112, "Input"],
Cell[12898, 331, 748, 19, 72, "Input"],
Cell[13649, 352, 108, 1, 30, "Text"],
Cell[13760, 355, 889, 24, 52, "Input"],
Cell[14652, 381, 110, 1, 30, "Text"],
Cell[14765, 384, 817, 23, 72, "Input"],
Cell[15585, 409, 110, 1, 30, "Text"],
Cell[15698, 412, 1093, 28, 72, "Input"],
Cell[16794, 442, 128, 1, 30, "Text"],
Cell[16925, 445, 918, 24, 72, "Input"],
Cell[17846, 471, 481, 13, 31, "Input"],
Cell[18330, 486, 116, 1, 30, "Text"],
Cell[18449, 489, 1273, 31, 92, "Input"],
Cell[19725, 522, 1074, 28, 92, "Input"],
Cell[20802, 552, 135, 1, 30, "Text"],
Cell[20940, 555, 923, 25, 72, "Input"],
Cell[21866, 582, 662, 18, 52, "Input"],
Cell[22531, 602, 1708, 46, 112, "Input"],
Cell[24242, 650, 186, 4, 30, "Text"],
Cell[24431, 656, 1120, 29, 92, "Input"],
Cell[25554, 687, 1064, 28, 92, "Input"],
Cell[26621, 717, 1062, 28, 92, "Input"],
Cell[27686, 747, 1067, 28, 92, "Input"],
Cell[28756, 777, 762, 22, 52, "Input"],
Cell[29521, 801, 761, 22, 52, "Input"],
Cell[30285, 825, 857, 24, 52, "Input"],
Cell[31145, 851, 773, 22, 52, "Input"],
Cell[31921, 875, 554, 16, 52, "Input"],
Cell[32478, 893, 554, 16, 52, "Input"],
Cell[33035, 911, 559, 15, 52, "Input"],
Cell[33597, 928, 563, 15, 52, "Input"],
Cell[34163, 945, 561, 15, 52, "Input"],
Cell[34727, 962, 561, 15, 52, "Input"],
Cell[35291, 979, 140, 1, 30, "Text"],
Cell[35434, 982, 834, 24, 52, "Input"],
Cell[36271, 1008, 808, 23, 52, "Input"],
Cell[37082, 1033, 592, 17, 52, "Input"],
Cell[37677, 1052, 589, 17, 52, "Input"],
Cell[38269, 1071, 186, 4, 30, "Text"],
Cell[38458, 1077, 673, 18, 52, "Input"],
Cell[39134, 1097, 622, 17, 52, "Input"],
Cell[39759, 1116, 622, 17, 52, "Input"],
Cell[40384, 1135, 651, 18, 52, "Input"],
Cell[41038, 1155, 841, 23, 72, "Input"],
Cell[41882, 1180, 843, 23, 72, "Input"],
Cell[42728, 1205, 896, 24, 72, "Input"],
Cell[43627, 1231, 924, 25, 72, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[44588, 1261, 93, 1, 63, "Section"],
Cell[44684, 1264, 315, 7, 87, "Text"],
Cell[45002, 1273, 1610, 39, 152, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[46649, 1317, 93, 1, 63, "Section"],
Cell[46745, 1320, 148, 2, 30, "Text"],
Cell[46896, 1324, 590, 15, 31, "Input"],
Cell[47489, 1341, 2296, 50, 192, "Input"],
Cell[CellGroupData[{
Cell[49810, 1395, 1045, 23, 92, "Input"],
Cell[50858, 1420, 28632, 552, 343, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature FvT9sO4dU8TwMCKIqidNPxGU *)
