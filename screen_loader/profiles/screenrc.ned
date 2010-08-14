startup_message off
escape ^ww
defscrollback 30000
vbell off
vbell_msg ""
#termcapinfo xterm*|linux*|rxvt*|Eterm* OP

screen -t tmp  0
screen -t tmp2 1
screen -t irssi   2 ssh -t drio@sol.p3ll0n.net screen -RD
screen -t socks   3 ssh -N -D 1080 sol.p3ll0n.net
screen -t lisbeth 4 ssh drio@192.168.1.109
screen -t w3m     5 

select 0
