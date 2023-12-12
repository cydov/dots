function ffsearch -d "Search fonts"
    fc-list --format="%{family[0]}\n" | sort | uniq
end    