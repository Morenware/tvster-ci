# Backup from Mac OSX

 1. Switch off RPI
 2. Plug SD card in Mac
 3. Run
 ```
 $ diskutil list
 ```
 
 4. Make not of SD card path (i.e `/dev/disk1s2`)
 5. Run backup script
 ```
 $ ./backup-sd.sh /dev/disk1s2
 ```
 6. Upload to Amazon S3 (manual for now)
 
 # Restore from Mac OS X
 
 