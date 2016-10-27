#!/usr/bin/python3
import json

def emitEnumDef(Name, Class, Value):
  # We have to do a little mangling to prevent collisions, but OpOpUDiv looks
  # horrible, so special case Ops
  DefName = Class + Name
  if 'Op' == Class:
    DefName = Name

  print('def ' + DefName + ': ' 
               + Class + '<' + str(Value) + ', "' + Name +  '"> {}')

def emitEnum(e):
  # For each enum definition we define a template class.
  Name = e['Name']
  print('class ' + Name + '<int v, string n> {')
  print('  int Value = v;')
  print('  string NAME = n;')
  print('}')
  print('')

  # Iterate over all the values in the enum and emit a def.
  [emitEnumDef(k, Name, v) for k, v in e['Values'].items()]
  print('')

def emitEnums():
  db = json.load(open('spirv.json'))

  # Iterate over all the enum definitions.
  [emitEnum(e) for e in db['spv']['enum']]
  
  return

def main():
  emitEnums()
  return

if __name__ == "__main__":
    main()