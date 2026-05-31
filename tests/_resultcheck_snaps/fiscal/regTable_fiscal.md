# Snapshot: tinytable

## print
\begin{table}
\centering
\begin{talltblr}[         %% tabularray outer open
entry=none,label=none,
note{}={+ p \num{< 0.1}, * p \num{< 0.05}, ** p \num{< 0.01}, *** p \num{< 0.001}},
note{ }={Standard errors clustered at the country level. Values in square brackets represent $p$-values from $F$-tests.},
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
& Number of IMF conditions & Number of Fiscal conditions & RFA ($T$+1) & RFA (end year) \\
USA Influence & \num{-5.279}*** & \num{-27.865}* & \num{1.885} & \num{-1.405} \\
& (\num{1.519}) & (\num{12.575}) & (\num{3.790}) & (\num{5.170}) \\
EUP Influence & \num{1.364} & \num{32.194}*** & \num{-2.229} & \num{-1.897} \\
& (\num{6.019}) & (\num{9.221}) & (\num{2.853}) & (\num{3.948}) \\
IMF Staff & \num{-1.630} & \num{-0.001} & \num{-4.110}** & \num{-5.044}** \\
& (\num{1.027}) & (\num{6.618}) & (\num{1.190}) & (\num{1.429}) \\
IMF Quota & \num{-11.522}*** & \num{-4.664} & \num{-1.203} & \num{-1.201} \\
& (\num{3.488}) & (\num{4.955}) & (\num{0.732}) & (\num{0.862}) \\
GDP & \num{33.598}*** & \num{25.599} & \num{-2.373} & \num{-8.209} \\
& (\num{9.677}) & (\num{26.880}) & (\num{4.266}) & (\num{4.628}) \\
GDP$^2$ & \num{-1.128}** & \num{-0.741} & \num{0.189} & \num{0.489}* \\
& (\num{0.438}) & (\num{0.898}) & (\num{0.181}) & (\num{0.206}) \\
GDPpc & \num{-1.366} & \num{-2.332} & \num{-0.651} & \num{-0.132} \\
& (\num{1.562}) & (\num{3.233}) & (\num{1.247}) & (\num{1.689}) \\
GDPpc$^2$ & \num{0.163} & \num{0.122} & \num{0.055} & \num{-0.001} \\
& (\num{0.174}) & (\num{0.455}) & (\num{0.159}) & (\num{0.222}) \\
GDPpc growth & \num{-1.078}** & \num{0.178} & \num{-0.079} & \num{0.019} \\
& (\num{0.337}) & (\num{1.683}) & (\num{0.367}) & (\num{0.495}) \\
Reserves & \num{-0.207} & \num{-1.377}+ & \num{0.584}* & \num{0.689}* \\
& (\num{0.350}) & (\num{0.788}) & (\num{0.247}) & (\num{0.316}) \\
OECD & \num{7.848}+ & \num{-21.390}*** & \num{-5.754}** & \num{3.102}* \\
& (\num{4.144}) & (\num{5.287}) & (\num{1.541}) & (\num{1.318}) \\
(Intercept) & \num{-231.165}*** & \num{-200.188} & \num{-23.092} & \num{-2.655} \\
& (\num{66.201}) & (\num{245.940}) & (\num{36.254}) & (\num{39.395}) \\
USA=EUP & [0.301] & [0.043*] & [0.519] & [0.956] \\
Period FE & Yes &  & Yes & Yes \\
Regression & Tobit & Tobit & OLS & OLS \\
$N$ & \num{93} & \num{17} & \num{17} & \num{17} \\
\end{talltblr}
\end{table} 
