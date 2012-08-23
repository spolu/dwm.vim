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

- `CTRL-N` Creates a new window and place it in the area [M] & stacks all previous windows in the [S] areas. 
- `CTRL-C` Close the current window if no unsaved changes 
- `CTRL-J` Jumps to next window (clockwise) 
- `CTRL-K` Jumps to previous window (anti-clockwise) 
- `CTRL-H` Focus the current window, that is, place it in the [M] area & stacks all other windows in the [S] areas 

### ScreenShot

![](http://i.imgur.com/TKL4i.png)

### Remarks

There is only one tiled layout available right now, but do not hesitate to *fork it*!

And for inception lovers... [BOOOOOOOWWWMM](https://docs.google.com/open?id=0B-zgpFS3PwF1cFp2OTFyM2k3RUU)

*luriel* states on the (HN post)[http://news.ycombinator.com/item?id=4419530] related to `dwn.vim`:

> As one of the original instigators of dwm and wmii before that (mostly by shouting at garbeam) 
> I want to point out that this kind of tiled window management was first introduced in larswm 
> (that is sadly discontinued), which in turn was heavily inspired by Rob Pike's Acme editing 
> environment ( http://acme.cat-v.org ). 
> So in a way we have gone full circle, from text editor, to window managers, back to text editor.
> That said, I still prefer Acme to vim, but would be really cool if somebody added mouse chording to vim :)
