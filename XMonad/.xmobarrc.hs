Config {

          font =                  "xft:Monospace Regular:size=12:antialias=true"
        , bgColor =               "#282828"
        , fgColor =               "#838383"
        , position =              Bottom

        , sepChar =               "%"
        , alignSep =              "}{"
        , template =              " %memory% | %dynnetwork% | %ip% } %date% { %EGMD%  "

        , commands =              [ Run Weather "EGMD"  [ "--template"
                                                        , "Wind: <fc=#4682b4><windAzimuth></fc>° <fc=#4682b4><windKnots></fc>kt | \
                                                        \ Temp: <fc=#4682b4><tempC></fc>° / <fc=#4682b4><dewPointC></fc>° | \
                                                        \ RH: <fc=#4682b4><rh></fc>% | \
                                                        \ Px: <fc=#4682b4><pressure></fc>hPa | \
                                                        \ Sky: <fc=#4682b4><skyCondition></fc>" 
                                                        ] 9000

                                  , Run Memory          [ "--template" , "Mem: <usedratio>%"
                                                        , "--Low"      , "20"         -- units: %
                                                        , "--High"     , "90"         -- units: %
                                                        , "--low"      , "darkgreen"
                                                        , "--normal"   , "darkorange"
                                                        , "--high"     , "darkred"
                                                        ] 10

                                  , Run DynNetwork      [ "--template" , "<dev>: up <tx>kB/s  dn <rx>kB/s"
                                                        , "--Low"      , "8000"       -- units: B/s
                                                        , "--High"     , "1500000"    -- units: B/s
                                                        , "--high"     , "darkgreen"
                                                        , "--normal"   , "darkorange"
                                                        , "--low"      , "darkred"
                                                        ] 10

                                  , Run Date            "%a %d %b %Y <fc=#c1c1c1>%H:%M:%S</fc> %Z" "date" 10 

                                  , Run Com             "/usr/bin/hostname" ["-I"] "ip" 50 
                                  ]
}
