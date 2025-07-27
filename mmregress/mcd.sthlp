{smcl}
{* *! version 1.0  1dec2008}{...}
{cmd:help mcd}{right: ({browse "http://www.stata-journal.com/article.html?article=st0173":SJ9-3: st0173})}
{hline}

{title:Title}

{p2colset 5 12 14 2}{...}
{p2col :{hi:mcd} {hline 2}}Minimum covariance determinant (MCD) estimator of location and scatter
{p2colreset}{...}


{title:Syntax}
{p 8 11 2}
{cmd:mcd} {varlist} {ifin} 
[{cmd:,} {it:options}] 


{synoptset 13 tabbed}{...}
{synopthdr:options}
{synoptline}
{syntab:Model}
{synopt :{opt e(#)}}set maximal expected proportion of outliers{p_end}
{synopt :{opt proba(#)}}set probability of selecting at least one clean sample in the p-subset algorithm{p_end}
{synopt :{opt trim(#)}}set percentage of trimming {p_end}
{synopt :{opt out:lier}}return robust Mahalanobis distances and flag outliers{p_end}
{synopt :{opt best:sample}}flag observations used for estimating the trimmed covariance matrix{p_end}
{synopt :{opt raw}}return the raw robust covariance matrix{p_end}
{synopt :{opt setseed(#)}}set the seed{p_end}
{synoptline}


{title:Description}

{pstd}
{opt mcd} finds the MCD estimator of location and
scatter.  By default, the one-step reweighted MCD robust covariance matrix is
saved in matrix covRMCD, and the one-step reweighted MCD robust location vector
is saved in matrix locationRMCD.


{title:Options}

{dlgtab:Model}

{phang}
{opt e(#)} sets the expected percentage of outliers existing in the dataset.
Setting it high slows down the algorithm. The default is {cmd:e(0.2)}, but it can
take any value ranging from 0 to 0.5.

{phang}
{opt proba(#)} sets the probability of having at least one noncorrupt sample
among all those considered. The default is {cmd:proba(0.99)}, but it can take any
value ranging from 0 to 0.9999.

{phang}
{opt trim(#)} sets the trimming. The default is {cmd:trim(0.5)}, but it can take any
value ranging from 0 to 0.5.

{phang}
{opt outlier} creates a dummy variable identifying multivariate outliers
and returns robust distances.

{phang}
{opt bestsample} flags the subsample used for estimating the MCD location
vector and scatter matrix.

{phang}
{opt raw} returns the genuine MCD location vector (locationMCD) and covariance
matrix (covMCD) rather than the one-step reweighted (the default). The
reweighted location vector and covariance matrix are computed using classical
estimators on the dataset cleaned of identified outliers.

{phang}
{opt setseed(#)} allows the user to set a seed, thereby enabling the user to replicate the results.


{title:Examples}

{pstd}Setup{p_end}

{phang2}{cmd:. webuse auto}{p_end}

{pstd}Estimate robust Mahalanobis distances{p_end}

{phang2}{cmd:. mcd  mpg headroom trunk weight length turn displacement gear_ratio, outlier}{p_end}

{pstd}Display the robust reweighted covariance matrix and location vector{p_end}

{phang2}{cmd:. matrix list covRMCD}{p_end}
{phang2}{cmd:. matrix list locationRMCD}{p_end}

{pstd}Same as above, but using the raw data{p_end}

{phang2}{cmd:. mcd  mpg headroom trunk weight length turn displacement gear_ratio, outlier raw}{p_end}

{pstd}Display the robust raw covariance matrix and location vector{p_end}

{phang2}{cmd:. matrix list covMCD}{p_end}
{phang2}{cmd:. matrix list locationMCD}{p_end}


{title:Also see}

{psee}
Article: {it:Stata Journal}, volume 9, number 3: {browse "http://www.stata-journal.com/article.html?article=st0173":st0173}

{psee}
Online:  {manhelp qreg R}, {manhelp regress R};{break}
{manhelp rreg R}, {helpb mmregress}, {helpb sregress}, {helpb msregress}, 
{helpb mregress} (if installed){p_end}
