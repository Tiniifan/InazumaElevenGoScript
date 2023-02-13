**What it is**

Level 5 has allocated memory to access several game functions directly in the Squirrel scripts. These functions can be used in any script

### CMND_GET_GAME_VERSION
- Return GAME_VER_SH if the game is Ligth
- Return GAME_VER_DR if the game is Dark
```squirrel
if (CMND_GET_GAME_VERSION() == GAME_VER_SH) { 
  //Do
}
