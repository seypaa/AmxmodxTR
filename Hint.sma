#include <amxmodx>
#include <reapi>

public plugin_init()
{
    register_plugin("HintMessageEx Logger", "1.0", "seypaa");

    // GERÇEK hookchain: RG_CBasePlayer_HintMessageEx
    RegisterHookChain(RG_CBasePlayer_HintMessageEx, "HC_HintMessageEx_Pre", false);
}

// Pre: mesaj gönderilmeden önce çağrılır
public HC_HintMessageEx_Pre(const id, const message[], Float:duration, bool:bDisplayIfPlayerDead, bool:bOverride)
{
    if (!is_user_connected(id))
        return HC_CONTINUE;

    // Konsola logla
    server_print("[HintEx] id=%d msg='%s' dur=%.2f deadAllowed=%d override=%d",
        id, message, duration, bDisplayIfPlayerDead, bOverride);

    return HC_CONTINUE; // Oyunun normal mesajı devam etsin
}