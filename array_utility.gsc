/**
 * @param {any[]} items
 * @description creates a new array
 * @return {"Array"}
*/
create_array(items)
{
  if ( !isdefined( items )  )
    items = [];

  if ( !isArray( items ) )
    items = [];

  this = SpawnStruct();
  this.__name__ = "Array";
  this.__is_class__ = true;

  this.items = items;
  this.length = items.size;

  return this;
}

/**
 * @param {any} variable
 * @description checks if the variable is an array
 * @return {boolean}
*/
is_array(variable)
{
  return !isarray(variable) && isdefined(variable.__is_class__) && isdefined(variable.__name__) && variable.__name__ == "Array";
}

/**
 * @param {any} element
 * @description returns the index of the element or -1 if not found
 * @return {number}
*/
index_of(element)
{
  if(!is_array(self)) return -1;

  for(i = 0; i < self.items.size; i++)
  {
    if(self.items[i] == element) return i;
  }

  return -1;
}

/**
 * @param {any} element
 * @description inserts element in array
 * @return {number}
*/
push(element)
{
  if(!is_array(self)) return -1;

  self.items[self.items.size] = element;
  self.length = self.items.size;
  return self.length - 1;
}

/**
 * @param {number} index
 * @description removes an element by index and returns the element
 * @return {any}
*/
remove_at(index)
{
  if(!is_array(self)) return undefined;
  if(index < 0 || index >= self.items.size) return undefined;

  element = self.items[i];
  for(i = index; i < self.items.size; i++)
  {
    self.items[i] = self.items[i+1];
  }
  self.length = self.items.size;

  return element;
}

/**
 * @param {any} element
 * @description removes an element
 * @return {any}
*/
remove(element)
{
  if(!is_array(self)) return;

  index = index_of(element);

  if(index == -1)
    return;

  remove_at(index);
}

/**
 * @description removes the last element
 * @return {any}
*/
pop()
{
  if(!is_array(self) || self.items.size == 0) return undefined;

  return remove_at(self.items.size - 1);
}

/**
 * @description removes the first element
 * @return {any}
*/
shift()
{
  if(!is_array(self) || self.items.size == 0) return undefined;

  return remove_at(0);
}

/**
 * @description inverts the array
*/
reverse()
{
  if(!is_array(self)) return;

  for(i = 0; i < floor(self.items.size / 2); i++)
  {
    temp = self.items[i];
    self.items[i] = self.items[self.items.size - 1 - i];
    self.items[self.items.size - 1 - i] = temp;
  }
}