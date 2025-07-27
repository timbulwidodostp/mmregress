{smcl}
{* *! version 1.0  1dec2008}{...}
{cmd:help msregress} {right: ({browse "http://www.stata-journal.com/article.html?article=st0173":SJ9-3: st0173})}
{hline}

{title:Title}

{p2colset 5 18 20 2}{...}
{p2col :{hi:msregress} {hline 2}}MS-robust
regression{p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 15 2}
{cmdab:msregress}
{depvar}
[{indepvars}]
{ifin}{cmd:,} {cmd:dummies(}{it:dummies}{cmd:)}
[{it:options}]

{synoptset 19 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Model}
{synopt :{opt noc:onstant}}suppress constant term{p_end}

{syntab:Algorithm}
{synopt :{opt outlier}}generate outlyingness measures{p_end}
{synopt :{opt graph}}generate the outlier identification  graphical tool{p_end}
{synopt :{opt replic(#)}}set the number of subsampling to consider{p_end}
{synoptline}


{title:Description}

{pstd}
{opt msregress} fits an MS-estimator of regression of {depvar} on {indepvars}. 
An MS-estimator of regression is a robust fitting approach that minimizes
a (rho) function of the regression residuals, which is even, nondecreasing 
for positive values and less increasing than the square function, which is 
appropriate when some dummy variables are among the explanatory.
The function used here is a Tukey biweight.


{title:Options}

{dlgtab:Model}

{phang}
{opt noconstant}; see
{helpb estimation options##noconstant:[R] estimation options}.

{dlgtab:Algorithm}

{phang}
{opt dummies(dummies)} specifies which variables are dichotomous. If several
dummy variables are present among the explanatory variables, the S-estimator
algorithm could fail. An MS-estimator can be used instead by declaring the
list of dummy variables present in the model.

{phang}
{opt outlier} calculates four outlyingness measures. The first (MS_stdres) contains the robust standardized residuals; 
the second (MS_outlier) flags outliers in the vertical dimension (i.e.,
observations associated with a robust standardized 
residual larger than 2.25); the third (Robust_distance) contains robust distances; and the fourth (MCD_outlier) flags outliers in the 
horizontal dimension (i.e., observations associated with robust distances larger than the 97.5 percentile of a chi-squared).

{phang}
{opt graph} displays a graphic where outliers are flagged according to their type.
 
{phang}
{opt replic(#)} specifies the number of subsets to consider in the initial
steps of the algorithm. By default, the number of subsets associated with the underlying algorithm is set using the formula
replic=log(1-0.99)/log{1-(1-0.2)^(p+1)}, where p is the number of explanatory variables. 


{title:Examples}

{pstd}Setup{p_end}

{phang2}{cmd:. webuse auto}{p_end}

{pstd}MS-robust regression{p_end}

{phang2}{cmd:. xi: msregress  price mpg headroom trunk weight length turn displacement gear_ratio, dummies(i.rep78 foreign)}

{pstd}Same as above, but calling the graphical tool{p_end}

{phang2}{cmd:. xi: msregress  price mpg headroom trunk weight length turn displacement gear_ratio, dummies(i.rep78 foreign) graph}


{title:Saved results}

{pstd}
{cmd:msregress} saves the following in {cmd:e()}:

{synoptset 15 tabbed}{...}
{p2col 5 15 19 2: Scalars}{p_end}
{synopt:{cmd:e(scale)}}robust residual scale{p_end}
{synopt:{cmd:e(N)}}number of observations{p_end}
{synopt:{cmd:e(df_m)}}model degrees of freedom{p_end}
{synopt:{cmd:e(df_r)}}residual degrees of freedom{p_end}
{synoptset 15 tabbed}{...}

{p2col 5 15 19 2: Macros}{p_end}
{synopt:{cmd:e(cmd)}}{cmd:msregress}{p_end}
{synopt:{cmd:e(properties)}}{cmd:b V}{p_end}

{synoptset 15 tabbed}{...}
{p2col 5 15 19 2: Matrices}{p_end}
{synopt:{cmd:e(b)}}coefficient vector{p_end}
{synopt:{cmd:e(V)}}variance-covariance matrix of the estimators{p_end}

{synoptset 15 tabbed}{...}
{p2col 5 15 19 2: Functions}{p_end}
{synopt:{cmd:e(sample)}}marks estimation sample{p_end}
{p2colreset}{...}


{title:Also see}

{psee}
Article: {it:Stata Journal}, volume 9, number 3: {browse "http://www.stata-journal.com/article.html?article=st0173":st0173}

{psee}
Online:  {manhelp qreg R}, {manhelp regress R};{break}
{manhelp rreg R}, {helpb mmregress}, {helpb sregress}, {helpb mregress}, {helpb mcd} (if installed)
{p_end}

