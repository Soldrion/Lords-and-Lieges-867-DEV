--(Base unit stat) * (1 + tech bonus + terrain bonus + cultural bonus + tactic bonus) * (1 + leader trait bonus + tactical affinity bonus) https://ck2.paradoxwikis.com/Combat

--MAKE AI
--https://ck2.paradoxwikis.com/Modifiers#AI_behavior



--[[A married couple's fertility decides the ability and likelihood of conception. With DLC icon Conclave.png Conclave DLC active, it is recommended to get the ambition Groom an Heir Groom an Heir, which increases fertility by +20%. Without the DLC icon Conclave.png Conclave DLC activated, the ambition Have a Son/Daughter Have a Son/Daughter increases fertility by +25%.

It is also possible for the wife to get Pregnant through events, e.g., if the male character becomes rather angry with the death of his firstborn son, or through Seduction focus events.

	Two months after conception, the player will be notified and the wife will gain the Pregnant trait and approximately seven months later, a child will be born.

	Note that pregnant women can be incapacitated by a Troubled Pregnancy, triggering a regency if she is a ruler in her own right; the Final Months of a pregnancy will always trigger a regency for female rulers unless the Pregnancy Flavor game rule has been set to "Limited" or "Off.".

			Pregnancy chance is also affected by FERTILITY_BASE_MULT = 0.5, and the following relationship multipliers: 
			
			Relationship 	Multiplier 	Modding
	Secondary wife or concubine 0.5 	SECONDARY_SPOUSE_FERTILITY_MULT
	Lover (not spouse) 			0.5 	NOT_SPOUSE_FERTILITY_MULT
	Spouse and lover 			1.5 	MARRIED_LOVERS_FERTILITY_MULT 
			
			
			
			
BIRTH

Essentially, everything is decided at birth and not at conception:

    Child's sex is a simple 50/50% chance
    As for congenital traits, each have an inheritance chance built in, which ranges from +15% to +50%
    There is a small chance of genetic traits randomly showing up at childbirth despite neither parent possessing any trait
    The baby may get the Sickly trait and the mother may die while giving birth
    Whether or not a pregnancy results in Twin , it is decided at conception; all of the twins' traits (including their genders) are decided at birth, as usual.
    
    
    
    Characters whose parents have shared ancestors are at risk of being born with the Inbred trait, severely limiting their skills, fertility, and lifespan.

The risk is higher when the parents are more closely related (specifically, with more shared ancestors). As such, it is recommended to maintain a high degree of separation when marrying and avoid union between close relatives, unless there is a significant advantage.

The chance of the Inbred and Lunatic traits depends on the number of unique ancestors the child has in the past five generations (the first of the five generations being their parents), with a 0% chance of both when all ancestors are unique, rapidly increasing as the number of ancestors shrinks. Missing ancestors (i.e., characters without parents) are assumed to all be unique.
Number of unique ancestors 	Chance of Inbred 	Chance of Lunatic
At least 32 				0-10% 					0-2%
28-31 						23.25-25.5% 			4.65-5.1%
23-27 						35-39% 					7-7.8%
18-22 						80-88%				 	16-17.6%
17 or fewer 				100%				 	27-36.6%

Once inbreeding has taken root, it has a 25% chance of being passed on to the affected character's children (assuming this marriage is not also incestuous, in which case it is amplified by the above chances). Therefore, it is difficult to uproot.

Inbreeding is also a major concern for Zoroastrians and others who benefit from incestuous marriages. Thus, concubinage becomes particularly important for them.

			
			]]--