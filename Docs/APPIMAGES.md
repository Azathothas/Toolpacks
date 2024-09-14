- #### `${PKG_NAME}.AppImage`

- #### `strip | objcopy`
> - <b>NEVER run `strip`, `objcopy`</b> or any other binary rewriting tool as they will often just strip the `squashfs|dwarfs` archive, only preserving the `runtime`.
> - A typical `.AppImage` file is not a real elf binary, thus will not survive this process. 
