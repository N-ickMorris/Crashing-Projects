set J;		#set of tasks
set P{J};	#set of predecessors

param n{J};	#minimum time to complete a task
param z{J};	#maximum time to complete a task
param c{J};	#cost to complete a task in maximum time
param x{J};	#cost to complete a task in minimum time
param D;	#project duration

var s{J} >= 0;				#start time of a task
var t{J} >= 0;				#duration time of a task

minimize Cost: sum{j in J: j > 0}((((z[j] - t[j])*(c[j] - x[j]))/(z[j] - n[j])) + x[j]);
s.t. Const1{j in J, p in P[j]}: s[j] - s[p] - t[p] >= 0;
s.t. Const2{j in J}: s[j] + t[j] <= D;
s.t. Const3{j in J}: n[j] <= t[j] <= z[j];