function! gosasyu#gosasyu(name)
  "FIXME: Check arg yyyy/mm
  
  "出力
  " let a = s:createLine(0,0). s:createSeparetor()
  " echo a
  let a = s:createLine(0, 0)
  echo a

endfunction

function! s:createLine(startDay, startWeek)
  "FIXME: Check args
  
  let result = "| "
  if a:startWeek == 0
    let i = 0
    while i < 7
      let result = result.(a:startDay+i)." | "
      let i += 1
    endwhile
  else
    let i = 0
    while i < startWeek
    endwhile
  endif

  let result = result."\n"

  return result
endfunction

function! s:createSeparetor()
  return "| :---: | :---: | :---: | :---: | :---: | :---: | :---: |\n"
endfunction

function! s:checkStartWeek()
endfunction

function! s:countDays()
  let s:days = [31,28,31,30,31,30,31,31,30,31,30,31]

  return s:days[1]
endfunction

"Debug
call gosasyu#gosasyu(1)
