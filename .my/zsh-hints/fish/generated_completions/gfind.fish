# gfind
# Autogenerated from man page /usr/local/share/man/man1/gfind.1
complete -c gfind -s P --description 'Never follow symbolic links.   This is the default behaviour.'
complete -c gfind -s L --description 'Follow symbolic links.'
complete -c gfind -s H --description 'Do not follow symbolic links, except while processing the command line argume…'
complete -c gfind -s D --description 'Print diagnostic information; this can be helpful to diagnose problems with w…'
complete -c gfind -o Olevel --description 'Enables query optimisation.'
complete -c gfind -o print --description 'is used (but you should probably consider using.'
complete -c gfind -o print0 --description 'instead, anyway).'
complete -c gfind -s O --description 'must appear before the first path name, if at all.   A double dash.'
complete -c gfind -o noleaf --description 'If you later use the.'
complete -c gfind -o type --description 'predicate will always match against the type of the file that a symbolic link…'
complete -c gfind -o delete --description 'can give rise to confusing behaviour.  Using.'
complete -c gfind -o lname --description 'and.'
complete -c gfind -o ilname --description 'predicates always to return false.'
complete -c gfind -o maxdepth --description '.'
complete -c gfind -o newer --description 'will be dereferenced, and the timestamp will be taken from the file to which …'
complete -c gfind -o newerXY --description '.'
complete -c gfind -o anewer --description 'and.'
complete -c gfind -o cnewer --description '.'
complete -c gfind -o follow --description 'option has a similar effect to.'
complete -c gfind -o name --description 'and.'
complete -c gfind -o regex --description 'are performed first.  2 Any.'
complete -c gfind -o xtype --description 'tests are performed after any tests based only on the names of files, but bef…'
complete -c gfind -o fstype --description 'FOO predicate and specify a filesystem type FOO which is not known (that is, …'
complete -c gfind -o false --description '3 At this optimisation level, the full cost-based query optimiser is enabled.'
complete -c gfind -s o --description 'predicates which are likely to succeed are evaluated earlier, and for.'
complete -c gfind -s a --description 'predicates which are likely to fail are evaluated earlier.'
complete -c gfind -o empty --description 'test for example is true only when the current file is empty.'
complete -c gfind -o depth --description 'option for example makes find traverse the file system in a depth-first order.'
complete -c gfind -o regextype --description 'option for example is positional, specifying the regular expression dialect f…'
complete -c gfind -o prune --description 'or.'
complete -c gfind -o daystart --description 'Measure times (for.'
complete -c gfind -o amin --description '.'
complete -c gfind -o atime --description '.'
complete -c gfind -o cmin --description '.'
complete -c gfind -o ctime --description '.'
complete -c gfind -o mmin --description 'and.'
complete -c gfind -o mtime --description 'from the beginning of today rather than from 24 hours ago.'
complete -c gfind -o iregex --description 'tests which occur later on the command line.'
complete -c gfind -o warn -o nowarn --description 'Turn warning messages on or off.'
complete -c gfind -s d --description 'A synonym for -depth, for compatibility with FreeBSD, NetBSD, MacOS X and Ope…'
complete -c gfind -o help -l help --description 'Print a summary of the command-line usage of find and exit.'
complete -c gfind -o ignore_readdir_race --description 'Normally, find will emit an error message when it fails to stat a file.'
complete -c gfind -o mindepth --description 'Do not apply any tests or actions at levels less than levels (a non-negative …'
complete -c gfind -o mount --description 'Don\'t descend directories on other filesystems.   An alternate name for.'
complete -c gfind -o xdev --description 'for compatibility with some other versions of find .'
complete -c gfind -o noignore_readdir_race --description 'Turns off the effect of.'
complete -c gfind -o version -l version --description 'Print the find version number and exit.'
complete -c gfind -o samefile --description 'allow comparison between the file currently being examined and some reference…'
complete -c gfind -s n --description 'for less than n , n for exactly n .'
complete -c gfind -o executable --description 'Matches files which are executable and directories which are searchable (in a…'
complete -c gfind -o perm --description 'test ignores.'
complete -c gfind -o printf --description 'with the %F directive to see the types of your filesystems.'
complete -c gfind -o gid --description 'File\'s numeric group ID is n.'
complete -c gfind -o group --description 'File belongs to group gname (numeric group ID allowed).'
complete -c gfind -o iname --description 'Like.'
complete -c gfind -o inum --description 'File has inode number n.   It is normally easier to use the.'
complete -c gfind -o ipath --description 'Like.'
complete -c gfind -o path --description 'but the match is case insensitive.'
complete -c gfind -o iwholename --description 'See -ipath.   This alternative is less portable than.'
complete -c gfind -o links --description 'File has n links.'
complete -c gfind -o nogroup --description 'No group corresponds to file\'s numeric group ID.'
complete -c gfind -o nouser --description 'No user corresponds to file\'s numeric user ID.'
complete -c gfind -o mode --description 'All of the permission bits mode are set for the file.'
complete -c gfind -o 000 --description '.'
complete -c gfind -o readable --description 'Matches files which are readable.'
complete -c gfind -o size --description 'File uses n units of space, rounding up.'
complete -c gfind -o ls --description 'The + and - prefixes signify greater than and less than, as usual, but bear i…'
complete -c gfind -o 1M --description '.'
complete -c gfind -o true --description 'Always true.'
complete -c gfind -o uid --description 'File\'s numeric user ID is n.'
complete -c gfind -o used --description 'File was last accessed n days after its status was last changed.'
complete -c gfind -o user --description 'File is owned by user uname (numeric user ID allowed).'
complete -c gfind -o wholename --description 'See -path.   This alternative is less portable than.'
complete -c gfind -o writable --description 'Matches files which are writable.'
complete -c gfind -o context --description '(SELinux only) Security context of the file matches glob pattern.'
complete -c gfind -o exec --description 'Execute command; true if 0 status is returned.'
complete -c gfind -o execdir --description 'option instead.'
complete -c gfind -o fls --description 'True; like.'
complete -c gfind -o fprint --description 'The output file is always created, even if the predicate is never matched.'
complete -c gfind -o fprint0 --description 'True; like.'
complete -c gfind -o fprintf --description 'True; like.'
complete -c gfind -o ok --description 'Like.'
complete -c gfind -o okdir --description 'Like.'
complete -c gfind -s 0 --description 'option of xargs .'
complete -c gfind -o 'fstype.' --description '%g File\'s group name, or numeric group ID if the group has no name.'
complete -c gfind -o quit --description 'Exit immediately.'
complete -c gfind -o not --description 'Same as ! expr, but not POSIX compliant.'
complete -c gfind -o 'ok;' --description 'while the `LC_MESSAGES\' variable selects the actual pattern used to interpret…'
complete -c gfind -o 444 --description 'or.'
complete -c gfind -o a+r --description 'have at least one write bit set (.'
complete -c gfind -o or --description '.'
complete -c gfind -o 'D	4.3.1' --description '.'
complete -c gfind -o 'O	4.3.1' --description '.'
complete -c gfind -o 'readable	4.3.0' --description '.'
complete -c gfind -o 'writable	4.3.0' --description '.'
complete -c gfind -o 'executable	4.3.0' --description '.'
complete -c gfind -o 'regextype	4.2.24' --description '.'
complete -c gfind -o 'execdir	4.2.12	BSD' --description '.'
complete -c gfind -o 'okdir	4.2.12' --description '.'
complete -c gfind -o 'samefile	4.2.11' --description '.'
complete -c gfind -o 'H	4.2.5	POSIX' --description '.'
complete -c gfind -o 'L	4.2.5	POSIX' --description '.'
complete -c gfind -o 'P	4.2.5	BSD' --description '.'
complete -c gfind -o 'delete	4.2.3' --description '.'
complete -c gfind -o 'quit	4.2.3' --description '.'
complete -c gfind -o 'd	4.2.3	BSD' --description '.'
complete -c gfind -o 'wholename	4.2.0' --description '.'
complete -c gfind -o 'iwholename	4.2.0' --description '.'
complete -c gfind -o 'ignore_readdir_race	4.2.0' --description '.'
complete -c gfind -o 'fls	4.0' --description '.'
complete -c gfind -o 'ilname	3.8' --description '.'
complete -c gfind -o 'iname	3.8' --description '.'
complete -c gfind -o 'ipath	3.8' --description '.'
complete -c gfind -o 'iregex	3.8' --description 'The syntax . B -perm +MODE was removed in findutils-4. 5. 12, in favour of .'

