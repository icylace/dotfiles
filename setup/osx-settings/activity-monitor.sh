# ------------------------------------------------------------------------------
#  Activity Monitor settings.
# ------------------------------------------------------------------------------

echo '\tShow the main window when launching.'
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# echo "\tVisualize CPU usage in the Activity Monitor's Dock icon."
# defaults write com.apple.ActivityMonitor IconType -int 5

echo '\tShow all processes by default.'
defaults write com.apple.ActivityMonitor ShowCategory -int 0
# Default: 100


echo '\tSort Activity Monitor results by CPU usage.'
defaults write com.apple.ActivityMonitor SortColumn -string 'CPUUsage'
defaults write com.apple.ActivityMonitor SortDirection -int 0








  # echo -e "\tMavericks: Adding the % CPU column to the Disk and Network tabs..."
  # defaults write com.apple.ActivityMonitor "UserColumnsPerTab v4.0" -dict \
  #     '0' '( Command, CPUUsage, CPUTime, Threads, IdleWakeUps, PID, UID )' \
  #     '1' '( Command, anonymousMemory, Threads, Ports, PID, UID, ResidentSize )' \
  #     '2' '( Command, PowerScore, 12HRPower, AppSleep, graphicCard, UID )' \
  #     '3' '( Command, bytesWritten, bytesRead, Architecture, PID, UID, CPUUsage )' \
  #     '4' '( Command, txBytes, rxBytes, txPackets, rxPackets, PID, UID, CPUUsage )'

  # echo -e "\tMavericks: Sort by CPU usage in Disk and Network tabs..."
  # defaults write com.apple.ActivityMonitor UserColumnSortPerTab -dict \
  #     '0' '{ direction = 0; sort = CPUUsage; }' \
  #     '1' '{ direction = 0; sort = ResidentSize; }' \
  #     '2' '{ direction = 0; sort = 12HRPower; }' \
  #     '3' '{ direction = 0; sort = CPUUsage; }' \
  #     '4' '{ direction = 0; sort = CPUUsage; }'
