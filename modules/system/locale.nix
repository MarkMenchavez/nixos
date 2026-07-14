{ ... }:

{
    time.timeZone = "Asia/Singapore";

    i18n.defaultLocale = "en_SG.UTF-8";
    i18n.extraLocaleSettings = {
        LC_TIME = "en_SG.UTF-8";
        LC_MONETARY = "en_SG.UTF-8";
    };

    console = {
        font = "Lat2-Terminus16";
        keyMap = "us";
        #useXkbConfig = true;
    };
}
