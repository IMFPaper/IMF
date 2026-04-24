# Snapshot: tinytable

## Object
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
USA Influence & \num{0.142} & \num{0.077} & \num{0.121} & \num{-5.835}*** \\
& (\num{0.261}) & (\num{0.061}) & (\num{0.165}) & (\num{1.558}) \\
EUP Influence & \num{4.306}*** & \num{0.856}*** & \num{1.673}** & \num{-11.698} \\
& (\num{1.218}) & (\num{0.245}) & (\num{0.601}) & (\num{7.652}) \\
EUP Influence $\times$ \newline European recipient & \num{-2.497}* & \num{-0.489}+ & \num{-1.038} & \num{14.053}+ \\
& (\num{1.177}) & (\num{0.257}) & (\num{0.727}) & (\num{7.265}) \\
European recipient & \num{-1.220}* & \num{-0.214}+ & \num{-0.321} & \num{7.734}* \\
& (\num{0.561}) & (\num{0.129}) & (\num{0.305}) & (\num{3.868}) \\
IMF Staff & \num{0.301}* & \num{0.065}+ & \num{0.112} & \num{-1.580} \\
& (\num{0.145}) & (\num{0.034}) & (\num{0.089}) & (\num{0.982}) \\
IMF Quota & \num{1.287}*** & \num{0.159}* & \num{0.328}+ & \num{-12.712}*** \\
& (\num{0.357}) & (\num{0.080}) & (\num{0.197}) & (\num{3.488}) \\
GDP & \num{0.624} & \num{0.447}** & \num{1.025}** & \num{26.055}** \\
& (\num{0.591}) & (\num{0.148}) & (\num{0.326}) & (\num{9.585}) \\
GDP$^2$ & \num{-0.076}* & \num{-0.028}*** & \num{-0.062}** & \num{-0.703} \\
& (\num{0.035}) & (\num{0.008}) & (\num{0.019}) & (\num{0.450}) \\
GDPpc & \num{0.717}*** & \num{0.167}*** & \num{0.407}** & \num{-1.418} \\
& (\num{0.195}) & (\num{0.048}) & (\num{0.125}) & (\num{1.534}) \\
GDPpc$^2$ & \num{-0.081}*** & \num{-0.020}*** & \num{-0.050}*** & \num{0.192} \\
& (\num{0.020}) & (\num{0.005}) & (\num{0.012}) & (\num{0.164}) \\
GDPpc growth & \num{-0.126}** & \num{-0.028}** & \num{-0.048}* & \num{-1.005}** \\
& (\num{0.039}) & (\num{0.009}) & (\num{0.023}) & (\num{0.326}) \\
Reserves & \num{-0.176}** & \num{-0.034}** & \num{-0.090}* & \num{-0.100} \\
& (\num{0.061}) & (\num{0.013}) & (\num{0.036}) & (\num{0.331}) \\
OECD & \num{-1.441} & \num{-0.492}* & \num{-1.212}* & \num{15.313}*** \\
& (\num{0.966}) & (\num{0.221}) & (\num{0.587}) & (\num{4.102}) \\
(Intercept) & \num{11.081}* & \num{-0.335} & \num{-1.752} & \num{-208.445}** \\
& (\num{4.470}) & (\num{1.018}) & (\num{2.380}) & (\num{63.738}) \\
Period FE & Yes & Yes & Yes & Yes \\
Regression & Tobit & Tobit & Probit & Tobit \\
$N$ & \num{517} & \num{522} & \num{522} & \num{93} \\
\end{talltblr}
\end{table} 
