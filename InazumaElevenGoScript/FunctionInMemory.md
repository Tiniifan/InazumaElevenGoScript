**What it is**

Level 5 has allocated memory to access several game functions directly in the Squirrel scripts. These functions can be used in any script

| Name  |      What it is      |  Example of Usage |
|:----------|:-------------:|:------:|
| CMND_GET_GAME_VERSION |  <ul><li>Return GAME_VER_SH if the game is Ligth</li><li>Return GAME_VER_DR if the game is Dark</li></ul> | <pre lang="squirrel"><code>if (CMND_GET_GAME_VERSION() == GAME_VER_SH) { <br> //Do <br>}</code></pre>|
