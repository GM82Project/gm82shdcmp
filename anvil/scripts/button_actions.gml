if (argument_count) action=argument[0]

switch (action) {
    case "load": {load_shader()} break
    case "reload": {
        if (CLIPBOARD) {load_shader("Pasted from clipboard",clipboard_get_text())}
        else if (FILENAME!="" && file_exists(FILENAME)) reload_shader()
    } break
    case "shadertype": {TYPE=shadertype} break

    case "open input": {if (file_exists(FILENAME)) execute_shell("explorer.exe","/select,"+qt+FILENAME+qt)} break
    case "open output": {if (file_exists(OUTPUT)) execute_shell("explorer.exe","/select,"+qt+OUTPUT+qt)} break

    case "edit": {edit_shader()} break
    case "compile": {compile_shader()} break
    case "copy intermediate": {if (TRANSPILED) clipboard_set_text(TRANSPILED_TEXT)} break

    case "saveas": {save_as()} break

    case "tempv": {copy_vs()} break
    case "tempp": {copy_ps()} break

    case "copy uniform": {clipboard_set_text(copy_uniforms())} break
    case "copy base64": {clipboard_set_text(pack_shader())} break

    case "source up": {with (SCROLL_IN) {
        scroll.scroll=max(0,scroll.scroll-H3L/scroll.th)
        sy=median(ystart,y+scroll.scroll*size,ystart+size)
    }} break
    case "source down": {with (SCROLL_IN) {
        scroll.scroll=min(1,scroll.scroll+H3L/scroll.th)
        sy=median(ystart,y+scroll.scroll*size,ystart+size)
    }} break

    case "output up": {with (SCROLL_OUT) {
        scroll.scroll=max(0,scroll.scroll-H3L/scroll.th)
        sy=median(ystart,y+scroll.scroll*size,ystart+size)
    }} break
    case "output down": {with (SCROLL_OUT) {
        scroll.scroll=min(1,scroll.scroll+H3L/scroll.th)
        sy=median(ystart,y+scroll.scroll*size,ystart+size)
    }} break
}
