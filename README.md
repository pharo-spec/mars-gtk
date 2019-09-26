# Mars
The Gtk3 bindings for Pharo and Spec

# How to install

### On Windows
You need Gtk3!  
And you need to put it at the same place of the `Pharo.exe` executable.  
To simplify the process we created a VM bundled with all the DLL and resources needed to execute GTK+3

You can get it from: http://files.pharo.org/vm/pharo-spur64-headless/win/latest-win64-GTK.zip

Then, you can just download a new Pharo 8.0 image: 

```
curl https://get.pharo.org/64/80 | bash
```

### On macOS: 

You need Gtk3 (installed by brew because paths are fixed for now)
```
brew install gtk+3
```

And you need the headless VM and a Pharo 8.0 image. You can get them from the zero-conf scripts: 

```
curl https://get.pharo.org/64/80+vmHeadlessLatest | bash
```


### On Linux
You need to have Gtk3 installed.

And you need the headless VM and a Pharo 80 image. You can get them from the zero-conf scripts: 

```
curl https://get.pharo.org/64/80+vmHeadlessLatest | bash
```


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
