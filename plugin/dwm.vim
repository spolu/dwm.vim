"==============================================================================
"    Copyright: Copyright (C) 2012 Stanislas Polu
"               Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this copyright
"               notice is copied with it. Like anything else that's free,
"               dwm.vim is provided *as is* and comes with no warranty of 
"               any kind, either expressed or implied. In no event will the 
"               copyright holder be liable for any damages resulting from 
"               the use of this software.
" Name Of File: dwm.vim
"  Description: Dynamic Window Manager behaviour for Vim
"   Maintainer: Stanislas Polu (polu.stanislas at gmail dot com)
" Last Changed: Tuesday, 23 August 2012
"      Version: See g:dwm_version for version number.
"        Usage: This file should reside in the plugin directory and be
"               automatically sourced.
"
"               For more help see supplied documentation.
"      History: See supplied documentation.
"==============================================================================

" Exit quickly if already running
if exists("g:dwm_version") || &cp
  finish
endif

let g:dwm_version = "0.1.1"

" Check for Vim version 700 or greater {{{1
if v:version < 700
  echo "Sorry, dwm.vim ".g:dwm_version."\nONLY runs with Vim 7.0 and greater."
  finish
endif

" Script Array for storing Buffer order
let s:dwm_bufs = []

function! DWM_BufCount() 
  let cnt = 0 
  for nr in range(1,bufnr("$")) 
    if buflisted(nr) 
      let cnt += 1 
    endif 
  endfor 
  return cnt 
endfunction 

function! DWM_SyncBufs()
  for nr in range(1,bufnr('$'))
    if buflisted(nr)
      if index(s:dwm_bufs,nr) == -1
        let s:dwm_bufs += [nr]
      endif
    endif
  endfor
  for r_idx in range(1,len(s:dwm_bufs))
    let idx = len(s:dwm_bufs)-r_idx
    if !(buflisted(s:dwm_bufs[idx])) 
      " echo idx
      call remove(s:dwm_bufs,idx) 
    endif
  endfor
  " echo s:dwm_bufs
endfunction

function! DWM_TopBuf(buffer)
  let b = a:buffer
  let idx = index(s:dwm_bufs,b)
  if idx != -1
    call remove(s:dwm_bufs,idx)
    call insert(s:dwm_bufs,b)
  endif
  " echo s:dwm_bufs
endfunction


function! DWM_Ball()
  call DWM_SyncBufs()
  exec 'sb ' . s:dwm_bufs[len(s:dwm_bufs)-1]
  on!
  call DWM_SyncBufs()
  if len(s:dwm_bufs) > 1
    for idx in range(1,len(s:dwm_bufs)-1)
      let r_idx = (len(s:dwm_bufs)-1) - idx
      exec 'topleft sb ' . s:dwm_bufs[r_idx]
    endfor
  endif
endfunction


function! DWM_Full ()
  exec 'sb ' .  bufnr('%')
  on!
endfunction

function! DWM_New ()
  call DWM_Ball()
  vert topleft new
  call DWM_SyncBufs()
  call DWM_TopBuf(bufnr('%'))
endfunction

function! DWM_Close()
  bd
  call DWM_Ball()
  if DWM_BufCount() > 1  
    " we just called ball we are at the top buffer
    let cb = s:dwm_bufs[0]
    hide
    exec 'vert topleft sb ' . cb
  endif
endfunction

function! DWM_Focus()
  call DWM_TopBuf(bufnr('%'))
  call DWM_Ball()
  if DWM_BufCount() > 1  
    " we just called ball we are at the top buffer
    let cb = s:dwm_bufs[0]
    hide
    exec 'vert topleft sb ' . cb
  endif
endfunction


if !exists('g:dwm_map_keys')
    let g:dwm_map_keys = 1
endif

if g:dwm_map_keys
    map <C-N> :call DWM_New()<CR>
    map <C-C> :call DWM_Close()<CR>
    map <C-H> :call DWM_Focus()<CR>
    map <C-L> :call DWM_Full()<CR>
    " map <C-B> :call DWM_Ball()<CR>
    map <C-J> <C-W>w
    map <C-K> <C-W>W
    map <C-B> :ls<CR>
endif


