#!/bin/bash

declare -A arts

arts[anonymous1]="                                        
                                        
      .......             ..........    
   ..###........             ......  .  
  .######...##...        ..##.... ...   
 .#####.     .####     .##.             
 #####.        ###.                   . 
 ############.#####.      ..#######. .  
.######........####.      ........    . 
.######        .###.                  ..
 #####.       .####.                   .
 #####    ..#######.                  ..
 .#####. .#########.               .... 
  #################. .....      .#..#   
  .#####################.     .##. .    
   .################..##########. .     
    .########...##.....#.....    .  .   
     .#########..                  .    
      .##########..###.          ..     
        .#######   ###.         .       
         ..#####  .####       ..        
           ..#### .####    ...          
              .###.###. ...             
                 ..###...               
                    ##                  
"

arts[anonymous2]="                                        
          .....................         
    ...###.......      ........##...    
   ##..                          ..##.  
  .#.                              .#.  
  .#.     .....          .....     .#.  
  .#.  ......###.      .###......  .#.  
  .#.         .###    ###.         .#.  
  .#.   ....... .      . .......   .#.  
  .#.   .......           ......   .#.  
  .#.                              .#.  
  .#.                              .#.  
  .#.                              .#.  
   ##   ..        ....        ...  ##   
   .##   .#.    ..#####.    .##   .#.   
    .#.   .########..########.   .#.    
     .#.    ......    .......   .#.     
      .##                      .#.      
        .#.       .###       .##.       
         ..#..    ####     .##.         
            .##.. #### ..##..           
              ...######...              
                   ..                   
                                        
"

arts[mr_robot]="                                        
            .###############            
       .######.           #######       
    .####                      .###.    
  .###                            ###.  
 .##.                               ### 
 ##.                                .## 
 ####                              .### 
 ##### .##..####.      .####..##. ##.## 
 #####.       .####  ####.        ##### 
 ####  ..        .    #        ..  .### 
.##    #  ######.    . .######  #    ##.
.##     .#.   #.  .  .  .#.  .#.     .##
##.     .        #    ..       .     .##
##.  .#.        .       .       .#.  .##
.## .##############################. ##.
##. .###     .####.  .####.     ###. .##
 .##.#############################. ### 
  .##.  .#####.  .#####  ######.  .##.  
    ##.       ############       .##.   
    .##          .####.          ##.    
    .##.                         ##.    
     .##.                       ##.     
       ###                    ###.      
        .###.               ###.        
           #####        .####.          
              .###########              
                   .#                   
"

arts[skull]="                                        
                ..####..                
             ..##########..             
            ################            
          .##################.          
          ###....######....###          
         .##      ####      ##.         
          ##     .####.     ##          
          .##...########...##.          
           #######.  .#######           
            ..####....#####..           
  ..         . .########...         ..  
 ####.       ##..........##       .#### 
######..      ####...#####      ..######
 .....###..   ...######...   ..###..... 
        ..###..          ..###..        
            ..###..  ..###..            
               ..######..               
              ..###..###..              
       .....###..      ..###.....       
     .######..            ..######.     
      .####                  ####.      
       .##.                  .###       
"

arts[glider1]="                                        
                .######.                
               ##########               
              .###########              
              .##########.              
                ########                
                                        
                                        
                              .#######. 
                             ##########.
                            .###########
                             ##########.
                              .#######  
                                        
                                        
 .########      ########.     ########. 
.##########   .##########.   ###########
###########.  .##########.  .###########
.##########    ##########    .#########.
  .######        ######.       ######.  
     #.            ..            .#     
"

arts[glider2]="                                        
              .###########              
              .###########              
              .###########              
              .###########              
              .###########              
                                        
                                        
                            .###########
                            .###########
                            .###########
                            .###########
                            .###########
                                        
                                        
###########.  .###########  .###########
###########.  .###########  .###########
###########.  .###########  .###########
###########.  .###########  .###########
###########.  .###########  .###########
###########.  .###########  .###########
"

left="║"
right="│"
top="─"
bottom="─"
top_right="█"
bottom_right="█"
top_left="█"
bottom_left="█"
box_end_str="║\n║\n▀"

msg_max_len=40

declare -A colors
nc='\033[0m'
colors[red]='\033[0;31m'
colors[green]='\033[0;32m'
colors[blue]='\033[0;34m'
colors[purple]='\033[0;35m'
colors[cyan]='\033[0;36m'
colors[yellow]='\033[1;33m'

IFS=$'\n'

declare -a final_lines
declare -a ascii_art_lines
declare -a textbox_lines
declare -i ascii_art_max_column
ascii_art_max_column=0

print_array() {
    local IFS="$1"
    shift
    printf "[$*]"
}

