function fc-list -d "Search fonts"
    /usr/bin/fc-list --format="%{family[0]}\n" | sort | uniq
end    