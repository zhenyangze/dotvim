function! FFindAndReplaceToggle()
    if !exists('g:FFAR_bufnrs')
        " 创建窗口并存储buffer号
        call FFindAndReplace()
    else
        " 关闭窗口并删除buffer
        for bufnr in g:FFAR_bufnrs
            let winnr = bufwinnr(bufnr)
            if winnr > 0
                execute winnr.'close'
            endif
            if bufnr != -1
                silent execute 'bdelete '.bufnr
            endif
        endfor
        silent! unlet g:FFAR_bufnrs
    endif
endfunction

function! FFindAndReplace()
    " 新建tab页
    tabnew
    " filetype ff_old
    let bufnr1 = bufnr('%')  " 获取buffer号
    set filetype=ff_old
    " filetype ff_new
    vnew
    let bufnr2 = bufnr('%')
    set filetype=ff_new
    " filetype ff_option
    vnew
    let bufnr3 = bufnr('%')
    set filetype=ff_option
    " move cursor to bottom
    " filetype ff_list
    vnew
    wincmd J
    let bufnr4 = bufnr('%')
    set filetype=ff_list
    let g:FFAR_bufnrs = [bufnr1, bufnr2, bufnr3, bufnr4]
endfunction

function FFindAndReplace_Find()
  " 获取filetype为ff_old的buffer内容保存到变量findStr中
  let findStr = ''
  let bufList = filter(range(1, bufnr('$')), 'getbufvar(v:val, "&filetype") == "ff_old"')

  if len(bufList) > 0
    let findStr = join(getbufline(bufList[0], 1, '$'), "\n")
  endif
  
  " 从vim当前目录搜索所有文件
  let fileList = split(system('find . -type f'), "\n")
  
  " 遍历所有文件，将匹配到的文件的完整文件名输出到filetype为ff_list的buffer中
  
  let buffers = filter(range(1, bufnr('$')), 'getbufvar(v:val, "&filetype") == "ff_list"')
  if len(buffers) == 0
      return
  endif
  let ffListBuf = buffers[0]
  exe 'silent! b ' . ffListBuf
  silent %d _
  
  let matchCount = 0
  for file in fileList
    if filereadable(file)
      let fileContent = join(readfile(file), "\n")
      if stridx(fileContent, findStr) != -1
        call append(line('$'), file)
        let matchCount += 1
      endif
    endif
  endfor
  
  " 搜索完成后,在Vim底部显示提示信息
  echo matchCount . ' files matched.'
endfunction


