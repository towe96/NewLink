# NewLink
Windows .bat tools for easy shortcuts to frequently used resources

There's lots of resources I frequently need to access - some on websites, some in files or folders in shares, some in programs installed on the PC. Windows Search isn't always reliable, especially through network shares.

I use the [Win] + [R] run menu to access shortcuts stored in a common directory which is added to the Windows path variable.
This way, it doesn't matter where it's a website I need to open (link to Chrome / Edge), a file or folder (link to the path in explorer) or a program to open (link to the executable).

To create those shortcuts, I've written a .bat file which either takes the input from its argument (when called with [Right click] -> [Send to]) or queries the user for the URL and shortcut name in case of a website when run directly through the same [Win] + [R] -> "newlink" interface used for calling shortcuts.
The .lnk file is then created by a running a temporary .vbs file.

I've also written an installer for the tool, which created the common directory, modifies the users PATH environment variable, copies some exemplary links (all *.lnk files in the same directly as _INSTALL.bat when run) to the directory and adds the tool to the Windows "Send To" menu.

It can't automatically query for existing programs, but since creating each link only required to [Right click] -> [Send to] once and to set a shortcut name, the manual work is minimized.
