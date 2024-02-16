/*
Array Utility v1.1beta

A simple and open-source library to improve arrays in GSC.
*/

/**
 * @param { any[] | Struct("Array") | undefined } elements
 * @returns { Struct("Array") }
 */
create_array(elements=[])
{
  if(!isdefined(elements)) elements = [];
  if(is_array(elements)) elements = elements.items;
  if(!isarray(elements)) return "elements must be an array!";

  this = SpawnStruct();
  this.__name__ = "Array";
  this.__is_class__ = true;

  this.items = [];
  this.length = 0;

  foreach(value, index in elements)
  {
    if(isstring(index)) continue;
    this.items[this.items.size] = value;
    this.length = this.items.size;
  }

  return this;
}

/**
 * @param { * } variable
 * @returns { boolean }
 */
is_array(variable)
{
  return isdefined(variable) && !isarray(variable) && isdefined(variable.__is_class__) && isdefined(variable.__name__) && variable.__name__ == "Array" && variable.__is_class__;
}

/**
 * @param { * } element
 * @returns { number }
 */
index_of(element)
{
  if(!is_array(self)) return "this function must be called in an array!";
  if(!isdefined(element)) return "element must be defined!";

  for(i = 0; i < self.items.size; i++)
  {
    if(self.items[i] == element) return i;
  }

  return -1;
}

/**
 * @param { string } delimiter
 * @returns { string }
 */
join(delimiter="")
{
  if(!is_array(self)) return "this function must be called in an array!";

  if(!isstring(delimiter)) return "delimiter must be a string!";

  output = "";
  first = true;

  foreach(element in self.items)
  {
    if(!isstring(element)) continue;
    output += (first ? "" : delimiter) + element;
  }

  return output;
}

/**
 * @param { * } element
 * @returns { number }
 */
push(element)
{
  if(!is_array(self)) return "this function must be called in an array!";
  if(!isdefined(element)) return "element must be defined!";

  self.items[self.items.size] = element;
  self.length = self.items.size;
  return self.length - 1;
}

/**
 * @param { number } index
 * @returns { * }
 */
remove_at(index)
{
  if(!is_array(self)) return "this function must be called in an array!";
  if(!isint(index)) return "index must be a integer!";

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
 * @param { * } element
 * @returns { void }
 */
remove(element)
{
  if(!is_array(self)) return "this function must be called in an array!";
  if(!isdefined(element)) return "element must be defined!";

  index = index_of(element);
  if(index == -1) return;
  remove_at(index);
}

/**
 * @returns { * }
 */
pop()
{
  if(!is_array(self)) return "this function must be called in an array!";
  if(self.items.size == 0) return undefined;

  return remove_at(self.items.size - 1);
}

/**
 * @returns { * }
 */
shift()
{
  if(!is_array(self)) return "this function must be called in an array!";
  if(self.items.size == 0) return undefined;

  return remove_at(0);
}

/**
 * @returns { void }
 */
reverse()
{
  if(!is_array(self)) return "this function must be called in an array!";

  for(i = 0; i < floor(self.items.size / 2); i++)
  {
    temp = self.items[i];
    self.items[i] = self.items[self.items.size - 1 - i];
    self.items[self.items.size - 1 - i] = temp;
    temp = undefined;
  }
}