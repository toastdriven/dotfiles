function dex -a path --description '(Safely) Copies a .example file to non-example'
    set new_path (string replace ".example" "" $path)
    cp -i $path $new_path
end
