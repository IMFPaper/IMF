# Snapshot: tinytable

## Object
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
hline{1}={1-5}{solid, black, 0.1em},
hline{30}={1-5}{solid, black, 0.1em},
column{2-5}={}{halign=c},
column{1}={}{halign=l},
}                     %% tabularray inner close
& Number of IMF conditions & Number of Fiscal conditions & RFA ($T$+1) & RFA (end year) \\
USA Influence & \num{-5.279}*** & \num{-14.667}+ & \num{8.595}* & \num{2.497} \\
& (\num{1.519}) & (\num{8.480}) & (\num{3.967}) & (\num{5.400}) \\
EUP Influence & \num{1.364} & \num{18.520}* & \num{-5.282}+ & \num{0.360} \\
& (\num{6.019}) & (\num{8.082}) & (\num{3.015}) & (\num{5.198}) \\
IMF Staff & \num{-1.630} & \num{-0.264} & \num{-0.416} & \num{-0.590} \\
& (\num{1.027}) & (\num{1.456}) & (\num{0.847}) & (\num{1.469}) \\
IMF Quota & \num{-11.522}*** & \num{-2.486}* & \num{0.487} & \num{-0.228} \\
& (\num{3.488}) & (\num{1.200}) & (\num{0.920}) & (\num{1.005}) \\
GDP & \num{33.598}*** & \num{-0.755} & \num{13.913}* & \num{7.235} \\
& (\num{9.677}) & (\num{8.536}) & (\num{6.253}) & (\num{7.686}) \\
GDP$^2$ & \num{-1.128}** & \num{0.239} & \num{-0.724}* & \num{-0.309} \\
& (\num{0.438}) & (\num{0.498}) & (\num{0.321}) & (\num{0.428}) \\
GDPpc & \num{-1.366} & \num{-4.727}*** & \num{-2.499} & \num{-2.582} \\
& (\num{1.562}) & (\num{1.162}) & (\num{1.456}) & (\num{1.915}) \\
GDPpc$^2$ & \num{0.163} & \num{0.618}*** & \num{0.229} & \num{0.238} \\
& (\num{0.174}) & (\num{0.154}) & (\num{0.157}) & (\num{0.207}) \\
GDPpc growth & \num{-1.078}** & \num{-0.335} & \num{0.064} & \num{0.244} \\
& (\num{0.337}) & (\num{0.487}) & (\num{0.211}) & (\num{0.353}) \\
Reserves & \num{-0.207} & \num{-0.953}* & \num{0.312} & \num{0.298} \\
& (\num{0.350}) & (\num{0.449}) & (\num{0.274}) & (\num{0.413}) \\
OECD & \num{7.848}+ & \num{-11.369} & \num{10.664}** & \num{8.253} \\
& (\num{4.144}) & (\num{7.245}) & (\num{2.783}) & (\num{5.553}) \\
(Intercept) & \num{-231.165}*** & \num{-21.602} & \num{-57.942}+ & \num{-41.211} \\
& (\num{66.201}) & (\num{28.907}) & (\num{28.247}) & (\num{27.271}) \\
USA=EUP & [0.301] & [0.053+] & [0.035*] & [0.83] \\
Period FE & Yes & Yes & Yes & Yes \\
Regression & Tobit & Tobit & OLS & OLS \\
$N$ & \num{93} & \num{31} & \num{30} & \num{30} \\
\end{talltblr}
\end{table} 
