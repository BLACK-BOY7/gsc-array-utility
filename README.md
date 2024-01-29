# gsc-array-utility
Array utility for gsc

Exemple:
```cpp
#include scripts\zm\array_utility;

init()
{
  names = create_array();
  names push( "test1" );
  names push( "test2" );

  foreach ( name in names.items )
  {
    printf( name );
  }

  printf( names index_of( "test1" ) );

  has_test2 = names index_of( "test2" ) != -1;
  printf( ( has_test2 ? "has" : "not has" ) + " the name 'test2'!" );

  names reverse();

  printf( names.length );

  foreach ( name in names.items )
  {
    printf( name );
  }```

}
