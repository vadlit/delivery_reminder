# Delivery Reminder
Mobile application that helps to create and organize delivery reminders.

# Target platform
Target platform is Android only yet.

# Architecture
Directories are structured by the app features.
Code inside directories is separated by layers: ui, state management, model, etc..

# Immutables
Immutable collections are implemented with the "built_collection" library. No codegeneration is required.
But Immutables models are generated with the "freeze" library, which requires codegeneration.
Call [flutter pub run build_runner build] in order to regenerate immutable classes.
 
# State management
Vanilla (stateful widgets) + MobX

# Storage
Data is stored with SQFLite

# Notifications
Via 'flutter_local_notifications'

# Screenshots
Main screen - http://prntscr.com/zktov3
Add reminder - http://prntscr.com/zktt0r
Alarm - http://prntscr.com/zkty5g