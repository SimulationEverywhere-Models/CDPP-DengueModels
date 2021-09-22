%% A model for the spread of a mosquito-borne disease Dengue
%% The basic model considers one serotype only
%% The virus spread across populations but not within the same population

[top]
components : dengue

[dengue]
type : cell
dim : (30, 30, 3)
delay : transport
defaultDelayTime : 100
border : unwrapped

neighbors : dengue(1,0,1) dengue(0,0,1) dengue(-1,0,1) dengue(0,1,1) dengue(0,-1,1) 
neighbors : dengue(1,1,1) dengue(-1,-1,1) dengue(-1,1,1) dengue(1,-1,1)
neighbors : dengue(0,0,0)
neighbors : dengue(1,0,-1) dengue(0,0,-1) dengue(-1,0,-1) dengue(0,1,-1) dengue(0,-1,-1) 
neighbors : dengue(1,1,-1) dengue(-1,-1,-1) dengue(-1,1,-1) dengue(1,-1,-1)


StateVariables: s

initialvalue : 0
InitialCellsValue : basic_dengue.val

%% Two layers: one for mosquitos and the other for the human population
zone : mosquito-rule { (0,1,1)..(28,28,1) }
zone : human-rule { (0,1,2)..(28,28,2) }

localtransition: epidemic-rule

%%%%%%%% MOSQUITO PORT %%%%%%%
					
[mosquito-rule]
%%When simulation begins, all cells initially have the value 0. This rule switches the mosquito cells to the susciptable state
rule : { 11 } { $s := 11; } 1000 { (0,0,0) = 0 }

%%With a given probability susciptable cells become exposed. If the probability is not met, the cell remains in the susciptable
%%state (value = 11)
rule : { 12 } { $s := 12; } 1000 { (0,0,0) = 11 and random < (0.8 * (1 - power(0.06, (statecount(3)))))}
rule : { 11 } { $s := 11; } 1000 { (0,0,0) = 11 }

%%After a certain period, exposed states become infected can infect human cells based on the human zone rules
rule : { 13 } { $s := 13; } 1000 { (0,0,0) = 12 }

%%once infected, a mosquito cell remains infected forever
rule : { 13 } { $s := 13; } 8000 { (0,0,0) = 13 }

rule : { $s } 100 { t }

%%%%%%%% HUMAN PORT  %%%%%%%%%
[human-rule]
%%When simulation begins, all cells initially have the value 0. This rule switches the human cells to the susciptable state

rule : { 1 } { $s := 1; } 1000  { (0,0,0) = 0 }

rule : { 2 } { $s := 2; } 1000 { (0,0,0) = 1 and random < (0.8 * (1 - power(0.06, (statecount(13)))))}

rule : { 1 } { $s := 1; } 1000  { (0,0,0) = 1 }

rule : { 3 } { $s := 3; } 3000 { (0,0,0) = 2 }
rule : { 4 } { $s := 4; } 8000 { (0,0,0) = 3 }

%%A human cell can recover and stays recovered forever
rule : { 4 } { $s := 4; } 1000  { (0,0,0) = 4 }

[epidemic-rule]
rule : { 0 } 100 { t }