nnoremap k :<C-u>call rpcrequest(g:vscode_channel, 'vscode-command', 'cursorMove', { 'to': 'up', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
nnoremap j :<C-u>call rpcrequest(g:vscode_channel, 'vscode-command', 'cursorMove', { 'to': 'down', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
nnoremap p ]p
nnoremap <Down> gj
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
nnoremap <C-e> $
nnoremap <C-a> ^
vnoremap <C-e> $
vnoremap <C-a> ^
nnoremap <Esc><Esc> :nohlsearch<CR>
set clipboard+=unnamedplus
let g:clipboard = {
  'name': 'win32yank-wsl',
  'copy': {
     '+': 'win32yank.exe -i --crlf',
     '*': 'win32yank.exe -i --crlf',
   },
  'paste': {
     '+': 'win32yank.exe -o --lf',
     '*': 'win32yank.exe -o --lf',
  },
  'cache_enabled': 0,
}
