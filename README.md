# Mars
The Gtk3 bindings for Pharo and Spec

# How to install

## Prerequisites
You need the headless VM: 
```
curl https://get.pharo.org/64/vmHeadlessLatest80 | bash
```

### On Windows
You need Gtk3! And you need to put it at the same place of the `Pharo.exe` executable. 
We packaged a version for you: 
```
cd pharo-vm
curl -o "Gtk.zip" http://files.pharo.org/vm/pharo-spur64-headless/win/third-party/Gtk.zip
Expand-Archive -Path Gtk.zip -DestinationPath .
```

### On macOS: 

You need Gtk3 (installed by brew because paths are fixed for now)
```
brew install gtk+3
```

### On Linux
You need to have Gtk3 installed.

## Installing in your image

You need to install it from the command line since you do not have the Playground in the UI:
```
./PharoConsole.exe '.\Pharo.image' eval --save " Metacello new
        repository: 'github://pharo-spec/mars-gtk';
        baseline: 'Mars';
        onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        ignoreImage;
        load"
```

Then you will need to restart your image to let Gtk3 to take over the event loop.
