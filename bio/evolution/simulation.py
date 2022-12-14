import randomlock as rl

def is_match(test, target):
  if len(test) != len(target):
    return False
  for i in range(len(test)):
    if target[i] != test[i]:
      return False
  return True


