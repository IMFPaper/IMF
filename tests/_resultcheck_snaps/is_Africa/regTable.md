# Snapshot: tinytable

## print
\begin{table}
\centering
\begin{talltblr}[         %% tabularray outer open
entry=none,label=none,
note{}={+ p \num{< 0.1}, * p \num{< 0.05}, ** p \num{< 0.01}, *** p \num{< 0.001}},
note{ }={Standard errors clustered at the country level.},
]                     %% tabularray outer close
{                     %% tabularray inner open
colspec={Q[]Q[]Q[]Q[]Q[]},
hline{2}={1-5}{solid, black, 0.05em},
hline{30}={1-5}{solid, black, 0.05em},
hline{1}={1-5}{solid, black, 0.08em},
hline{33}={1-5}{solid, black, 0.08em},
column{2-5}={}{halign=c},
column{1}={}{halign=l},
}                     %% tabularray inner close
& IMF loan to GDP ratio & IMF participation rate & IMF loan approval & Number of IMF conditions \\
USA Influence & \num{0.300} & \num{0.099} & \num{0.168} & \num{-3.515}* \\
& (\num{0.299}) & (\num{0.062}) & (\num{0.166}) & (\num{1.492}) \\
EUP Influence & \num{1.966}*** & \num{0.484}*** & \num{1.043}* & \num{3.117} \\
& (\num{0.560}) & (\num{0.125}) & (\num{0.463}) & (\num{5.381}) \\
EUP Influence $\times$ \newline African recipient & \num{-2.189} & \num{-1.068}* & \num{-1.539} & \num{2.291} \\
& (\num{2.964}) & (\num{0.424}) & (\num{1.112}) & (\num{11.798}) \\
African recipient & \num{-0.973} & \num{-0.432}* & \num{-0.728} & \num{11.325}* \\
& (\num{1.185}) & (\num{0.178}) & (\num{0.447}) & (\num{4.641}) \\
IMF Staff & \num{0.333}* & \num{0.073}* & \num{0.121} & \num{-1.669}* \\
& (\num{0.146}) & (\num{0.034}) & (\num{0.090}) & (\num{0.817}) \\
IMF Quota & \num{0.991}** & \num{0.105} & \num{0.243} & \num{-11.912}*** \\
& (\num{0.346}) & (\num{0.081}) & (\num{0.198}) & (\num{3.017}) \\
GDP & \num{0.362} & \num{0.435}** & \num{0.968}** & \num{41.884}*** \\
& (\num{0.689}) & (\num{0.143}) & (\num{0.330}) & (\num{9.479}) \\
GDP$^2$ & \num{-0.052} & \num{-0.025}** & \num{-0.056}** & \num{-1.514}*** \\
& (\num{0.038}) & (\num{0.008}) & (\num{0.018}) & (\num{0.421}) \\
GDPpc & \num{0.696}*** & \num{0.158}*** & \num{0.370}** & \num{-0.240} \\
& (\num{0.182}) & (\num{0.043}) & (\num{0.117}) & (\num{1.179}) \\
GDPpc$^2$ & \num{-0.079}*** & \num{-0.019}*** & \num{-0.046}*** & \num{0.045} \\
& (\num{0.021}) & (\num{0.004}) & (\num{0.011}) & (\num{0.132}) \\
GDPpc growth & \num{-0.130}** & \num{-0.029}** & \num{-0.051}* & \num{-1.103}*** \\
& (\num{0.042}) & (\num{0.009}) & (\num{0.023}) & (\num{0.297}) \\
Reserves & \num{-0.175}** & \num{-0.034}** & \num{-0.091}* & \num{-0.130} \\
& (\num{0.060}) & (\num{0.013}) & (\num{0.036}) & (\num{0.303}) \\
OECD & \num{-1.815}+ & \num{-0.610}** & \num{-1.487}* & \num{5.885} \\
& (\num{1.033}) & (\num{0.218}) & (\num{0.624}) & (\num{3.922}) \\
(Intercept) & \num{9.553}+ & \num{-0.755} & \num{-2.162} & \num{-281.419}*** \\
& (\num{4.933}) & (\num{1.022}) & (\num{2.505}) & (\num{66.027}) \\
Period FE & Yes & Yes & Yes & Yes \\
Regression & Tobit & Tobit & Probit & Tobit \\
$N$ & \num{517} & \num{522} & \num{522} & \num{93} \\
\end{talltblr}
\end{table} 
