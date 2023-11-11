function reset-spotify --description '"Fixes" being able to login to Spotify'
    # On Mac, when someone (a.k.a. a teenager) logs out my Spotify on a
    # different machine, it utterly breaks Spotify. Blank UI, no ability to
    # logout. By removing the preferences, it re-enables logging in on Mac.
    rm -rf ~/Library/Application\ Support/Spotify
end
