"=============================================================================
" File: vim-metarw-trello
" Author: a14198
" Created: 2017-12-11
"=============================================================================

" if !exists('g:trello_token')
"   echohl ErrorMsg | echomsg "require 'g:trello_token' variables" | echohl None
"   finish
" endif
"
" if !exists('g:trello_key')
"   echohl ErrorMsg | echomsg "require 'g:trello_key' variables" | echohl None
"   finish
" endif
"
" if !exists('g:trello_user')
"   echohl ErrorMsg | echomsg "require 'g:trello_user' variables" | echohl None
"   finish
" endif
"
" function! s:endpoint_url() " {{{
"   return "https://trello.com/1"
" endfunction " }}}
"
" function! s:url(...)
"   let server = substitute(s:endpoint_url(), '/\+$', '', '')
"   return join([server] + a:000 + ['?key=', g:trello_key] + ['&token=', g:trello_token] + ['&fields=name'], '')
" endfunction

" function! metarw#trello#complete(arglead, cmdline, cursorpos) " {{{
"   let _ = s:parse_incomplete_fakepath(a:arglead)
"   let candidates = []
"   if !_.boards_given_p
"     for board in s:get_boards(_)
"       call add(candidates,
"       \        printf('%s:/%s',
"       \               _.scheme,
"       \               board.identifier))
"     endfor
"     let head_part = printf('%s:/', _.scheme)
"     let tail_part = _.board
"   else
"   endif
"
"   return [candidates, head_part, tail_part]
" endfunction " }}}
"
" function! metarw#trello#read(fakepath) " {{{
"   let _ = s:parse_incomplete_fakepath(a:fakepath)
"
"   if _.boards_given_p
"     " let result = s:read_content(_)
"   else
"   endif
"
"   " return result
" endfunction " }}}
"
" function! metarw#trello#write(fakepath, line1, line2, append_p) " {{{
"   return []
" endfunction " }}}
"
" function! s:parse_incomplete_fakepath(incomplete_fakepath) " {{{
"   let _ = {}
"
"   let fragments = split(a:incomplete_fakepath, '^\l\+\zs:', !0)
"   if len(fragments) <= 1
"     echoerr 'Unexpected a:incomplete_fakepath:' string(a:incomplete_fakepath)
"     throw 'metarw:trello#e1'
"   endif
"   let fragments = [fragments[0]] + split(fragments[1], '[\/]')
"
"   let _.given_fakepath = a:incomplete_fakepath
"   let _.scheme = fragments[0]
"
"   " {boards}
"   let i = 1
"   if i < len(fragments)
"     let _.boards_given_p = !0
"     let _.boards = fragments[i]
"     let i += 1
"   else
"     let _.boards_given_p = !!0
"     let _.boards = ''
"   endif
"
"   return _
" endfunction " }}}
"
" function! s:get_boards(_)
"   let result = webapi#http#get(s:url('/members/'.g:trello_user.'/boards'))
"   let json = webapi#json#decode(result.content)
"
"   return json.boardss
" endfunction
