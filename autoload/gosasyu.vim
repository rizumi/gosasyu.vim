function! gosasyu#gosasyu(name)
  "FIXME: Check arg yyyy/mm
  let input = split(a:name,'/')
  let year = input[0]
  let month = input[1]
  
  "出力
  let startDay = s:checkStartDay(year, month)
  let isLeapYear = s:checkLeapYear(year)
  let days = s:countDays(month, isLeapYear)


  let a = s:createLine(1, startDay, 7)
  let a = a.s:createSeparetor()
  
  let current = 7 - startDay + 1

  while current <= days
    if current + 7 <= days
      let a = a.s:createLine(current, 0, 7)
      let current += 7
    else 
      let a = a.s:createLine(current, 0, days - current + 1)
      let current += 7
    endif
  endwhile

  echo a

endfunction

function! s:checkStartDay(year, month)
  let year = a:year
  let month = a:month
 
  if month < 3
    let month = month + 12
  endif

  let h = (year + year/4 - year/100 + year/400 + (13 * month + 8)/5 + 1) % 7

  return h
endfunction

function! s:checkLeapYear(year)
  if a:year % 4 == 0 || (a:year % 100 == 0 && a:year % 400 == 0)
    return 1
  endif
  return 0
endfunction

function! s:createLine(originDay, start, end)
  let result = "| "
  if a:start == 0
    let i = 0
    while i < a:end
      let result = result.(a:originDay+i)." | "
      let i += 1
    endwhile
    
    while i < 7
      let result = result." | "
      let i += 1
    endwhile
  else
    let i = 0
    while i < a:start
      let result = result." | "
      let i += 1
    endwhile

    let j = 0
    while i < a:end
      let result = result.(a:originDay+j)." | "
      let i += 1
      let j += 1
    endwhile
    
    while i < 7
      let result = result." | "
      let i += 1
    endwhile
  endif

  let result = result."\n"

  return result
endfunction

function! s:createSeparetor()
  return "| :---: | :---: | :---: | :---: | :---: | :---: | :---: |\n"
endfunction

function! s:countDays(month, isLeapYear)
  if a:isLeapYear 
    let s:days = [31,29,31,30,31,30,31,31,30,31,30,31]
  else
    let s:days = [31,28,31,30,31,30,31,31,30,31,30,31]
  endif

  return s:days[a:month - 1]
endfunction

"Debug
"call gosasyu#gosasyu('2019/03')
