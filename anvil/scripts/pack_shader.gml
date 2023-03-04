if (!COMPILED) exit

b=buffer_create()
buffer_set_size(b,hlsl_get_size())
hlsl_get_buffer(buffer_get_address(b,0))

buffer_set_pos(b,0)

sig=buffer_read_u32(b)&$ffffff00
if (sig==$FFFE0300 || sig==$FFFE0200) func="vertex"
else if (sig==$FFFF0300 || sig==$FFFF0200) func="pixel"
else {
    show_message("Something wrong! show this to renex:#"+string_hex(sig))
    buffer_destroy(b)
    exit
}

buffer_deflate(b)

name=filename_remove_ext(filename_name(FILENAME))
if (name="") str=""
else str="/*"+crlf+"    "+name+crlf+"*/"+crlf+crlf

str+="return shader_"+func+"_create_base64("+qt+crlf+"    "
    +string_replace_all(buffer_read_base64(b,buffer_get_size(b)),crlf,crlf+"    ")
    +crlf+qt+")"+crlf+crlf+"/*"+crlf+"    "
    +string_replace_all(TEXT_IN,crlf,crlf+"    ")+crlf+"*/"

buffer_destroy(b)

COMPILE_LABEL="Packed shader copied to clipboard."
COMPILE_LABEL_COLOR=$ff00

return str
