let g:clipboard = {
  'name': 'gpaste-client',
  'copy': {
    '+': ['gpaste-client', 'add'],
    '*': ['gpaste-client', 'get', "--use-index", '0']
  },
  'paste': {
    '+': ['gpaste-client', 'get', "--use-index", '0']
    '*': ['gpaste-client', 'get', "--use-index", '0']
  }
}
