# Inazuma Eleven Go Script
___________________________________________________________________________
**Disclaimer**

I'm not affiliated with Level-5, I'm just a big gan who loves his work, I don't steal their work it's their work.  
I share the documentation about the scripts for people who want to modify their game, understand the game.

**Language Script**

- Squirrel: Level 5 used Squirrel 2.2.3 stable version to manage several parts of the game like events (map event, match event, ...)   
- XQ32/XSEQ: Level 5's proprietary script format to control the menus. These scripts are quite hard to modify because they are in assembly. In this gits I will not talk about these files I will only talk about squirrel scripts, if you want more information about XQ32/XSEQ see more information [here (https://github.com/onepiecefreak3/XtractQuery)

**How to Get Script**

I don't share the scripts, you have to get them by yourself.  
1. You have to extract the ie_a.fa file with karameru
2. Go to the folder ie_a_fa/data/script, you will find a lot of files with .nutb extension.
3. Download [nutcracker.exe](https://mega.nz/file/Y1U2RIqa#RLyHy-kjnWKQQQ2V1M1WyNhxGEAWkVng9nUJCZvZf5o)
4. Take a .nutb file
5. Put nutcracker.exe in a the same path as your .nutb
6. Run CMD (in File Explorer, click the address bar to select it (or press Ctrl+L). Type “cmd” into the address bar and hit Enter to open the Command Prompt with the path of the current folder already set)
7. Write nutcracker.exe [YourScriptFileNameWithTheExtension] > [YourScriptFileName].nut (example: nutcracker.exe ie4_ev_main.nutb > ie4_ev_main.nut)
8. After you will have a new file with the extension .nut, open this file with NotePad++ or in Visual Studio Code with a Squirrel Extension
9. Now you have to clean the script to make it usable: you have to remove all "$[stack offset 0]." and you can delete the line who start by "//"
10. When your script is clean, I recommend you to make a copy of this script and keep it in a safe place, so you always have a copy!

**Things You Should Know**

- [Squirrel Syntax](http://squirrel-lang.org/) (Squirrel Language looks like Javascript)
- The game has several functions in memory that you can call
- We don't have access to the print function
- You can't modify the game code, only the scripts

**How To Compile**
I don't know how to compile with Visual Studio Code, I show you an example of how I do it
1. Download my SquirrelCompiler.rar 
2. Extract SquirrelCompiler.rar with winrar
3. Copy "Squirrel Compiler" folder to a safe path (a path you are sure to never delete)
4. Right click on a .nut file
5. Click on "Open with"
6. Click "Choose another app"
7. Scroll down and Click on "More application"
8. Scroll down and click on "Search another programm"
9. Search your Squirrel Compiler folder and select "sq-compiler-2.2.4.bat"
10. Make sure you have checked "always use this app to open .nut"
11. Click on Ok
12. Now you can compile any .nut by clicking on it, you will get a file with the same name but the extension .nutb
