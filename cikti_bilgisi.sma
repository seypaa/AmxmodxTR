
#include <amxmodx>
#include <amxmisc>
#include <reapi>

#define PLUGIN "Cikis Bilgisi"
#define VERSION "v1.0"
#define AUTHOR "seypa"

new const config_name[] = "cikti_bilgisi.txt"

new bilgi[4][MAX_STRING_LENGTH]

public plugin_init()
{
	register_plugin(PLUGIN, VERSION, AUTHOR)
	RegisterHookChain(RH_SV_DropClient,"oyuncu_cikti",1)

}

public oyuncu_cikti(const client, bool:crash, const fmt[])
{

	static szName[MAX_NAME_LENGTH];get_user_name(client,szName,charsmax(szName))


	if(equal(fmt,"Client sent 'drop'"))
	{
		bilgi[3] = "%sNormal Cikis"
		bilgi[2] = ""
		bilgi[1] = ""
		bilgi[0] = ""
		client_print_color(0,print_team_default,"^3%s ^4isimli oyuncumuz oyundan ayrildi.",szName)

	}
	if(equal(fmt,"Timed out"))
	{
		bilgi[3] = ""
		bilgi[2] = "Zaman Asimi"
		bilgi[1] = ""
		bilgi[0] = ""
		client_print_color(0,print_team_red,"^3%s ^1isimli oyuncumuz zaman asimina ugradi.",szName)
	
	
	}
	if(equal(fmt,"Kicked"))
	{
		bilgi[3] = ""
		bilgi[2] = ""
		bilgi[1] = "Oyundan Atildi"
		bilgi[0] = ""
	
		client_print_color(0,print_team_red,"^3%s ^1isimli oyuncumuz sunucudan atildi.",szName)
	
	
	}
	if(equal(fmt,"Dropping fakeclient on level change"))
	{
		bilgi[3] = ""
		bilgi[2] = ""
		bilgi[1] = ""
		bilgi[0] = "Botlar harita degisim esnasinda oyundan atildi"



	}
	else
	{
		if(crash)
		client_print_color(0,print_team_red,"^3%s ^1adli oyuncumuz client kaynakli hata aldi.",szName)
	}
	

	new szPath[PLATFORM_MAX_PATH],mapname[64]
	get_configsdir(szPath,charsmax(szPath))
	get_mapname(mapname,charsmax(mapname))

	formatex(szPath, charsmax(szPath), "%s/%s_%s", szPath,mapname,config_name)

	log_to_file(szPath, "Isim:%s 	Aciklama: <%s> <%s> <%s> <%s>", szName ,bilgi[3],bilgi[2],bilgi[1],bilgi[0]);

}
