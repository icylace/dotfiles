# gupdatedb
# Autogenerated from man page /usr/local/share/man/man1/gupdatedb.1
complete -c gupdatedb -l findoptions -o 'option2...\'' --description 'Global options to pass on to find.'
complete -c gupdatedb -l localpaths --description 'Non-network directories to put in the database.  Default is /.'
complete -c gupdatedb -l netpaths --description 'Network (NFS, AFS, RFS, etc. ) directories to put in the database.'
complete -c gupdatedb -l prunepaths --description 'Directories to not put in the database, which would otherwise be.'
complete -c gupdatedb -l prunefs --description 'File systems to not put in the database, which would otherwise be.'
complete -c gupdatedb -l output --description 'The database file to build.  Default is system-dependent.'
complete -c gupdatedb -l localuser --description 'The user to search non-network directories as, using su(1).'
complete -c gupdatedb -l netuser --description 'The user to search network directories as, using su(1).  Default is daemon.'
complete -c gupdatedb -l old-format --description 'Create the database in the old format.'
complete -c gupdatedb -l dbformat --description 'Create the database in format F.   The default format is called LOCATE02.'
complete -c gupdatedb -l version --description 'Print the version number of  updatedb and exit.'
complete -c gupdatedb -l help --description 'Print a summary of the options to updatedb and exit.'

