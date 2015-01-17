e ''
e '-----------------------------------------------' $blue
e '-              Activity Monitor               -' $blue
e '-----------------------------------------------' $blue
e ''

alias dw='defaults write com.apple.ActivityMonitor'

e '\tShow the main window when launching.'
dw OpenMainWindow -bool true

e "\tVisualize CPU usage in the Activity Monitor's Dock icon."
dw IconType -int 5

e '\tShow all processes by default.'
dw ShowCategory -int 0
# Default: 100

e '\tSort results by CPU usage.'
dw SortColumn -string 'CPUUsage'
dw SortDirection -int 0

# echo -e "\tMavericks: Adding the % CPU column to the Disk and Network tabs..."
# dw "UserColumnsPerTab v4.0" -dict \
#     '0' '( Command, CPUUsage, CPUTime, Threads, IdleWakeUps, PID, UID )' \
#     '1' '( Command, anonymousMemory, Threads, Ports, PID, UID, ResidentSize )' \
#     '2' '( Command, PowerScore, 12HRPower, AppSleep, graphicCard, UID )' \
#     '3' '( Command, bytesWritten, bytesRead, Architecture, PID, UID, CPUUsage )' \
#     '4' '( Command, txBytes, rxBytes, txPackets, rxPackets, PID, UID, CPUUsage )'

# echo -e "\tMavericks: Sort by CPU usage in Disk and Network tabs..."
# dw UserColumnSortPerTab -dict \
#     '0' '{ direction = 0; sort = CPUUsage; }' \
#     '1' '{ direction = 0; sort = ResidentSize; }' \
#     '2' '{ direction = 0; sort = 12HRPower; }' \
#     '3' '{ direction = 0; sort = CPUUsage; }' \
#     '4' '{ direction = 0; sort = CPUUsage; }'
