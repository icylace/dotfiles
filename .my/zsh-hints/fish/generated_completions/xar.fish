# xar
# Autogenerated from man page /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/share/man/man1/xar.1
complete -c xar -l compression --description 'Specifies the compression type to use.'
complete -c xar -s C --description 'On extract, xar will chdir to the specified path before extracting the archiv…'
complete -c xar -s a --description 'Synonym for --compression=lzma.'
complete -c xar -s j --description 'Synonym for --compression=bzip2.'
complete -c xar -s z --description 'Synonym for --compression=gzip.'
complete -c xar -l compression-args --description 'Specifies arguments to the compression engine selected.'
complete -c xar -l dump-toc --description 'Has xar dump the xml header into the specified file.'
complete -c xar -l dump-header --description 'Has xar print out the xar binary header information to stdout.'
complete -c xar -l extract-subdoc --description 'Extracts the specified subdocument to a document in cwd named <name>. xml.'
complete -c xar -l list-subdocs --description 'List the subdocuments in the xml header.'
complete -c xar -l toc-cksum --description 'Specifies the hashing algorithm to use for xml header verification.'
complete -c xar -l file-cksum --description 'Specifies the hashing algorithm to use for file content verification.'
complete -c xar -s l --description 'On archival, stay on the local device.'
complete -c xar -s P --description 'On extract, set ownership based on uid/gid.'
complete -c xar -s p --description 'On extract, set ownership based on symbolic names, if possible.'
complete -c xar -s s --description 'On extract, specifies the file to extract subdocuments to.'
complete -c xar -s v --description 'Verbose output.'
complete -c xar -l exclude --description 'Specifies a POSIX regular expression of files to exclude from adding to the a…'
complete -c xar -l rsize --description 'Specifies a size (in bytes) for the internal libxar read buffer while perform…'
complete -c xar -l coalesce-heap --description 'When multiple files in the archive are identical, only store one copy of the …'
complete -c xar -l link-same --description 'When the data section of multiple files are identical, hardlink them within t…'
complete -c xar -l no-compress --description 'Specifies a POSIX regular expression of files to archive, but not compress.'
complete -c xar -l prop-include --description 'Specifies a file property to be included in the archive.'
complete -c xar -l prop-exclude --description 'Specifies a file property to be excluded from the archive.'
complete -c xar -l distribution --description 'Creates an archive to only contain file properties safe for file distribution.'
complete -c xar -l keep-existing --description 'Does not overwrite existing files during extraction.'
complete -c xar -s k --description 'Synonym for --keep-existing.'
complete -c xar -s c --description 'Creates an archive.'
complete -c xar -s t --description 'Lists the contents of an archive.'
complete -c xar -s x --description 'Extracts an archive.'
complete -c xar -s f --description 'The filename to use for creation, listing or extraction.'
complete -c xar -l keep-setuid --description 'When extracting without -p or -P options, xar will extract files as the uid/g…'

