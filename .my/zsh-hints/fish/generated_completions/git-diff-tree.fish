# git-diff-tree
# Autogenerated from man page /Applications/Xcode.app/Contents/Developer/usr/share/man/man1/git-diff-tree.1
complete -c git-diff-tree -s p -s u -l patch --description 'Generate patch (see section on generating patches).'
complete -c git-diff-tree -s s -l no-patch --description 'Suppress diff output.'
complete -c git-diff-tree -o 'U<n>' -l unified --description 'Generate diffs with <n> lines of context instead of the usual three.'
complete -c git-diff-tree -l raw --description 'Generate the diff in raw format.  This is the default.'
complete -c git-diff-tree -l patch-with-raw --description 'Synonym for -p --raw.'
complete -c git-diff-tree -l indent-heuristic -l no-indent-heuristic -l compaction-heuristic -l no-compaction-heuristic --description 'These are to help debugging and tuning experimental heuristics (which are off…'
complete -c git-diff-tree -l minimal --description 'Spend extra time to make sure the smallest possible diff is produced.'
complete -c git-diff-tree -l patience --description 'Generate a diff using the "patience diff" algorithm.'
complete -c git-diff-tree -l histogram --description 'Generate a diff using the "histogram diff" algorithm.'
complete -c git-diff-tree -l stat --description 'Generate a diffstat.'
complete -c git-diff-tree -l numstat --description 'Similar to --stat, but shows number of added and deleted lines in decimal not…'
complete -c git-diff-tree -l shortstat --description 'Output only the last line of the --stat format containing total number of mod…'
complete -c git-diff-tree -l summary --description 'Output a condensed summary of extended header information such as creations, …'
complete -c git-diff-tree -l patch-with-stat --description 'Synonym for -p --stat.'
complete -c git-diff-tree -s z --description 'When --raw, --numstat, --name-only or --name-status has been given, do not mu…'
complete -c git-diff-tree -l name-only --description 'Show only names of changed files.'
complete -c git-diff-tree -l name-status --description 'Show only names and status of changed files.'
complete -c git-diff-tree -l submodule --description 'Specify how differences in submodules are shown.'
complete -c git-diff-tree -l color --description 'Show colored diff.  --color (i. e.'
complete -c git-diff-tree -l no-color --description 'Turn off colored diff.  It is the same as --color=never.'
complete -c git-diff-tree -l word-diff-regex --description 'Use <regex> to decide what a word is, instead of considering runs of non-whit…'
complete -c git-diff-tree -l color-words --description 'Equivalent to --word-diff=color plus (if a regex was specified) --word-diff-r…'
complete -c git-diff-tree -l no-renames --description 'Turn off rename detection, even when the configuration file gives the default…'
complete -c git-diff-tree -l check --description 'Warn if changes introduce conflict markers or whitespace errors.'
complete -c git-diff-tree -l ws-error-highlight --description 'Highlight whitespace errors on lines specified by <kind> in the color specifi…'
complete -c git-diff-tree -l full-index --description 'Instead of the first handful of characters, show the full pre- and post-image…'
complete -c git-diff-tree -l binary --description 'In addition to --full-index, output a binary diff that can be applied with gi…'
complete -c git-diff-tree -l abbrev --description 'Instead of showing the full 40-byte hexadecimal object name in diff-raw forma…'
complete -c git-diff-tree -s B -l break-rewrites --description 'Break complete rewrite changes into pairs of delete and create.'
complete -c git-diff-tree -s M -l find-renames --description 'Detect renames.'
complete -c git-diff-tree -s C -l find-copies --description 'Detect copies as well as renames.  See also --find-copies-harder.'
complete -c git-diff-tree -l find-copies-harder --description 'For performance reasons, by default, -C option finds copies only if the origi…'
complete -c git-diff-tree -s D -l irreversible-delete --description 'Omit the preimage for deletes, i. e.'
complete -c git-diff-tree -o 'l<num>' --description 'The -M and -C options require O(n^2) processing time where n is the number of…'
complete -c git-diff-tree -l diff-filter --description 'Select only files that are Added (A), Copied (C), Deleted (D), Modified (M), …'
complete -c git-diff-tree -o 'S<string>' --description 'Look for differences that change the number of occurrences of the specified s…'
complete -c git-diff-tree -o 'G<regex>' --description 'Look for differences whose patch text contains added/removed lines that match…'
complete -c git-diff-tree -l pickaxe-all --description 'When -S or -G finds a change, show all the changes in that changeset, not jus…'
complete -c git-diff-tree -l pickaxe-regex --description 'Treat the <string> given to -S as an extended POSIX regular expression to mat…'
complete -c git-diff-tree -o 'O<orderfile>' --description 'Output the patch in the order specified in the <orderfile>, which has one she…'
complete -c git-diff-tree -s R --description 'Swap two inputs; that is, show differences from index or on-disk file to tree…'
complete -c git-diff-tree -l relative --description 'When run from a subdirectory of the project, it can be told to exclude change…'
complete -c git-diff-tree -s a -l text --description 'Treat all files as text.'
complete -c git-diff-tree -l ignore-space-at-eol --description 'Ignore changes in whitespace at EOL.'
complete -c git-diff-tree -s b -l ignore-space-change --description 'Ignore changes in amount of whitespace.'
complete -c git-diff-tree -s w -l ignore-all-space --description 'Ignore whitespace when comparing lines.'
complete -c git-diff-tree -l ignore-blank-lines --description 'Ignore changes whose lines are all blank.'
complete -c git-diff-tree -l inter-hunk-context --description 'Show the context between diff hunks, up to the specified number of lines, the…'
complete -c git-diff-tree -s W -l function-context --description 'Show whole surrounding functions of changes.'
complete -c git-diff-tree -l exit-code --description 'Make the program exit with codes similar to diff(1).'
complete -c git-diff-tree -l quiet --description 'Disable all output of the program.  Implies --exit-code.'
complete -c git-diff-tree -l ext-diff --description 'Allow an external diff helper to be executed.'
complete -c git-diff-tree -l no-ext-diff --description 'Disallow external diff drivers.'
complete -c git-diff-tree -l textconv -l no-textconv --description 'Allow (or disallow) external text conversion filters to be run when comparing…'
complete -c git-diff-tree -l ignore-submodules --description 'Ignore changes to submodules in the diff generation.'
complete -c git-diff-tree -l src-prefix --description 'Show the given source prefix instead of "a/".'
complete -c git-diff-tree -l dst-prefix --description 'Show the given destination prefix instead of "b/".'
complete -c git-diff-tree -l no-prefix --description 'Do not show any source or destination prefix.'
complete -c git-diff-tree -l line-prefix --description 'Prepend an additional prefix to every line of output.'
complete -c git-diff-tree -l ita-invisible-in-index --description 'By default entries added by "git add -N" appear as an existing empty file in …'
complete -c git-diff-tree -s r --description 'recurse into sub-trees.'
complete -c git-diff-tree -s t --description 'show tree entry itself as well as subtrees.  Implies -r.'
complete -c git-diff-tree -l root --description 'When --root is specified the initial commit will be shown as a big creation e…'
complete -c git-diff-tree -l stdin --description 'When --stdin is specified, the command does not take <tree-ish> arguments fro…'
complete -c git-diff-tree -s m --description 'By default, git diff-tree --stdin does not show differences for merge commits.'
complete -c git-diff-tree -s v --description 'This flag causes git diff-tree --stdin to also show the commit message before…'
complete -c git-diff-tree -l pretty -l format --description 'Pretty-print the contents of the commit logs in a given format, where <format…'
complete -c git-diff-tree -l abbrev-commit --description 'Instead of showing the full 40-byte hexadecimal commit object name, show only…'
complete -c git-diff-tree -l no-abbrev-commit --description 'Show the full 40-byte hexadecimal commit object name.'
complete -c git-diff-tree -l oneline --description 'This is a shorthand for "--pretty=oneline --abbrev-commit" used together.'
complete -c git-diff-tree -l encoding --description 'The commit objects record the encoding used for the log message in their enco…'
complete -c git-diff-tree -l expand-tabs -l expand-tabs -l no-expand-tabs --description 'Perform a tab expansion (replace each tab with enough spaces to fill to the n…'
complete -c git-diff-tree -l notes --description 'Show the notes (see git-notes(1)) that annotate the commit, when showing the …'
complete -c git-diff-tree -l no-notes --description 'Do not show notes.'
complete -c git-diff-tree -l show-notes -l standard-notes --description 'These options are deprecated.'
complete -c git-diff-tree -l show-signature --description 'Check the validity of a signed commit object by passing the signature to gpg …'
complete -c git-diff-tree -l no-commit-id --description 'git diff-tree outputs a line with the commit ID when applicable.'
complete -c git-diff-tree -s c --description 'This flag changes the way a merge commit is displayed (which means it is usef…'
complete -c git-diff-tree -l cc --description 'This flag changes the way a merge commit patch is displayed, in a similar way…'
complete -c git-diff-tree -l always --description 'Show the commit itself and the commit log message even if the diff itself is …'
complete -c git-diff-tree -l 'patch.' --description '.'
complete -c git-diff-tree -o 'p.' --description '.'
complete -c git-diff-tree -l 'raw.' --description '.'
complete -c git-diff-tree -l diff-algorithm --description '.'
complete -c git-diff-tree -l stat-graph-width --description '(affects all commands generating a stat graph) or by setting diff.'
complete -c git-diff-tree -l stat-width --description '.'
complete -c git-diff-tree -l stat-name-width --description 'and.'
complete -c git-diff-tree -l stat-count --description '.'
complete -c git-diff-tree -l dirstat --description '.'
complete -c git-diff-tree -l '*stat' --description 'options.  files.'
complete -c git-diff-tree -l 'stat.' --description '.'
complete -c git-diff-tree -l word-diff --description '.'
complete -c git-diff-tree -l 'color.' --description 'plain.'
complete -c git-diff-tree -o 'B/70%' --description 'specifies that less than 30% of the original should remain in the result for …'
complete -c git-diff-tree -o 'B20%' --description 'specifies that a change with addition and deletion compared to 20% or more of…'
complete -c git-diff-tree -o 'M90%' --description 'means Git should consider a delete/add pair to be a rename if more than 90% o…'
complete -c git-diff-tree -o M5 --description 'becomes 0. 5, and is thus the same as.'
complete -c git-diff-tree -o 'M50%.' --description '.'
complete -c git-diff-tree -o M05 --description 'is the same as.'
complete -c git-diff-tree -o 'M5%.' --description '.'
complete -c git-diff-tree -o 'M100%.' --description '.'
complete -c git-diff-tree -l 'find-copies-harder.' --description 'n is specified, it has the same meaning as for.'
complete -c git-diff-tree -o 'M<n>.' --description '.'
complete -c git-diff-tree -s S --description '.'
complete -c git-diff-tree -o 'S<regex>' --description 'and.'
complete -c git-diff-tree -s G --description 'finds a change, show all the changes in that changeset, not just the files th…'
complete -c git-diff-tree -o 'O/dev/null.' --description '.'
complete -c git-diff-tree -l 'exit-code.' --description '.'
complete -c git-diff-tree -l 'ita-visible-in-index.' --description 'For more detailed explanation on these common options, see also gitdiffcore(7…'
complete -c git-diff-tree -o 'c.' --description '.'
complete -c git-diff-tree -o 'p).' --description '.'
complete -c git-diff-tree -l 'stdin).' --description '.'
complete -c git-diff-tree -l 'no-abbrev.' --description 'oc o 2. 3.'
complete -c git-diff-tree -s g --description 'option.'
complete -c git-diff-tree -l - --description '+++ b/describe.'

