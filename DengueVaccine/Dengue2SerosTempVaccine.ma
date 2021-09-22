%%%This version of the model considres temperature and vaccination
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

%%Thre state variables: s: state number, t: temperature, and v: Is this individual vaccinated? v is used only in the human zone.
StateVariables: s t v
StateValues : 0 50 0

InitialCellsValue : Dengue2SerosTempVaccine.val
InitialValue : 0

zone : mosquito-rule { (0,1,1)..(28,28,1) }
zone : human-rule { (0,1,2)..(28,28,2) }

localtransition: epidemic-rule

%%%%%%%% MOSQUITO PORT %%%%%%%
					
[mosquito-rule]
rule : { 11 } { $s := 11; } 1000 { (0,0,0) = 0 }

%%As the temperature increases the probability of infection should increase as well.
%%The simple rule provided here multiplies be scaled temperature assuming temperature ranges from 18 (the minimum temp)
%%to 50
rule : { 12 } { $s := 12; } 1000 { (0,0,0) = 11 and random < (0.8 * (1 - power(0.06, (statecount(3)))) * (($t - 18)/(50 - 18))) }

%%This is a self transtion rule that can simple be removed as it is covered by the last rule in this zone.
%%We keep it just for conisstancy and to follow the state diagrams.
rule : { 11 } { $s := 11; } 1000 { (0,0,0) = 11 }

rule : { 13 } { $s := 13; } 3000 { (0,0,0) = 12 }

rule : { 14 } { $s := 14; } 4000 { (0,0,0) = 13 }

rule : { 15 } { $s := 15; } 5000 { (0,0,0) = 14 and random < (0.8 * (1 - power(0.06, (statecount(6)))) * (($t - 18)/(50 - 18))) }
rule : { 14 } { $s := 14; } 5000 { (0,0,0) = 14 }

rule : { 16 } { $s := 16; } 6000 { (0,0,0) = 15 }

rule : { 16 } { $s := 16; } 8000 { (0,0,0) = 16 }

rule : { $s } 1000 { t }


%%%%%%%% HUMAN PORT  %%%%%%%%%
[human-rule]
rule : { 11 } { $s := 1; $v := 1; } 1000 { (0,0,0) = 0 and (random > 0.5 ) }
rule : { 1 } { $s := 1; } 1000  { (0,0,0) = 0 }

rule : { 2 } { $s := 2; } 1000 { (0,0,0) = 1 and random < (0.8 * (1 - power(0.06, (statecount(13)))) * (($t - 18)/(50 - 18))) }
rule : { 1 } { $s := 1; } 1000  { (0,0,0) = 1 }

rule : { 3 } { $s := 3; } 3000 { (0,0,0) = 2 and ($v = 0 ) }
rule : { 2 } { $s := 2; } 3000 { (0,0,0) = 2 }

rule : { 4 } { $s := 4; } 4000 { (0,0,0) = 3 }

rule : { 5 } { $s := 5; } 5000 { (0,0,0) = 4 and random < (0.8 * (1 - power(0.06, (statecount(16)))) * (($t - 18)/(50 - 18))) }
rule : { 4 } { $s := 4; } 5000 { (0,0,0) = 4 }

rule : { 6 } { $s := 6; } 6000 { (0,0,0) = 5 and ($v = 0 ) }
rule : { 5 } { $s := 5; } 6000 { (0,0,0) = 5 }

rule : { 7 } { $s := 7; } 8000 { (0,0,0) = 6 }

rule : { 7 } { $s := 7; } 8000  { (0,0,0) = 7 }
rule : { $s } 1000 { t }

[epidemic-rule]
rule : { $s } 1000 { t }