# gsc-array-utility
Array utility for GSC.

# NOTE:
<p>All the following examples are based on Zombies gamemode.</p>

## Constructor:
```js
create_array( items?: any[] ): struct;
```
## Example:
```cpp
#include scripts\zm\array_utility;

init()
{
  names = create_array();
  names push("Hello");
  foreach( name in names.items )
  {
    printf( name );
  }
}
```
```cpp
#include scripts\zm\array_utility;

on_player_connected()
{
  self endon("end_game");
  self endon("game_ended");

  for(;;)
  {
    self waittill("connected", player);
    players = create_array( level.players );

    index = players index_of( player );
    printf( "Index of " + player.name + " is " + index );
  }
}

init()
{
  thread on_player_connected();
}
```
