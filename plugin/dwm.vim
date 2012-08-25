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

if !exists('g:dwm_map_keys')
  let g:dwm_map_keys = 1
endif

function! DWM_Shuffle()
  wincmd H
  if winnr('$') > 2
    for nr in range(2, winnr('$'))
      wincmd w
      wincmd J
      wincmd w
    endfor
  endif
  1wincmd w
  wincmd H
  exec DWM_ResizeMasterPaneWidth()
endfunction

function DWM_ResizeMasterPaneWidth()
  " resize the master pane if user defined it
  if exists('g:dwm_master_pane_width')
    exec 'vertical resize ' . g:dwm_master_pane_width
  endif
endfunction

function! DWM_New()
  new
  call DWM_Shuffle()
endfunction

" TODO: Refocus the window that received focus after `bd` to preserve expected
" behavior. Currently window #1 will always receive focus.
function! DWM_Close()
  bd
  1wincmd w
  call DWM_Shuffle()
endfunction

" TODO: Decide how to best handle focusing a single window given the
" observations in issue #18.
" https://github.com/spolu/dwm.vim/issues/18
function! DWM_Full()
  echo 'DWM_Full not implemented.'
endfunction

if g:dwm_map_keys
  map <C-N> :call DWM_New()<CR>
  map <C-C> :call DWM_Close()<CR>
  map <C-Space> :call DWM_Shuffle()<CR>
  map <C-@> :call DWM_Shuffle()<CR>
  " In preparation of mode system
  map <C-M> :call DWM_Full()<CR>
  map <C-J> <C-W>w
  map <C-K> <C-W>W
endif
