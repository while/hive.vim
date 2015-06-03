" Vim syntax file
" Language:	HIVE Query Language
" Maintainer:	dgold
" Last Change:	2013-09-05
"
" Based off Oracle SQL syntax highlighting

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" The SQL reserved words, defined as keywords.

syn keyword hiveSpecial   false null true

syn keyword hiveKeyword   access add as asc begin by check cluster column
syn keyword hiveKeyword   compress connect current cursor decimal default desc
syn keyword hiveKeyword   else elsif end exception exclusive file for from
syn keyword hiveKeyword   function group having identified immediate increment
syn keyword hiveKeyword   index initial into is level loop maxextents mode modify
syn keyword hiveKeyword   nocompress nowait of offline on online start
syn keyword hiveKeyword   successful synonym table then to trigger uid
syn keyword hiveKeyword   unique user validate values view whenever hivevar
syn keyword hiveKeyword   where with option order pctfree privileges procedure
syn keyword hiveKeyword   public resource return row rowlabel rownum rows
syn keyword hiveKeyword   session share size smallint type using full outer join left right inner 
syn keyword hiveKeyword   format delimited fields terminated by collection items external
syn keyword hiveKeyword   stored sequencefile partitioned data local inpath overwrite clustered buckets sorted
syn keyword hiveKeyword   keys extended textfile location distribute directory tablesample using reduce lateral
syn keyword hiveKeyword   case when


syn keyword hiveFunction  not and or < <= == = >= > <> !=
syn keyword hiveFunction  if in any some all between exists
syn keyword hiveFunction  like escape rlike regexp coalesce
syn keyword hiveFunction  union intersect minus
syn keyword hiveFunction  prior distinct isnull count
syn keyword hiveFunction  sysdate out
syn keyword hiveFunction  round floor ceil rand concat substr upper ucase
syn keyword hiveFunction  lower lcase trim ltrim rtrim regexp_replace size
syn keyword hiveFunction  cast from_unixtime to_date year month day get_json_object
syn keyword hiveFunction  sum avg min max transform
syn keyword hiveFunction  variance var_samp stddev_pop stddev_samp
syn keyword hiveFunction  covar_pop covar_samp corr percentile percentil_approx
syn keyword hiveFunction  histogram_numeric collect_set inline explode
syn keyword hiveFunction  exp ln log10 log2 log pow sqrt bin hex unhex conv
syn keyword hiveFunction  abs pmod sin asin cos acos tan atan degrees radians
syn keyword hiveFunction  positive negative sign e pi binary
syn keyword hiveFunction  map_keys map_values array_contains sort_array
syn keyword hiveFunction  unix_timestamp dayofmonth hour minute second weekofyear
syn keyword hiveFunction  datediff date_add date_sub from_utc_timestamp to_utc_timestamp
syn keyword hiveFunction  ascii context_ngrams concate_ws find_in_set format_number
syn keyword hiveFunction  in_file instr length locate lpad ltrim ngrams parse_url
syn keyword hiveFunction  printf regexp_extract repeat reverse rpad trim sentences
syn keyword hiveFunction  space split str_to_map translate trim java_method reflect
syn keyword hiveFunction  xpath xpath_string xpath_boolean xpath_short xpath_int xpath_long xpath_float xpath_double xpath_number


syn keyword hiveStatement alter analyze audit comment commit create
syn keyword hiveStatement delete drop execute explain grant insert lock noaudit
syn keyword hiveStatement rename revoke rollback savepoint select set
syn keyword hiveStatement truncate update describe load use

syn keyword hiveType      tinyint smallint int bigint float double boolean 
syn keyword hiveType      string char varchar timestamp date
syn keyword hiveType      array map struct named_struct create_union

syn region hiveEnvVar     start="\${" end="}"

" Strings and characters:
syn region hiveString     start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region hiveString     start=+'+  skip=+\\\\\|\\'+  end=+'+

" Numbers:
syn match hiveNumber      "-\=\<\d\+\%(Y\|S\|L\|\.[0-9_]\+\)\=\>"

" Comments:
syn region hiveComment    start="/\*"  end="\*/" contains=hiveTodo
syn match hiveComment	  "--.*$" contains=hiveTodo

syn sync ccomment hiveComment

" Todo.
syn keyword hiveTodo contained TODO FIXME XXX DEBUG NOTE

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sql_syn_inits")
  if version < 508
    let did_sql_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink hiveComment	Comment
  "HiLink sqlKeyword	sqlSpecial
  HiLink hiveKeyword	Identifier
  HiLink hiveNumber	Number
  HiLink hiveFunction   Function	
  HiLink hiveSpecial	Boolean
  HiLink hiveStatement	Statement
  HiLink hiveString	String
  HiLink hiveType	Type
  HiLink hiveTodo	Todo
  HiLink hiveEnvVar     Underlined

  delcommand HiLink
endif

let b:current_syntax = "hive"

" vim: ts=8
