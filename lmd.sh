function lmd() { 
    WRAP='echo $(for width in $(seq 1 $COLUMNS);do printf "=";done;)';
    export LS_COLORS='rs=0:di=07;40;37:ln=01;04;36:mh=00:pi=40;33:so=01;31:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;04;31:*.tgz=01;04;31:*.arc=01;04;31:*.arj=01;04;31:*.taz=01;04;31:*.lha=01;04;31:*.lz4=01;04;31:*.lzh=01;04;31:*.lzma=01;04;31:*.tlz=01;04;31:*.txz=01;04;31:*.tzo=01;04;31:*.t7z=01;04;31:*.zip=01;04;31:*.z=01;04;31:*.dz=01;04;31:*.gz=01;04;31:*.lrz=01;04;31:*.lz=01;04;31:*.lzo=01;04;31:*.xz=01;04;31:*.zst=01;04;31:*.tzst=01;04;31:*.bz2=01;04;31:*.bz=01;04;31:*.tbz=01;04;31:*.tbz2=01;04;31:*.tz=01;04;31:*.deb=01;04;31:*.rpm=01;04;31:*.jar=01;04;31:*.war=01;04;31:*.ear=01;04;31:*.sar=01;04;31:*.rar=01;04;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.cfg=00;32:*.conf=00;32:*.diff=00;32:*.doc=00;32:*.ini=00;32:*.log=00;32:*.patch=00;32:*.pdf=00;32:*.ps=00;32:*.tex=00;32:*.txt=00;32:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
    LS_CMD='/usr/local/bin/gls -FAC  --color=auto --group-directories-first'

    # For BASH
    export PROMPT_COMMAND='eval $WRAP && $LS_CMD && eval $WRAP';
    # For ZSH
    precmd () { eval $WRAP;eval $LS_CMD;eval $WRAP;}

    alias cl='clear';
    alias qq='rmd';
    return 0;
}

function rmd() {
   # For ZSH
   precmd () { }
   # For BASH
   unset PROMPT_COMMAND;
   unset WRAP;
   unset LS_CMD;
   unset HIST_CHK;
   unset CL_OR_NOT;

   unalias cl;
   unalias qq;
}
