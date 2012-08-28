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

" All layout transformations assume the layout contains one master pane on the
" left and an arbitrary number of stacked panes on the right
" +--------+--------+
" |        |   S1   |
" |        +--------+
" |   M    |   S3   |
" |        +--------+
" |        |   S3   |
" +--------+--------+

" Move the current master pane to the stack
function! DWM_Stack(clockwise)
  1wincmd w
  if a:clockwise
    " Move to the top of the stack
    wincmd K
  else
    " Move to the bottom of the stack
    wincmd J
  endif
  " At this point, the layout *should* be the following with the previous master
  " at the top (rotated clockwise) or bottom (rotated anticlockwise).
  " +-----------------+
  " |        M        |
  " +-----------------+
  " |        S1       |
  " +-----------------+
  " |        S2       |
  " +-----------------+
  " |        S3       |
  " +-----------------+
endfunction

" Rotate the layout clockwise or anticlockwise
function! DWM_Rotate(clockwise)
  " Move master pane to appropriate position on the stack
  call DWM_Stack(a:clockwise)
  " Select next or previous window
  if a:clockwise
    wincmd W
  else
    wincmd w
  endif
  " Move to left
  wincmd H
  call DWM_ResizeMasterPaneWidth()
endfunction

" Add a new buffer
function! DWM_New()
  " Move current master pane to the stack
  call DWM_Stack(1)
  " Create a vertical split
  vert topleft new
  call DWM_ResizeMasterPaneWidth()
endfunction

" Move the current window to the master pane (the previous master window is
" added to the top of the stack)
function! DWM_Focus()
  let l:curwin = winnr()
  call DWM_Stack(1)
  exec l:curwin . "wincmd w"
  wincmd H
  call DWM_ResizeMasterPaneWidth()
endfunction

" Close the current window
function! DWM_Close()
  bd
  " If the master panel is closed, only the stack remains and its witdh is equal
  " to the width of the editor
  if winwidth('%') == &columns
    " Move the current window to the master panel
    wincmd H
    call DWM_ResizeMasterPaneWidth()
  endif
endfunction

function! DWM_ResizeMasterPaneWidth()
  " resize the master pane if user defined it
  if exists('g:dwm_master_pane_width')
    exec 'vertical resize ' . g:dwm_master_pane_width
  endif
endfunction

function! DWM_GrowMaster()
  if winnr() == 1
    exec "vertical resize +1"
  else
    exec "vertical resize -1"
  endif
endfunction

function! DWM_ShrinkMaster()
  if winnr() == 1
    exec "vertical resize -1"
  else
    exec "vertical resize +1"
  endif
endfunction

if !exists('g:dwm_map_keys')
  let g:dwm_map_keys = 1
endif

if g:dwm_map_keys
  map <C-N> :call DWM_New()<CR>
  map <C-C> :call DWM_Close()<CR>
  map <C-Space> :call DWM_Focus()<CR>
  map <C-@> :call DWM_Focus()<CR>

  map <C-H> :call DWM_GrowMaster()<CR>
  map <C-L> :call DWM_ShrinkMaster()<CR>

  map <C-J> :call DWM_Rotate(1)<CR>
  map <C-K> :call DWM_Rotate(0)<CR>
endif
