We adapt the basic conceptual CA susceptible-exposed-infected-recovered (SEIR) model validated by Gagliardi, da Silva, and Alves:

Henrique F. Gagliardi, Fabrício A. B. da Silva, and Domingos Alves. 2006. Automata network simulator applied to the epidemiology of urban dengue fever. In Proceedings of the 6th international conference on Computational Science - Volume Part III (ICCS'06). Springer-Verlag, Berlin, Heidelberg, 297–304. https://doi.org/10.1007/11758532_41

In the model, the population is divided into human population and mosquito population. Infection between members of the same population is not possible except through an intermediate agent from the other population. Humans can get exposed to infection when bitten by an infected mosquito whereas a mosquito is exposed to infection when biting an infected human. However, mosquitos do not get infected by interacting with another mosquito neither a human can get infected through an interaction with another human. In the basic model, this infection happens through one serotype only.

cells states:
State 	Value 	Color 
Empty space 	0 	Gray
Susceptible Human 	1 	Green 
Exposed Human 	2 	Yellow 
Infected Human 	3 	Red 
Recovered Human 	4 	Blue 
Susceptible Mosquito 	11 	Green 
Exposed Mosquito 	12 	Yellow 
Infected Mosquito 	13 	Red 


To run the model:
1-install CD++
2-run "bash run.sh"