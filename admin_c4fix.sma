#include <amxmodx>
#include <reapi>

public plugin_init()
{
	register_plugin("C4 Sadece Adminlerde", "1.1", "seypa")
	RegisterHookChain(RG_CSGameRules_GiveC4, "c4_yakala")
}

public c4_yakala() 
{
	new szOyuncu[32],admin_degiskeni[32],numsaydir, pzOyuncu
	get_players(szOyuncu, numsaydir, "ah") 
	
	if (!numsaydir)
		return 0
		
	for (--numsaydir; numsaydir >= 0; numsaydir--)
	{
		pzOyuncu=szOyuncu[numsaydir]
		
		if (get_member(szOyuncu[numsaydir], m_iTeam) == TEAM_TERRORIST && (get_user_flags(pzOyuncu) & ADMIN_BAN))
		{
			
			admin_degiskeni[numsaydir++] = pzOyuncu
			
			new player = random(admin_degiskeni[numsaydir]);
			 
			if (rg_give_item(player , "weapon_c4") > 0)
			{
				return HC_SUPERCEDE
			}		
		}
	}
	
	return HC_CONTINUE
}