help() {
    printf "Usage: haxr-say [OPTIONS] text\n\n"
    printf " ${colors[cyan]}1337$nc text in ${colors[green]}1337$nc box with ${colors[red]}1337$nc ascii art\n\n"
    printf "  -a, --art\tAscii art to use (default anonymous1)\n"
    printf "\t Arts: "
    print_array "," "${!arts[@]}"
    printf "\n\n"
    printf "  -c, --color\tColor to use\n"
    printf "\t Colors: "
    print_array "," "${!colors[@]}"
    printf "\n\n"
    printf "  -l, --lol\tRainbow output\n"
    printf "  -e, --leet\tMake text m0r3 ${colors[green]}1337$nc\n"
    printf "  -h, --help\tShow this message\n"
}

make_leet() {
    local IFS=' '
    printf "$*" | sed 's/e/3/g' | sed 's/o/0/g' | sed 's/a/4/g' | sed 's/E/3/g' | sed 's/O/0/g' | sed 's/A/4/g'
}

make_textbox() {
    msg="$@"
    msg_len=${#msg}

    if ((msg_len > msg_max_len)); then
        msg_len=$msg_max_len
    fi

    border_len=$(($msg_len + 2))

    top_side=$(printf "$top_left%${border_len}s$top_right" | sed "s/ /$top/g")
    bottom_side=$(printf "$bottom_left%${border_len}s$bottom_right" | sed "s/ /$top/g")

    textbox_lines+=("$top_side")
    for l in $(printf $msg | sed -r "s/(.{$msg_max_len})/\1\n/g"); do
        textbox_lines+=($(printf "$left %-${msg_len}s $right\n" "$l"))
    done
    textbox_lines+=("$bottom_side")
    textbox_lines+=($(printf "$box_end_str"))
}

make_ascii_art() {
    art=("$@")
    art_lines_n=${#art[@]}

    for line in ${art[@]}; do
        l=${#line}

        if ((l > ascii_art_max_column)); then
            ascii_art_max_column=l
        fi

        ascii_art_lines+=("$line")
    done
}

say() {
    art="$1"
    shift
    msg=$@

    make_ascii_art "$art"
    make_textbox "$msg"

    ascii_art_lines_n=${#ascii_art_lines[@]}
    textbox_lines_n=${#textbox_lines[@]}

    textbox_start_line=4
    # textbox_start_line=$(((ascii_art_lines_n / 2) - (textbox_lines_n / 2)))

    if ((textbox_start_line < 0)); then
        textbox_start_line=0
    fi

    textbox_end_line=$((textbox_start_line + textbox_lines_n))

    for ((i = 0; i < ascii_art_lines_n; i++)); do
        box_line=""
        if ((i >= textbox_start_line && i < textbox_end_line)); then

            box_line="${textbox_lines[(i - textbox_start_line)]}"
        fi

        printf "%s    %s\n" "${ascii_art_lines[i]}" "$box_line"
    done

    if ((textbox_end_line > ascii_art_lines_n)); then
        for ((i = textbox_lines_n - textbox_lines_n + ascii_art_lines_n; i < textbox_lines_n; i++)); do
            box_line="${textbox_lines[$i]}"
            printf "%${ascii_art_max_column}s    %s\n" "" "$box_line"
        done
    fi
}

msg=()
lol=false
leet=false
use_color=false

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
    -c | --color)
        color="$2"
        use_color=true
        shift
        shift
        ;;
    -a | --art)
        art_name="$2"
        shift
        shift
        ;;
    -l | --lol)
        lol=true
        shift
        ;;
    -e | --leet)
        leet=true
        shift
        ;;
    -h | --help)
        help
        exit 0
        ;;
    *)
        msg+=("$1")
        shift
        ;;
    esac
done

if [[ ! ${msg[@]} ]]; then
    if [ ! -t 0 ]; then
        msg+=($(cat -))
    else
        printf "${colors[red]}* Empty input! *$nc\n\n"
        help
        exit 0
    fi
fi

if [[ ! $use_color ]] && [[ ! -v colors[$color] ]]; then
    printf "Invalid color: $color\n"
    exit 1
fi

if $leet; then
    msg=($(make_leet "${msg[@]}"))
fi

if $lol && $use_color; then
    printf "You cannot use --lol and --color at the same time\n"
    exit 1
fi

if [[ ! -v arts[$art_name] ]]; then
    art_name="anonymous1"
fi

if $use_color; then
    printf "${colors[$color]}"
    say "${arts[$art_name]}" "${msg[@]}"
    printf "$nc"
else
    if $lol; then
        if ! command -v lolcat &>/dev/null; then
            echo "lolcat is not installed!"
            exit 1
        fi

        say "${arts[$art_name]}" "${msg[@]}" | lolcat
    else
        say "${arts[$art_name]}" "${msg[@]}"
    fi
fi
