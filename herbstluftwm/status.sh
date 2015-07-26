#!/bin/sh

nowPlaying() {
    cur=`mpc -f "%title% - %artist%" current`
    test -n "$cur" && echo "%{T2}%{T1} $cur" || echo "- stopped -"
}

volume(){
    echo "Todo: Volume"
}

clock(){
    d=`date "+%I:%M %P"`
    echo "%{T2} %{T1} $d"
}

#formats tag labels for display
formatTag() {
    input=$1
    name=${input:1}
    stat=${input:0:1}

    case $stat in
        ".")
            echo "%{T2 F#808080}  %{T1 F-}"
            ;;
        "!")
            echo "%{T2 F#f4343f}  %{T1 F-}"
            ;;
        "#")
            echo "%{T2}  %{T1}"
            ;;
        *)
            echo "%{T2 F#808080}  %{T1F-}"
    esac
}

workspaces() {
    tags=`herbstclient tag_status`
    out=""
    for tag in $tags 
    do
        out="${out} $(formatTag $tag)"
    done
    echo $out
}



while :; do
    buf="%{c}"
    buf="${buf} $(workspaces)  "
    buf="${buf} %{l}"
    buf="${buf} $(clock)"
    buf="${buf} %{r}"
    buf="${buf} $(nowPlaying)"
    echo "$buf %{S+} $buf"
    sleep 0.2
done
