# gsc-array-utility
Array utility for GSC.

# Functions:
## Constructor
```js
create_array( elements?: any[] | struct("Array") ): struct("Array");
```
<p>**Description**: Returns a new struct("Array") (can be used on the methods bellow)</p>

## is_array
```js
is_array( variable: any ): bool;
```
<p>**Description**: Returns true if it is an array created by the constructor.</p>

## index_of
```js
struct("Array") index_of( element: any ): number;
```
<p>**Description**: Returns the index of the element.</p>

## join
```js
struct("Array") join( delimiter?: string ): string;
```

## push
```js
struct("Array") push( element: any ): number;
```
<p>**Description**: Adds the element to the array, and returns its index</p>

## remove_at
```js
struct("Array") remove_at( index: number ): any;
```
<p>**Description**: Removes the element by index, and returns the removed element.</p>

## remove
```js
struct("Array") remove( element: any ): void;
```
<p>**Description**: Removes the element from array.</p>

## shift
```js
struct("Array") shift(): any;
```
<p>**Description**: Removes the first element and returns it.</p>

## pop
```js
struct("Array") pop(): any;
```
<p>**Description**: Removes the last element and returns it.</p>

## reverse
```js
struct("Array") reverse(): void;
```
<p>**Description**: Reverses the order of the array.</p>

# NOTE:
<p>All the following examples are based on Zombies gamemode.</p>

## Example:
```cpp
#include scripts\array_utility\src\main;

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
#include scripts\array_utility\src\main;

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
