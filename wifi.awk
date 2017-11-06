
/^BSS / {
    MAC = $2
}
/SSID/ {
    wifi[MAC]["SSID"] = $2
}
/primary channel/ {
    wifi[MAC]["channel"] = $NF
}

# Insert new block here

END {
    printf "%s\t\t%s\n","SSID","channel"

    for (w in wifi) {
        printf "%s\t\t%s\n",wifi[w]["SSID"],wifi[w]["channel"]
    }
}
