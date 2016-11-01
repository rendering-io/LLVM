#!/usr/bin/python3
import json

def emitEnumDef(Name, Class, Value):
  # We have to do a little mangling to prevent collisions, but OpOpUDiv looks
  # horrible, so special case Ops
  DefName = Class + Name
  if 'Op' == Class:
    DefName = 'OpCode' + Name[2:]

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

def emitInstruction(i):
  #    "opname" : "PackDouble2x32",
  #    "opcode" : 59,
  #    "operands" : [
  #      { "kind" : "IdRef", "name" : "'v'" }
  #    ],
  #    "capabilities" : [ "Float64" ]  
  Name = i['opname']
  Capabilities = ''
  if 'capabilities' in i.keys():
    Capabilities = ', '.join(['Capability' + c for c in i['capabilities']])

  Operands = []
  if 'operands' in i.keys():
    Operands = i['operands']

  Comment = '// ' + Name + ' ' + ', '.join([op['kind'] for op in Operands])

  print(Comment)
  print('def ' + Name + ' : SPIRVInst<OpCode' + Name[2:] + ',')
  print('  [' + Capabilities + '], (outs), (ins), []>;')
  print('')

def emitInstructions():
  db = json.load(open('spirv.core.grammar.json'))

  # Iterate over all the instruction definitions.
  [emitInstruction(i) for i in db['instructions']]
  return

def main():
  emitEnums()
  emitInstructions()
  return

if __name__ == "__main__":
    main()