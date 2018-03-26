# uustat
# Autogenerated from man page /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/share/man/man1/uustat.1
complete -c uustat -s a -l all --description 'List all queued file transfer requests.'
complete -c uustat -s e -l executions --description 'List queued execution requests rather than queued file transfer requests.'
complete -c uustat -s s -l system --description 'List all jobs queued up for the named system.'
complete -c uustat -s S -l not-system --description 'List all jobs queued for systems other than the one named.'
complete -c uustat -s u -l user --description 'List all jobs queued up for the named user.'
complete -c uustat -s U -l not-user --description 'List all jobs queued up for users other than the one named.'
complete -c uustat -s c -l command --description 'List all jobs requesting the execution of the named command.'
complete -c uustat -s C -l not-command --description 'List all jobs requesting execution of some command other than the named comma…'
complete -c uustat -s o -l older-than --description 'List all queued jobs older than the given number of hours.'
complete -c uustat -s y -l younger-than --description 'List all queued jobs younger than the given number of hours.'
complete -c uustat -s k -l kill --description 'Kill the named job.'
complete -c uustat -s r -l rejuvenate --description 'Rejuvenate the named job.'
complete -c uustat -s q -l list --description 'Display the status of commands, executions and conversations for all remote s…'
complete -c uustat -s m -l status --description 'Display the status of conversations for all remote systems.'
complete -c uustat -s p -l ps --description 'Display the status of all processes holding UUCP locks on systems or ports.'
complete -c uustat -s i -l prompt --description 'For each listed job, prompt whether to kill the job or not.'
complete -c uustat -s K -l kill-all --description 'Automatically kill each listed job.'
complete -c uustat -s R -l rejuvenate-all --description 'Automatically rejuvenate each listed job.'
complete -c uustat -s M -l mail --description 'For each listed job, send mail to the UUCP administrator.'
complete -c uustat -s N -l notify --description 'For each listed job, send mail to the user who requested the job.'
complete -c uustat -s W -l comment --description 'Specify a comment to be included in mail sent with the  -M,  --mail,  -N, or …'
complete -c uustat -s B -l mail-lines --description 'When the  -M,  --mail,  -N, or  --notify options are used to send mail about …'
complete -c uustat -s Q -l no-list --description 'Do not actually list the job, but only take any actions indicated by the  -i,…'
complete -c uustat -s x -l debug --description 'Turn on particular debugging types.'
complete -c uustat -s I -l config --description 'Set configuration file to use.'
complete -c uustat -s v -l version --description 'Report version information and exit.'
complete -c uustat -l 'system.' --description '.'
complete -c uustat -l 'user.' --description '.'
complete -c uustat -l 'command.' --description '.'
complete -c uustat -s j --description 'or.'
complete -c uustat -l jobid --description 'option to uucp (1) or uux (1).'
complete -c uustat -l 'kill-all.' --description '.'
complete -c uustat -l help --description 'Print a help message and exit.  EXAMPLES uustat --all.'

