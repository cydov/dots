#!/usr/bin/env fish

function ascii -d "create ascii art"

    set artDir ~/ascii-art

    # Create ASCII Art for fun!
    # Export to a file and the clipboard

    printf "Enter a word for the art!"
    read inval

    set artFile "$artDir/$inval.ascii"

    if test ! -d $artDir
        mkdir "$artDir"
        touch "$artFile"
    else if test ! -f "$artFile"
        touch "$artFile"
    end

    echo "cat <<\"EOE\"" > "$artFile"

    set font "graceful"
    set filter "border"
    set filters "crop" "rainbow" "metal" "flip" "flop" "180" "left" "right" "border"

    if test x* "$argv[1]"
        if test -f /usr/share/figlet/$argv[1].flf
            set font "$argv[1]"
        end
    end

    if test x* "$argv[2]"
        for i in $filters;
            if test "$argv[2]" == "$i" 
                set filter "$argv[2]"
            end;
        end
    end

    toilet -f "$font" --filter "$filter" "$inval" >> "$artFile"

    echo "" >> "$artFile"
    echo "EOE" >> "$artFile"

    set lines $( cat $artFile )
    copyq copy "$lines"

    echo "Done! File created @ $artFile and the art was placed in the clipboard!"

end
