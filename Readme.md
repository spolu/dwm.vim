dwm.vim adds tiled window management capabilities to Vim. It is highly inspired by dwm (Dynamic Window Manager) [http://dwm.suckless.org/] tiled layout management. 

Windows are always organised as follows: 

```
===================================
|              |        S1        | 
|              |===================
|      M       |        S2        | 
|              |===================
|              |        S3        | 
===================================
```

Use the following commands to create, close and browse windows: 

- CTRL-N Creates a new window and place it in the area [M] & stacks all previous windows in the [S] areas. 
- CTRL-C Close the current window if no unsaved changes 
- CTRL-J Jumps to next window (clockwise) 
- CTRL-K Jumps to previous window (anti-clockwise) 
- CTRL-F Focus the current window, that is, place it in the M area & stacks all other windows in the [S] areas 

There is only one tiled layout available right now, but the project is open for contribution!
