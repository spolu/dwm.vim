### dwm.vim : Tiled Window Management for Vim

dwm.vim adds tiled window management capabilities to Vim. It is highly inspired by [dwm](http://dwm.suckless.org/) (Dynamic Window Manager) tiled layout management. 

Download page on vim.org: http://www.vim.org/scripts/script.php?script_id=4186

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

Use the following commands to create, browse and close windows: 

- `C-N` Creates a new window and place it in the area [M] & stacks all previous windows in the [S] areas. 
- `C-C` Close the current window if no unsaved changes 
- `C-J` Jumps to next window (clockwise) 
- `C-K` Jumps to previous window (anti-clockwise) 
- `C-H` Focus the current window, that is, place it in the [M] area & stacks all other windows in the [S] areas 
- `C-L` Fullscreen mode for the current window (use focus to return to normal mode)

### ScreenShot

![](http://i.imgur.com/TKL4i.png)

### Remarks

There is only one tiled layout available right now, but do not hesitate to *fork it*!

For fun, I urge you to try using `dwm.vim` in `vim`, in `tmux`, in `ssh`, in `tmux`, in `xterm`, in `dwm`.

Thanks *luriel* for this awesome comment on the [HN post](http://news.ycombinator.com/item?id=4419530) 
related to `dwm.vim`:

> As one of the original instigators of dwm and wmii before that (mostly by shouting at garbeam) 
> I want to point out that this kind of tiled window management was first introduced in larswm 
> (that is sadly discontinued), which in turn was heavily inspired by Rob Pike's Acme editing 
> environment ( http://acme.cat-v.org ). 
> So in a way we have gone full circle, from text editor, to window managers, back to text editor.
> That said, I still prefer Acme to vim, but would be really cool if somebody added mouse chording to vim :)

### Contributors

```
@dsapala (Dan Sapala)
@rhacker
```

