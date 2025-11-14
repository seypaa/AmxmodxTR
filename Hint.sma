#include <amxmodx>
#include <reapi>

public plugin_init()
{
    register_plugin("HintMessageEx Custom", "1.0", "seypaa");

    RegisterHookChain(RG_CBasePlayer_HintMessageEx, "HC_HintMessageEx_Pre", false);
}

public HC_HintMessageEx_Pre(const id, const message[], Float:duration, bool:bDisplayIfPlayerDead, bool:bOverride)
{
    if (!is_user_connected(id))
        return HC_CONTINUE;

    // Örnek: bütün hint'leri kendi Türkçe metninle değiştir
    // (veya burada condition koy, sadece belirli mesajları değiştir)
    // Önce orijinali iptal et:
    SetHookChainReturn(ATYPE_BOOL, false);
    
    // Yeni hint'i biz basıyoruz:
    // duration'ı istersen aynı kullan, istersen değiştir
    rg_hint_message(id, "Bu hint benim tarafimdan override edildi!", duration, 0.5, 0.5);

    return HC_SUPERCEDE;
}