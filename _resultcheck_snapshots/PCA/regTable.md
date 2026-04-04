# Snapshot: tinytable

## Object
\begin{table}
\centering
\begin{talltblr}[         %% tabularray outer open
entry=none,label=none,
note{}={+ p \num{< 0.1}, * p \num{< 0.05}, ** p \num{< 0.01}, *** p \num{< 0.001}},
note{ }={Standard errors clustered at the country level. Values in square brackets represent $p$-values from $F$-tests (linear models) and Chi-squared tests (Probit model).},
]                     %% tabularray outer close
{                     %% tabularray inner open
colspec={Q[]Q[]Q[]Q[]Q[]},
hline{2}={1-5}{solid, black, 0.05em},
hline{26}={1-5}{solid, black, 0.05em},
hline{1}={1-5}{solid, black, 0.08em},
hline{30}={1-5}{solid, black, 0.08em},
column{2-5}={}{halign=c},
column{1}={}{halign=l},
}                     %% tabularray inner close
& IMF loan to GDP ratio & IMF participation rate & IMF loan approval & Number of IMF conditions \\
USA Influence & \num{0.318} & \num{0.108}+ & \num{0.185} & \num{-5.279}*** \\
& (\num{0.305}) & (\num{0.064}) & (\num{0.167}) & (\num{1.519}) \\
EUP Influence & \num{1.922}*** & \num{0.456}*** & \num{0.971}* & \num{1.364} \\
& (\num{0.562}) & (\num{0.126}) & (\num{0.473}) & (\num{6.019}) \\
IMF Staff & \num{0.325}* & \num{0.068}* & \num{0.116} & \num{-1.630} \\
& (\num{0.148}) & (\num{0.034}) & (\num{0.090}) & (\num{1.027}) \\
IMF Quota & \num{0.972}** & \num{0.103} & \num{0.218} & \num{-11.522}*** \\
& (\num{0.339}) & (\num{0.080}) & (\num{0.188}) & (\num{3.488}) \\
GDP & \num{0.273} & \num{0.380}* & \num{0.906}** & \num{33.598}*** \\
& (\num{0.643}) & (\num{0.153}) & (\num{0.322}) & (\num{9.677}) \\
GDP$^2$ & \num{-0.047} & \num{-0.022}** & \num{-0.052}** & \num{-1.128}** \\
& (\num{0.038}) & (\num{0.009}) & (\num{0.018}) & (\num{0.438}) \\
GDPpc & \num{0.701}*** & \num{0.158}*** & \num{0.385}*** & \num{-1.366} \\
& (\num{0.190}) & (\num{0.045}) & (\num{0.117}) & (\num{1.562}) \\
GDPpc$^2$ & \num{-0.079}*** & \num{-0.019}*** & \num{-0.047}*** & \num{0.163} \\
& (\num{0.022}) & (\num{0.005}) & (\num{0.011}) & (\num{0.174}) \\
GDPpc growth & \num{-0.128}** & \num{-0.029}** & \num{-0.049}* & \num{-1.078}** \\
& (\num{0.041}) & (\num{0.009}) & (\num{0.023}) & (\num{0.337}) \\
Reserves & \num{-0.172}** & \num{-0.034}** & \num{-0.088}** & \num{-0.207} \\
& (\num{0.059}) & (\num{0.013}) & (\num{0.034}) & (\num{0.350}) \\
OECD & \num{-1.750}+ & \num{-0.575}* & \num{-1.402}* & \num{7.848}+ \\
& (\num{1.049}) & (\num{0.223}) & (\num{0.625}) & (\num{4.144}) \\
(Intercept) & \num{9.593}* & \num{-0.582} & \num{-2.286} & \num{-231.165}*** \\
& (\num{4.399}) & (\num{1.021}) & (\num{2.333}) & (\num{66.201}) \\
USA=EUP & [0.021*] & [0.014*] & [0.122] & [0.301] \\
Period FE & Yes & Yes & Yes & Yes \\
Regression & Tobit & Tobit & Probit & Tobit \\
$N$ & \num{517} & \num{522} & \num{522} & \num{93} \\
\end{talltblr}
\end{table} 
