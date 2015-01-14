# ------------------------------------------------------------------------------
#  Bartender
#  Menu bar manager.
#  http://www.macbartender.com/
# ------------------------------------------------------------------------------

e '\tShow the menu bar icon.'
defaults write com.surteesstudios.Bartender showMenuBarIcon -bool true

e '\tMake sure the menu bar icon is the bartender.'
defaults write com.surteesstudios.Bartender statusBarImageNamed -string 'Bartender'

# barLocation = "-1";
# barLocationPercentage = "0.8673611";


# {
#     appBartenderOrder =     (
#         "com.cycling74.Soundflowerbed",
#         "com.trankynam.aText",
#         "TextExpander Helper",
#         Typinator,
#         LivedriveCore,
#         Shortcat,
#         "net.elasticthreads.nv",
#         "com.apple.menuextra.textinput",
#         JewelryBox,
#         Dash,
#         "com.runningwithcrayons.Alfred-2",
#         "com.ElephantDrive.ElephantDrive.ElephantDrive",
#         "com.apple.systemuiserver",
#         "com.copy.agent",
#         "Automator Launcher",
#         Awareness,
#         "Time Track Pro",
#         CursorCoordinates,
#         SugarSync,
#         "CrashPlan menu bar",
#         CodeBar,
#         Skype,
#         "com.bjango.iStatMenusDrives",
#         "com.bjango.iStatMenusNetwork",
#         "com.bjango.iStatMenusCPU",
#         "com.bjango.iStatMenusMemory",
#         "com.bjango.iStatMenusTemps",
#         "com.bjango.iStatMenusBattery",
#         "com.bjango.iStatMenusDateAndTimes",
#         LibreOffice,
#         Vox,
#         "AAM Updates Notifier",
#         xScope,
#         "com.lightheadsw.caffeine",
#         "com.iSlayer.iStatMenusCPU",
#         "com.apple.menuextra.TimeMachine",
#         "com.iSlayer.iStatMenusNetwork",
#         "com.iSlayer.iStatMenusMemory",
#         "com.iSlayer.iStatMenusDiskActivity",
#         "com.iSlayer.iStatMenusTemps",
#         "com.iSlayer.iStatMenusBattery",
#         "com.apple.menuextra.airport",
#         "com.iSlayer.iStatMenusDateAndTimes",
#         "(null)",
#         "menuExtra.spotlight",
#         "com.google.GoogleDrive",
#         "com.getdropbox.dropbox",
#         CodeKit,
#         CopyClip,
#         Boom,
#         "WiFi Signal",
#         "com.apple.menuextra.bluetooth",
#         "org.herf.Flux",
#         "Plug Spy",
#         "com.shinyplasticbag.DragonDrop",
#         "com.stclairsoft.DefaultFolderX.helper",
#         "com.apple.menuextra.volume",
#         "com.kainjow.BootChamp"
#     );
#     appSettings =     {
#         BetterTouchTool =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         Boom =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         Cobook =         {
#             controlled = 0;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         CodeKit =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         CopyClip =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "CrashPlan menu bar" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         CursorCoordinates =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         Dash =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         LittleIpsum =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         LivedriveCore =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "Mint QuickView" =         {
#             controlled = 0;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "Plug Spy" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         Shortcat =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "Should I Sleep" =         {
#             controlled = 0;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         SugarSync =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "Time Track Pro" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 1;
#             updateDisplayTime = 5;
#         };
#         "WiFi Signal" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.ElephantDrive.ElephantDrive.ElephantDrive" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.apple.menuextra.TimeMachine" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.apple.menuextra.bluetooth" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.apple.menuextra.volume" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.apple.systemuiserver" =         {
#             controlled = 0;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.bjango.iStatMenusDrives" =         {
#             controlled = 0;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.copy.agent" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.cycling74.Soundflowerbed" =         {
#             controlled = 0;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.fiplab.memoryclean" =         {
#             controlled = 0;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.getdropbox.dropbox" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.google.GoogleDrive" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.iSlayer.iStatMenusCPU" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.iSlayer.iStatMenusDiskActivity" =         {
#             controlled = 0;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.iSlayer.iStatMenusDrives" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.kainjow.BootChamp" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.lightheadsw.caffeine" =         {
#             controlled = 0;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.runningwithcrayons.Alfred-2" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.shinyplasticbag.DragonDrop" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.stclairsoft.DefaultFolderX.helper" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "com.trankynam.aText" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "menuExtra.spotlight" =         {
#             controlled = 0;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "net.elasticthreads.nv" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#         "org.herf.Flux" =         {
#             controlled = 1;
#             popupFix = 0;
#             showForUpdates = 0;
#             updateDisplayTime = 5;
#         };
#     };
#     barLocation = "-1";
#     barLocationPercentage = "0.8673611";
#     license = "GAXAE-F9AY5-4MEFQ-WFAUB-ELAQN-S4W4N-ARNKC-EVC5Y-A9KQB-R7E2U-KC72U-RMAQ4-4DYA8-X33SG-WQEM9-FU";
#     licenseHoldersName = "Ron Martinez";
#     menuBarPositions =     (
#         "org.w0lf.DockRefresh",
#         "SystemUIServer:2552",
#         "SystemUIServer:20",
#         "com.apple.finder",
#         "org.mozilla.firefoxdeveloperedition",
#         "com.googlecode.iterm2",
#         "com.jetbrains.PhpStorm",
#         "com.cycling74.Soundflowerbed",
#         "com.readcube.ReadCubeTray",
#         "com.apple.Safari",
#         "unity.Thomas Bowker.LYNE",
#         "com.apple.Preview",
#         "org.videolan.vlc",
#         "com.kainjow.BootChamp",
#         "com.sublimetext.3",
#         "com.apple.menuextra.airplay",
#         "com.apple.notificationcenterui",
#         "com.postgresapp.Postgres93",
#         "com.xmarks.XmarksforSafari",
#         "com.google.Chrome",
#         "net.vidalia-project.vidalia",
#         "TextExpander Helper",
#         "com.trankynam.aText",
#         Typinator,
#         LivedriveCore,
#         Shortcat,
#         "net.elasticthreads.nv",
#         "com.shinyplasticbag.DragonDrop",
#         JewelryBox,
#         Dash,
#         CopyClip,
#         "com.fiplab.memoryclean",
#         "com.ElephantDrive.ElephantDrive.ElephantDrive",
#         "WiFi Signal",
#         "com.copy.agent",
#         Pling,
#         "com.runningwithcrayons.Alfred-2",
#         "com.apple.Automator_Launcher",
#         Awareness,
#         "Time Track Pro",
#         CursorCoordinates,
#         CodeBar,
#         "Should I Sleep",
#         "com.code42.b42menuextra",
#         "com.skype.skype",
#         "net.shinyfrog.pixamac",
#         "com.cobookapp.cobook",
#         "2BUA8C4S2C.com.agilebits.onepassword4-helper",
#         "com.lightheadsw.caffeine",
#         "com.surteesstudios.Bartender",
#         "com.bjango.iStatMenusDrives",
#         "com.bjango.iStatMenusNetwork",
#         "com.bjango.iStatMenusCPU",
#         "com.bjango.iStatMenusSensors",
#         "com.bjango.iStatMenusMemory",
#         "com.bjango.iStatMenusBattery",
#         "com.bjango.iStatMenusTime",
#         "com.bjango.iStatMenusTemps",
#         SugarSync,
#         Dock,
#         "com.adobe.PDApp.AAMUpdatesNotifier",
#         "org.libreoffice.script",
#         Vox,
#         "com.apple.locationmenu",
#         Synergy,
#         "com.colorchooserapp.colorchooser",
#         "org.herf.Flux",
#         CodeKit,
#         "com.celmaro.Plug-Spy",
#         "com.stclairsoft.DefaultFolderX.helper",
#         Boom,
#         "com.getdropbox.dropbox",
#         "com.google.GoogleDrive",
#         "com.iSlayer.iStatMenusCPU",
#         "com.apple.menuextra.TimeMachine",
#         "com.apple.menuextra.airport",
#         "com.iSlayer.iStatMenusNetwork",
#         "com.iSlayer.iStatMenusMemory",
#         "com.iSlayer.iStatMenusDiskActivity",
#         "com.iSlayer.iStatMenusTemps",
#         "com.iSlayer.iStatMenusBattery",
#         "com.apple.menuextra.bluetooth",
#         "com.apple.menuextra.volume",
#         "com.iSlayer.iStatMenusDateAndTimes",
#         "com.bjango.iStatMenusDateAndTimes",
#         "com.apple.menuextra.textinput",
#         "com.apple.Spotlight"
#     );
#     numberOfAttempts = 0;
#     trialStart = "2014-11-10 09:45:25 +0000";
# }
