" Vim syntax file
" Language:    Lisp
" Maintainer:  Dr. Charles E. Campbell, Jr. <NdrOchipS@PcampbellAfamily.Mbiz>
" Last Change: Oct 12, 2005
" Version:     17a
" URL:         http://mysite.verizon.net/astronaut/vim/index.html#vimlinks_syntax
"
"  Thanks to F Xavier Noria for a list of 978 Common Lisp symbols
"  taken from the HyperSpec
"
"  ---
"  I have added the following sections to this file (AutoLisp, DCL, and Visual Lisp.)
"  I also tweaked several other sections (comments, lists, and  Atoms)
"  John Kaul
"  02.09.07
"  Last Updated: 05.11.10 9:23:06 AM
"  ---
"
" ---------------------------------------------------------------------
"  Load Once: /*{{{*/
" For vim-version 5.x: Clear all syntax items
" For vim-version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version >= 600
 setlocal iskeyword=42,43,45,47-58,60-62,64-90,97-122,_
else
 set iskeyword=42,43,45,47-58,60-62,64-90,97-122,_
endif

" ---------------------------------------------------------------------/*}}}*/
" Clusters: /*{{{*/
syn cluster                      lispAtomCluster                  contains=lispAtomBarSymbol,lispAtomList,lispAtomNmbr0,lispComment,lispDecl,lispFunc,lispLeadWhite
syn cluster                      lispBaseListCluster              contains=lispAtom,lispAtomBarSymbol,lispAtomMark,lispBQList,lispQList,lispBarSymbol,lispCommentRegion,lispComment,lispConcat,lispDecl,lispFunc,lispKey,lispList,lispNumber,lispSpecial,lispSymbol,lispVar,lispLeadWhite
if exists("g:lisp_instring")
 syn cluster                     lispListCluster                  contains=@lispBaseListCluster,lispString,lispInString,lispInStringString
else
 syn cluster                     lispListCluster                  contains=@lispBaseListCluster,lispString
endif

" ---------------------------------------------------------------------/*}}}*/
" Lists: /*{{{*/
syn match                        lispSymbol                       contained                        ![^()'`,"; \t]\+!
syn match                        lispBarSymbol                    contained                        !|..\{-}|!
if exists("g:lisp_rainbow") && g:lisp_rainbow != 0
 syn region lispParen0           matchgroup=hlLevel0 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen1 
 syn region lispParen1 contained matchgroup=hlLevel1 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen2 
 syn region lispParen2 contained matchgroup=hlLevel2 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen3 
 syn region lispParen3 contained matchgroup=hlLevel3 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen4 
 syn region lispParen4 contained matchgroup=hlLevel4 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen5 
 syn region lispParen5 contained matchgroup=hlLevel5 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen6 
 syn region lispParen6 contained matchgroup=hlLevel6 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen7 
 syn region lispParen7 contained matchgroup=hlLevel7 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen8 
 syn region lispParen8 contained matchgroup=hlLevel8 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen9 
 syn region lispParen9 contained matchgroup=hlLevel9 start="`\=(" end=")" skip="|.\{-}|" contains=@lispListCluster,lispParen0
else
 syn region                      lispList                         matchgroup=Delimiter start="("   skip="|.\{-}|"                   matchgroup=Delimiter end=")"                contains=@lispListCluster
 syn region                      lispBQList                       matchgroup=PreProc   start="`("  skip="|.\{-}|"                   matchgroup=PreProc   end=")"                contains=@lispListCluster
endif


 "  syn region lispParen0           matchgroup=hlLevel0 start=/(/ end=/)/ skip="|.\{-}|" contains=@lispListCluster,lispParen1 
 "  syn region lispParen1 contained matchgroup=hlLevel1 start=/(/ end=/)/ skip="|.\{-}|" contains=@lispListCluster,lispParen2 
 "  syn region lispParen2 contained matchgroup=hlLevel2 start=/(/ end=/)/ skip="|.\{-}|" contains=@lispListCluster,lispParen3 
 "  syn region lispParen3 contained matchgroup=hlLevel3 start=/(/ end=/)/ skip="|.\{-}|" contains=@lispListCluster,lispParen4 
 "  syn region lispParen4 contained matchgroup=hlLevel4 start=/(/ end=/)/ skip="|.\{-}|" contains=@lispListCluster,lispParen5 
 "  syn region lispParen5 contained matchgroup=hlLevel5 start=/(/ end=/)/ skip="|.\{-}|" contains=@lispListCluster,lispParen6 
 "  syn region lispParen6 contained matchgroup=hlLevel6 start=/(/ end=/)/ skip="|.\{-}|" contains=@lispListCluster,lispParen7 
 "  syn region lispParen7 contained matchgroup=hlLevel7 start=/(/ end=/)/ skip="|.\{-}|" contains=@lispListCluster,lispParen8 
 "  syn region lispParen8 contained matchgroup=hlLevel8 start=/(/ end=/)/ skip="|.\{-}|" contains=@lispListCluster,lispParen9 
 "  syn region lispParen9 contained matchgroup=hlLevel9 start=/(/ end=/)/ skip="|.\{-}|" contains=@lispListCluster,lispParen0

"    :sy region par1 matchgroup=par1 start="(" end=")" skip="|.\{-}|" contains=par2
"    :sy region par2 matchgroup=par2 start="(" end=")" skip="|.\{-}|" contains=par3 contained
"    :sy region par3 matchgroup=par3 start="(" end=")" skip="|.\{-}|" contains=par1 contained
"    :hi par1 ctermfg=red guifg=red
"    :hi par2 ctermfg=blue guifg=blue
"    :hi par3 ctermfg=darkgreen guifg=darkgreen

" ---------------------------------------------------------------------/*}}}*/
" Atoms: /*{{{*/
syn match                        lispAtomMark                     "'"
syn match                        lispAtom                         "'("me=e-1                       contains=lispAtomMark            nextgroup=lispAtomList
syn match                        lispAtom                         "'[^ \t()]\+"                    contains=lispAtomMark
"       syn match                        lispAtomBarSymbol                !'|..\{-}|!                      contains=lispAtomMark
syn region                       lispAtom                         start=+'"+                       skip=+\\"+ end=+"+
syn region                       lispAtomList                     contained                        matchgroup=Special start="'("     skip="|.\{-}|" matchgroup=Special end=")"                         contains=@lispAtomCluster,lispString
" syn region                       lispAtomList                     contained                        matchgroup=Special start="("     skip="|.\{-}|" matchgroup=Special end=")"                         contains=@lispAtomCluster,lispString
syn match                        lispAtomNmbr                     contained                        "\<\d\+"
syn match                        lispLeadWhite                    contained                        "^\s\+"

" ---------------------------------------------------------------------/*}}}*/
" Standard Lisp Functions and Macros: /*{{{*/
syn keyword lispFunc             *                                find-method                      pprint-indent
syn keyword lispFunc             **                               find-package                     pprint-linear
syn keyword lispFunc             ***                              find-restart                     pprint-logical-block
syn keyword lispFunc             +                                find-symbol                      pprint-newline
syn keyword lispFunc             ++                               finish-output                    pprint-pop
syn keyword lispFunc             +++                              first                            pprint-tab
syn keyword lispFunc             -                                fixnum                           pprint-tabular
syn keyword lispFunc             /                                flet                             prin1
syn keyword lispFunc             //                               float                            prin1-to-string
syn keyword lispFunc             ///                              float-digits                     princ
syn keyword lispFunc             /=                               float-precision                  princ-to-string
syn keyword lispFunc             1+                               float-radix                      print
syn keyword lispFunc             1-                               float-sign                       print-not-readable
syn keyword lispFunc             <                                floating-point-inexact           print-not-readable-object
syn keyword lispFunc             <=                               floating-point-invalid-operation print-object
syn keyword lispFunc             =                                floating-point-overflow          print-unreadable-object
syn keyword lispFunc             >                                floating-point-underflow         probe-file
syn keyword lispFunc             >=                               floatp                           proclaim
syn keyword lispFunc             abort                            floor                            prog
syn keyword lispFunc             abs                              fmakunbound                      prog*
syn keyword lispFunc             access                           force-output                     prog1
syn keyword lispFunc             acons                            format                           prog2
syn keyword lispFunc             acos                             formatter                        progn
syn keyword lispFunc             acosh                            fourth                           program-error
syn keyword lispFunc             add-method                       fresh-line                       progv
syn keyword lispFunc             adjoin                           fround                           provide
syn keyword lispFunc             adjust-array                     ftruncate                        psetf
syn keyword lispFunc             adjustable-array-p               ftype                            psetq
syn keyword lispFunc             allocate-instance                funcall                          push
syn keyword lispFunc             alpha-char-p                     function                         pushnew
syn keyword lispFunc             alphanumericp                    function-keywords                putprop
syn keyword lispFunc             and                              function-lambda-expression       quote
syn keyword lispFunc             append                           functionp                        random
syn keyword lispFunc             apply                            gbitp                            random-state
syn keyword lispFunc             applyhook                        gcd                              random-state-p
syn keyword lispFunc             apropos                          generic-function                 rassoc
syn keyword lispFunc             apropos-list                     gensym                           rassoc-if
syn keyword lispFunc             aref                             gentemp                          rassoc-if-not
syn keyword lispFunc             arithmetic-error                 get                              ratio
syn keyword lispFunc             arithmetic-error-operands        get-decoded-time                 rational
syn keyword lispFunc             arithmetic-error-operation       get-dispatch-macro-character     rationalize
syn keyword lispFunc             array                            get-internal-real-time           rationalp
syn keyword lispFunc             array-dimension                  get-internal-run-time            read
syn keyword lispFunc             array-dimension-limit            get-macro-character              read-byte
syn keyword lispFunc             array-dimensions                 get-output-stream-string         read-char
syn keyword lispFunc             array-displacement               get-properties                   read-char-no-hang
syn keyword lispFunc             array-element-type               get-setf-expansion               read-delimited-list
syn keyword lispFunc             array-has-fill-pointer-p         get-setf-method                  read-eval-print
syn keyword lispFunc             array-in-bounds-p                get-universal-time               read-from-string
syn keyword lispFunc             array-rank                       getf                             read-line
syn keyword lispFunc             array-rank-limit                 gethash                          read-preserving-whitespace
syn keyword lispFunc             array-row-major-index            go                               read-sequence
syn keyword lispFunc             array-total-size                 graphic-char-p                   reader-error
syn keyword lispFunc             array-total-size-limit           handler-bind                     readtable
syn keyword lispFunc             arrayp                           handler-case                     readtable-case
syn keyword lispFunc             ash                              hash-table                       readtablep
syn keyword lispFunc             asin                             hash-table-count                 real
syn keyword lispFunc             asinh                            hash-table-p                     realp
syn keyword lispFunc             assert                           hash-table-rehash-size           realpart
syn keyword lispFunc             assoc                            hash-table-rehash-threshold      reduce
syn keyword lispFunc             assoc-if                         hash-table-size                  reinitialize-instance
syn keyword lispFunc             assoc-if-not                     hash-table-test                  rem
syn keyword lispFunc             atan                             host-namestring                  remf
syn keyword lispFunc             atanh                            identity                         remhash
syn keyword lispFunc             atom                             if                               remove
syn keyword lispFunc             base-char                        if-exists                        remove-duplicates
syn keyword lispFunc             base-string                      ignorable                        remove-if
syn keyword lispFunc             bignum                           ignore                           remove-if-not
syn keyword lispFunc             bit                              ignore-errors                    remove-method
syn keyword lispFunc             bit-and                          imagpart                         remprop
syn keyword lispFunc             bit-andc1                        import                           rename-file
syn keyword lispFunc             bit-andc2                        in-package                       rename-package
syn keyword lispFunc             bit-eqv                          in-package                       replace
syn keyword lispFunc             bit-ior                          incf                             require
syn keyword lispFunc             bit-nand                         initialize-instance              rest
syn keyword lispFunc             bit-nor                          inline                           restart
syn keyword lispFunc             bit-not                          input-stream-p                   restart-bind
syn keyword lispFunc             bit-orc1                         inspect                          restart-case
syn keyword lispFunc             bit-orc2                         int-char                         restart-name
syn keyword lispFunc             bit-vector                       integer                          return
syn keyword lispFunc             bit-vector-p                     integer-decode-float             return-from
syn keyword lispFunc             bit-xor                          integer-length                   revappend
syn keyword lispFunc             block                            integerp                         reverse
syn keyword lispFunc             boole                            interactive-stream-p             room
syn keyword lispFunc             boole-1                          intern                           rotatef
syn keyword lispFunc             boole-2                          internal-time-units-per-second   round
syn keyword lispFunc             boole-and                        intersection                     row-major-aref
syn keyword lispFunc             boole-andc1                      invalid-method-error             rplaca
syn keyword lispFunc             boole-andc2                      invoke-debugger                  rplacd
syn keyword lispFunc             boole-c1                         invoke-restart                   safety
syn keyword lispFunc             boole-c2                         invoke-restart-interactively     satisfies
syn keyword lispFunc             boole-clr                        isqrt                            sbit
syn keyword lispFunc             boole-eqv                        keyword                          scale-float
syn keyword lispFunc             boole-ior                        keywordp                         schar
syn keyword lispFunc             boole-nand                       labels                           search
syn keyword lispFunc             boole-nor                        lambda                           second
syn keyword lispFunc             boole-orc1                       lambda-list-keywords             sequence
syn keyword lispFunc             boole-orc2                       lambda-parameters-limit          serious-condition
syn keyword lispFunc             boole-set                        last                             set
syn keyword lispFunc             boole-xor                        lcm                              set-char-bit
syn keyword lispFunc             boolean                          ldb                              set-difference
syn keyword lispFunc             both-case-p                      ldb-test                         set-dispatch-macro-character
syn keyword lispFunc             boundp                           ldiff                            set-exclusive-or
syn keyword lispFunc             break                            least-negative-double-float      set-macro-character
syn keyword lispFunc             broadcast-stream                 least-negative-long-float        set-pprint-dispatch
syn keyword lispFunc             broadcast-stream-streams         least-negative-normalized-double-float                            set-syntax-from-char
syn keyword lispFunc             built-in-class                   least-negative-normalized-long-float                              setf
syn keyword lispFunc             butlast                          least-negative-normalized-short-float                             setq
syn keyword lispFunc             byte                             least-negative-normalized-single-float                            seventh
syn keyword lispFunc             byte-position                    least-negative-short-float       shadow
syn keyword lispFunc             byte-size                        least-negative-single-float      shadowing-import
syn keyword lispFunc             call-arguments-limit             least-positive-double-float      shared-initialize
syn keyword lispFunc             call-method                      least-positive-long-float        shiftf
syn keyword lispFunc             call-next-method                 least-positive-normalized-double-float                            short-float
syn keyword lispFunc             capitalize                       least-positive-normalized-long-float                              short-float-epsilon
syn keyword lispFunc             car                              least-positive-normalized-short-float                             short-float-negative-epsilon
syn keyword lispFunc             case                             least-positive-normalized-single-float                            short-site-name
syn keyword lispFunc             catch                            least-positive-short-float       signal
syn keyword lispFunc             ccase                            least-positive-single-float      signed-byte
syn keyword lispFunc             cdr                              length                           signum
syn keyword lispFunc             ceiling                          let                              simle-condition
syn keyword lispFunc             cell-error                       let*                             simple-array
syn keyword lispFunc             cell-error-name                  lisp                             simple-base-string
syn keyword lispFunc             cerror                           lisp-implementation-type         simple-bit-vector
syn keyword lispFunc             change-class                     lisp-implementation-version      simple-bit-vector-p
syn keyword lispFunc             char                             list                             simple-condition-format-arguments
syn keyword lispFunc             char-bit                         list*                            simple-condition-format-control
syn keyword lispFunc             char-bits                        list-all-packages                simple-error
syn keyword lispFunc             char-bits-limit                  list-length                      simple-string
syn keyword lispFunc             char-code                        listen                           simple-string-p
syn keyword lispFunc             char-code-limit                  listp                            simple-type-error
syn keyword lispFunc             char-control-bit                 load                             simple-vector
syn keyword lispFunc             char-downcase                    load-logical-pathname-translations                                simple-vector-p
syn keyword lispFunc             char-equal                       load-time-value                  simple-warning
syn keyword lispFunc             char-font                        locally                          sin
syn keyword lispFunc             char-font-limit                  log                              single-flaot-epsilon
syn keyword lispFunc             char-greaterp                    logand                           single-float
syn keyword lispFunc             char-hyper-bit                   logandc1                         single-float-epsilon
syn keyword lispFunc             char-int                         logandc2                         single-float-negative-epsilon
syn keyword lispFunc             char-lessp                       logbitp                          sinh
syn keyword lispFunc             char-meta-bit                    logcount                         sixth
syn keyword lispFunc             char-name                        logeqv                           sleep
syn keyword lispFunc             char-not-equal                   logical-pathname                 slot-boundp
syn keyword lispFunc             char-not-greaterp                logical-pathname-translations    slot-exists-p
syn keyword lispFunc             char-not-lessp                   logior                           slot-makunbound
syn keyword lispFunc             char-super-bit                   lognand                          slot-missing
syn keyword lispFunc             char-upcase                      lognor                           slot-unbound
syn keyword lispFunc             char/=                           lognot                           slot-value
syn keyword lispFunc             char<                            logorc1                          software-type
syn keyword lispFunc             char<=                           logorc2                          software-version
syn keyword lispFunc             char=                            logtest                          some
syn keyword lispFunc             char>                            logxor                           sort
syn keyword lispFunc             char>=                           long-float                       space
syn keyword lispFunc             character                        long-float-epsilon               special
syn keyword lispFunc             characterp                       long-float-negative-epsilon      special-form-p
syn keyword lispFunc             check-type                       long-site-name                   special-operator-p
syn keyword lispFunc             cis                              loop                             speed
syn keyword lispFunc             class                            loop-finish                      sqrt
syn keyword lispFunc             class-name                       lower-case-p                     stable-sort
syn keyword lispFunc             class-of                         machine-instance                 standard
syn keyword lispFunc             clear-input                      machine-type                     standard-char
syn keyword lispFunc             clear-output                     machine-version                  standard-char-p
syn keyword lispFunc             close                            macro-function                   standard-class
syn keyword lispFunc             clrhash                          macroexpand                      standard-generic-function
syn keyword lispFunc             code-char                        macroexpand-1                    standard-method
syn keyword lispFunc             coerce                           macroexpand-l                    standard-object
syn keyword lispFunc             commonp                          macrolet                         step
syn keyword lispFunc             compilation-speed                make-array                       storage-condition
syn keyword lispFunc             compile                          make-array                       store-value
syn keyword lispFunc             compile-file                     make-broadcast-stream            stream
syn keyword lispFunc             compile-file-pathname            make-char                        stream-element-type
syn keyword lispFunc             compiled-function                make-concatenated-stream         stream-error
syn keyword lispFunc             compiled-function-p              make-condition                   stream-error-stream
syn keyword lispFunc             compiler-let                     make-dispatch-macro-character    stream-external-format
syn keyword lispFunc             compiler-macro                   make-echo-stream                 streamp
syn keyword lispFunc             compiler-macro-function          make-hash-table                  streamup
syn keyword lispFunc             complement                       make-instance                    string
syn keyword lispFunc             complex                          make-instances-obsolete          string-capitalize
syn keyword lispFunc             complexp                         make-list                        string-char
syn keyword lispFunc             compute-applicable-methods       make-load-form                   string-char-p
syn keyword lispFunc             compute-restarts                 make-load-form-saving-slots      string-downcase
syn keyword lispFunc             concatenate                      make-method                      string-equal
syn keyword lispFunc             concatenated-stream              make-package                     string-greaterp
syn keyword lispFunc             concatenated-stream-streams      make-pathname                    string-left-trim
syn keyword lispFunc             cond                             make-random-state                string-lessp
syn keyword lispFunc             condition                        make-sequence                    string-not-equal
syn keyword lispFunc             conjugate                        make-string                      string-not-greaterp
syn keyword lispFunc             cons                             make-string-input-stream         string-not-lessp
syn keyword lispFunc             consp                            make-string-output-stream        string-right-strim
syn keyword lispFunc             constantly                       make-symbol                      string-right-trim
syn keyword lispFunc             constantp                        make-synonym-stream              string-stream
syn keyword lispFunc             continue                         make-two-way-stream              string-trim
syn keyword lispFunc             control-error                    makunbound                       string-upcase
syn keyword lispFunc             copy-alist                       map                              string/=
syn keyword lispFunc             copy-list                        map-into                         string<
syn keyword lispFunc             copy-pprint-dispatch             mapc                             string<=
syn keyword lispFunc             copy-readtable                   mapcan                           string=
syn keyword lispFunc             copy-seq                         mapcar                           string>
syn keyword lispFunc             copy-structure                   mapcon                           string>=
syn keyword lispFunc             copy-symbol                      maphash                          stringp
syn keyword lispFunc             copy-tree                        mapl                             structure
syn keyword lispFunc             cos                              maplist                          structure-class
syn keyword lispFunc             cosh                             mask-field                       structure-object
syn keyword lispFunc             count                            max                              style-warning
syn keyword lispFunc             count-if                         member                           sublim
syn keyword lispFunc             count-if-not                     member-if                        sublis
syn keyword lispFunc             ctypecase                        member-if-not                    subseq
syn keyword lispFunc             debug                            merge                            subsetp
syn keyword lispFunc             decf                             merge-pathname                   subst
syn keyword lispFunc             declaim                          merge-pathnames                  subst-if
syn keyword lispFunc             declaration                      method                           subst-if-not
syn keyword lispFunc             declare                          method-combination               substitute
syn keyword lispFunc             decode-float                     method-combination-error         substitute-if
syn keyword lispFunc             decode-universal-time            method-qualifiers                substitute-if-not
syn keyword lispFunc             defclass                         min                              subtypep
syn keyword lispFunc             defconstant                      minusp                           svref
syn keyword lispFunc             defgeneric                       mismatch                         sxhash
syn keyword lispFunc             define-compiler-macro            mod                              symbol
syn keyword lispFunc             define-condition                 most-negative-double-float       symbol-function
syn keyword lispFunc             define-method-combination        most-negative-fixnum             symbol-macrolet
syn keyword lispFunc             define-modify-macro              most-negative-long-float         symbol-name
syn keyword lispFunc             define-setf-expander             most-negative-short-float        symbol-package
syn keyword lispFunc             define-setf-method               most-negative-single-float       symbol-plist
syn keyword lispFunc             define-symbol-macro              most-positive-double-float       symbol-value
syn keyword lispFunc             defmacro                         most-positive-fixnum             symbolp
syn keyword lispFunc             defmethod                        most-positive-long-float         synonym-stream
syn keyword lispFunc             defpackage                       most-positive-short-float        synonym-stream-symbol
syn keyword lispFunc             defparameter                     most-positive-single-float       sys
syn keyword lispFunc             defsetf                          muffle-warning                   system
syn keyword lispFunc             defstruct                        multiple-value-bind
syn keyword lispFunc             deftype                          multiple-value-call              tagbody
syn keyword lispFunc             defun                            multiple-value-list              tailp
syn keyword lispFunc             defvar                           multiple-value-prog1             tan
syn keyword lispFunc             delete                           multiple-value-seteq             tanh
syn keyword lispFunc             delete-duplicates                multiple-value-setq              tenth
syn keyword lispFunc             delete-file                      multiple-values-limit            terpri
syn keyword lispFunc             delete-if                        name-char                        the
syn keyword lispFunc             delete-if-not                    namestring                       third
syn keyword lispFunc             delete-package                   nbutlast                         throw
syn keyword lispFunc             denominator                      nconc                            time
syn keyword lispFunc             deposit-field                    next-method-p                    trace
syn keyword lispFunc             describe                         translate-logical-pathname
syn keyword lispFunc             describe-object                  nintersection                    translate-pathname
syn keyword lispFunc             destructuring-bind               ninth                            tree-equal
syn keyword lispFunc             digit-char                       no-applicable-method             truename
syn keyword lispFunc             digit-char-p                     no-next-method                   truncase
syn keyword lispFunc             directory                        not                              truncate
syn keyword lispFunc             directory-namestring             notany                           two-way-stream
syn keyword lispFunc             disassemble                      notevery                         two-way-stream-input-stream
syn keyword lispFunc             division-by-zero                 notinline                        two-way-stream-output-stream
syn keyword lispFunc             do                               nreconc                          type
syn keyword lispFunc             do*                              nreverse                         type-error
syn keyword lispFunc             do-all-symbols                   nset-difference                  type-error-datum
syn keyword lispFunc             do-exeternal-symbols             nset-exclusive-or                type-error-expected-type
syn keyword lispFunc             do-external-symbols              nstring                          type-of
syn keyword lispFunc             do-symbols                       nstring-capitalize               typecase
syn keyword lispFunc             documentation                    nstring-downcase                 typep
syn keyword lispFunc             dolist                           nstring-upcase                   unbound-slot
syn keyword lispFunc             dotimes                          nsublis                          unbound-slot-instance
syn keyword lispFunc             double-float                     nsubst                           unbound-variable
syn keyword lispFunc             double-float-epsilon             nsubst-if                        undefined-function
syn keyword lispFunc             double-float-negative-epsilon    nsubst-if-not                    unexport
syn keyword lispFunc             dpb                              nsubstitute                      unintern
syn keyword lispFunc             dribble                          nsubstitute-if                   union
syn keyword lispFunc             dynamic-extent                   nsubstitute-if-not               unless
syn keyword lispFunc             ecase                            nth                              unread
syn keyword lispFunc             echo-stream                      nth-value                        unread-char
syn keyword lispFunc             echo-stream-input-stream         nthcdr                           unsigned-byte
syn keyword lispFunc             echo-stream-output-stream        null                             untrace
syn keyword lispFunc             ed                               number                           unuse-package
syn keyword lispFunc             eighth                           numberp                          unwind-protect
syn keyword lispFunc             elt                              numerator                        update-instance-for-different-class
syn keyword lispFunc             encode-universal-time            nunion                           update-instance-for-redefined-class
syn keyword lispFunc             end-of-file                      oddp                             upgraded-array-element-type
syn keyword lispFunc             endp                             open                             upgraded-complex-part-type
syn keyword lispFunc             enough-namestring                open-stream-p                    upper-case-p
syn keyword lispFunc             ensure-directories-exist         optimize                         use-package
syn keyword lispFunc             ensure-generic-function          or                               use-value
syn keyword lispFunc             eq                               otherwise                        user
syn keyword lispFunc             eql                              output-stream-p                  user-homedir-pathname
syn keyword lispFunc             equal                            package                          values
syn keyword lispFunc             equalp                           package-error                    values-list
syn keyword lispFunc             error                            package-error-package            vector
syn keyword lispFunc             etypecase                        package-name                     vector-pop
syn keyword lispFunc             eval                             package-nicknames                vector-push
syn keyword lispFunc             eval-when                        package-shadowing-symbols        vector-push-extend
syn keyword lispFunc             evalhook                         package-use-list                 vectorp
syn keyword lispFunc             evenp                            package-used-by-list             warn
syn keyword lispFunc             every                            packagep                         warning
syn keyword lispFunc             exp                              pairlis                          when
syn keyword lispFunc             export                           parse-error                      wild-pathname-p
syn keyword lispFunc             expt                             parse-integer                    with-accessors
syn keyword lispFunc             extended-char                    parse-namestring                 with-compilation-unit
syn keyword lispFunc             fboundp                          pathname                         with-condition-restarts
syn keyword lispFunc             fceiling                         pathname-device                  with-hash-table-iterator
syn keyword lispFunc             fdefinition                      pathname-directory               with-input-from-string
syn keyword lispFunc             ffloor                           pathname-host                    with-open-file
syn keyword lispFunc             fifth                            pathname-match-p                 with-open-stream
syn keyword lispFunc             file-author                      pathname-name                    with-output-to-string
syn keyword lispFunc             file-error                       pathname-type                    with-package-iterator
syn keyword lispFunc             file-error-pathname              pathname-version                 with-simple-restart
syn keyword lispFunc             file-length                      pathnamep                        with-slots
syn keyword lispFunc             file-namestring                  peek-char                        with-standard-io-syntax
syn keyword lispFunc             file-position                    phase                            write
syn keyword lispFunc             file-stream                      pi                               write-byte
syn keyword lispFunc             file-string-length               plusp                            write-char
syn keyword lispFunc             file-write-date                  pop                              write-line
syn keyword lispFunc             fill                             position                         write-sequence
syn keyword lispFunc             fill-pointer                     position-if                      write-string
syn keyword lispFunc             find                             position-if-not                  write-to-string
syn keyword lispFunc             find-all-symbols                 pprint                           y-or-n-p
syn keyword lispFunc             find-class                       pprint-dispatch                  yes-or-no-p
syn keyword lispFunc             find-if                          pprint-exit-if-list-exhausted    zerop
syn keyword lispFunc             find-if-not                      pprint-fill

syn match   lispFunc             "\<c[ad]\+r\>"

" ---------------------------------------------------------------------/*}}}*/
"       " Lisp Keywords (modifiers): /*{{{*/
"       syn keyword lispKey              :abort                           :from-end                        :overwrite
"       syn keyword lispKey              :adjustable                      :gensym                          :predicate
"       syn keyword lispKey              :append                          :host                            :preserve-whitespace
"       syn keyword lispKey              :array                           :if-does-not-exist               :pretty
"       syn keyword lispKey              :base                            :if-exists                       :print
"       syn keyword lispKey              :case                            :include                         :print-function
"       syn keyword lispKey              :circle                          :index                           :probe
"       syn keyword lispKey              :conc-name                       :inherited                       :radix
"       syn keyword lispKey              :constructor                     :initial-contents                :read-only
"       syn keyword lispKey              :copier                          :initial-element                 :rehash-size
"       syn keyword lispKey              :count                           :initial-offset                  :rehash-threshold
"       syn keyword lispKey              :create                          :initial-value                   :rename
"       syn keyword lispKey              :default                         :input                           :rename-and-delete
"       syn keyword lispKey              :defaults                        :internal                        :size
"       syn keyword lispKey              :device                          :io                              :start
"       syn keyword lispKey              :direction                       :junk-allowed                    :start1
"       syn keyword lispKey              :directory                       :key                             :start2
"       syn keyword lispKey              :displaced-index-offset          :length                          :stream
"       syn keyword lispKey              :displaced-to                    :level                           :supersede
"       syn keyword lispKey              :element-type                    :name                            :test
"       syn keyword lispKey              :end                             :named                           :test-not
"       syn keyword lispKey              :end1                            :new-version                     :type
"       syn keyword lispKey              :end2                            :nicknames                       :use
"       syn keyword lispKey              :error                           :output                          :verbose
"       syn keyword lispKey              :escape                          :output-file                     :version
"       syn keyword lispKey              :external
"       
"       " ---------------------------------------------------------------------/*}}}*/
" Standard Lisp Variables: /*{{{*/
syn keyword lispVar              *applyhook*                      *load-pathname*                  *print-pprint-dispatch*
syn keyword lispVar              *break-on-signals*               *load-print*                     *print-pprint-dispatch*
syn keyword lispVar              *break-on-signals*               *load-truename*                  *print-pretty*
syn keyword lispVar              *break-on-warnings*              *load-verbose*                   *print-radix*
syn keyword lispVar              *compile-file-pathname*          *macroexpand-hook*               *print-readably*
syn keyword lispVar              *compile-file-pathname*          *modules*                        *print-right-margin*
syn keyword lispVar              *compile-file-truename*          *package*                        *print-right-margin*
syn keyword lispVar              *compile-file-truename*          *print-array*                    *query-io*
syn keyword lispVar              *compile-print*                  *print-base*                     *random-state*
syn keyword lispVar              *compile-verbose*                *print-case*                     *read-base*
syn keyword lispVar              *compile-verbose*                *print-circle*                   *read-default-float-format*
syn keyword lispVar              *debug-io*                       *print-escape*                   *read-eval*
syn keyword lispVar              *debugger-hook*                  *print-gensym*                   *read-suppress*
syn keyword lispVar              *default-pathname-defaults*      *print-length*                   *readtable*
syn keyword lispVar              *error-output*                   *print-level*                    *standard-input*
syn keyword lispVar              *evalhook*                       *print-lines*                    *standard-output*
syn keyword lispVar              *features*                       *print-miser-width*              *terminal-io*
syn keyword lispVar              *gensym-counter*                 *print-miser-width*              *trace-output*

" ---------------------------------------------------------------------/*}}}*/
" Strings: /*{{{*/
syn region                       lispString                       start=+"+ skip=+\\\\\|\\"+ end=+"+

if exists("g:lisp_instring")
 syn region                      lispInString                     keepend matchgroup=Delimiter start=+"(+rs=s+1 skip=+|.\{-}|+ matchgroup=Delimiter end=+)"+ contains=@lispBaseListCluster,lispInStringString
 syn region                      lispInStringString               start=+\\"+ skip=+\\\\+ end=+\\"+ contained
endif


" ---------------------------------------------------------------------/*}}}*/
"       " Shared with Xlisp, Declarations, Macros, Functions: /*{{{*/
"       syn keyword lispDecl             defmacro                         do-all-symbols                   labels
"       syn keyword lispDecl             defsetf                          do-external-symbols              let
"       syn keyword lispDecl             deftype                          do-symbols                       locally
"       syn keyword lispDecl             defun                            dotimes                          macrolet
"       syn keyword lispDecl             do*                              flet                             multiple-value-bind
"       
"       " ---------------------------------------------------------------------/*}}}*/
" Autolisp: /*{{{*/
" standard autolisp functions
syn case ignore
syn keyword lispFunc    _autoarxload    _autoloa        _autoqload
syn keyword lispFunc    _internal-load-all-file         _ver
syn keyword lispFunc    *merr*          *merrmsg*       1+
syn keyword lispFunc    1-              abs             ads
syn keyword lispFunc    alert           alloc           and
syn keyword lispFunc    angle           angtof          angtos
syn keyword lispFunc    append          apply           arx
syn keyword lispFunc    arxload         arxunload       ascii
syn keyword lispFunc    assoc           atan            atof
syn keyword lispFunc    atoi            atom            atoms-family
syn keyword lispFunc    autoarxload     autoload        autoxload
syn keyword lispFunc    boole           boundp          caaaar
syn keyword lispFunc    caaadr          caaar           caacdr
syn keyword lispFunc    caadar          caaddr          caadr
syn keyword lispFunc    caar            cadaar          cadadr
syn keyword lispFunc    cadar           caddar          cadddr
syn keyword lispFunc    caddr           cadr            car
syn keyword lispFunc    cdaaar          cdaadr          cdaar
syn keyword lispFunc    cdadar          cdaddr          cdadr
syn keyword lispFunc    cdar            cddaar          cddadr
syn keyword lispFunc    cddar           cdddar          cddddr
syn keyword lispFunc    cdddr           cddr            cdr
syn keyword lispFunc    chr             close           command
syn keyword lispFunc    cond            cons            cos
syn keyword lispFunc    cvunit          defun           dictadd
syn keyword lispFunc    dictnext        dictremove      dictrename
syn keyword lispFunc    dictsearch      distance        distof
syn keyword lispFunc    entdel          entget          entlast
syn keyword lispFunc    entmake         entmakex        entmod
syn keyword lispFunc    entnext         entsel          entupd
syn keyword lispFunc    eq              equal           eval
syn keyword lispFunc    exit            exp             expand
syn keyword lispFunc    expt            findfile        fix
syn keyword lispFunc    float           foreach         gc
syn keyword lispFunc    gcd             getangle        getcfg
syn keyword lispFunc    getcname        getcorner       getdist
syn keyword lispFunc    getenv          getfiled        getint
syn keyword lispFunc    getkword        getorient       getpoint
syn keyword lispFunc    getreal         getstring       geturl
syn keyword lispFunc    getvar          graphscr        grclear
syn keyword lispFunc    grdraw          grread          grtext
syn keyword lispFunc    grvecs          handent         help
syn keyword lispFunc    if              initdia         initget
syn keyword lispFunc    inters          itoa            lambda
syn keyword lispFunc    last            layoutlist      length
syn keyword lispFunc    lisped          list            listp
syn keyword lispFunc    load            loadedp         log
syn keyword lispFunc    logand          logior          lsh
syn keyword lispFunc    mapcar          max             mem
syn keyword lispFunc    member          menucmd         menugroup
syn keyword lispFunc    min             minusp          namedobjdict
syn keyword lispFunc    nentsel         nentselp        not
syn keyword lispFunc    nth             null            numberp
syn keyword lispFunc    open            or              osnap
syn keyword lispFunc    polar           prin1           princ
syn keyword lispFunc    print           progn           prompt
syn keyword lispFunc    quit            quote           read
syn keyword lispFunc    read-char       read-line       redraw
syn keyword lispFunc    regapp          rem             repeat
syn keyword lispFunc    report          reverse         rtos
syn keyword lispFunc    set             setcfg          setenv
syn keyword lispFunc    setfunhelp      setq            seturl
syn keyword lispFunc    setvar          setview         sin
syn keyword lispFunc    snvalid         sqrt            ssadd
syn keyword lispFunc    ssdel           ssget           ssgetfirst
syn keyword lispFunc    sslength        ssmemb          ssname
syn keyword lispFunc    ssnamex         sssetfirst      startapp
syn keyword lispFunc    strcase         strcat          strlen
syn keyword lispFunc    subst           substr          tablet
syn keyword lispFunc    tblnext         tblobjname      tblsearch
syn keyword lispFunc    terpri          textbox         textpage
syn keyword lispFunc    textscr         trace           trans
syn keyword lispFunc    type            untrace         ver
syn keyword lispFunc    vmon            vports          wcmatch
syn keyword lispFunc    while           write-char      write-line
syn keyword lispFunc    xdroom          xdsize          xload
syn keyword lispFunc    xstrcase        xunload         zerop

" ---------------------------------------------------------------------/*}}}*/
" DCL: /*{{{*/
" dcl based lisp functions
syn case ignore
syn keyword lispFunc    action_tile     add_list        client_data_tile
syn keyword lispFunc    dimx_tile       dimy_tile       done_dialog
syn keyword lispFunc    end_image       end_list        fill_image
syn keyword lispFunc    get_attr        get_tile        load_dialog
syn keyword lispFunc    mode_tile       new_dialog      set_tile
syn keyword lispFunc    slide_image     start_dialog    start_image
syn keyword lispFunc    start_list      term_dialog     unload_dialog
syn keyword lispFunc    vector_image    

" ---------------------------------------------------------------------/*}}}*/
" VisualLisp: /*{{{*/
" visual lisp functions etc
syn case ignore
syn keyword lispFunc    _vl-balance-parenthesis                         _vl-fast-mode                                   _vl-times
syn keyword lispFunc    _vlisp-version                                  defun-q                                         defun-q-list-ref
syn keyword lispFunc    defun-q-list-set                                function                                        pragma
syn keyword lispFunc    safearray                                       safearray-get-dim                               safearray-get-element
syn keyword lispFunc    safearray-get-l-bound                           safearray-get-u-bound                           safearray-put-element
syn keyword lispFunc    safearray-type                                  safearray-value                                 variant
syn keyword lispFunc    variant-type                                    variant-value                                   verify_arxapp_loaded
syn keyword lispFunc    vl-acad-defun                                   vl-acad-undefun                                 vl-arx-import
syn keyword lispFunc    vl-bb-ref                                       vl-bb-set                                       vl-bt
syn keyword lispFunc    vl-bt-off                                       vl-bt-on                                        vl-catch-all
syn keyword lispFunc    vl-catch-all-apply                              vl-catch-all-error-message                      vl-catch-all-error-p
syn keyword lispFunc    vl-cmdf                                         vl-consp                                        vl-directory-files
syn keyword lispFunc    vl-doc-export                                   vl-doc-import                                   vl-doc-ref
syn keyword lispFunc    vl-doc-set                                      vl-every                                        vl-exit-with-error
syn keyword lispFunc    vl-exit-with-value                              vl-file-copy                                    vl-file-delete
syn keyword lispFunc    vl-file-directory-p                             vl-file-rename                                  vl-file-size
syn keyword lispFunc    vl-file-systime                                 vl-filename-base                                vl-filename-directory
syn keyword lispFunc    vl-filename-extension                           vl-filename-mktemp                              vl-get-resource
syn keyword lispFunc    vl-infp                                         vl-init                                         vl-list*
syn keyword lispFunc    vl-list->string                                 vl-list-exported-functions                      vl-list-length
syn keyword lispFunc    vl-list-loaded-vlx                              vl-load                                         vl-load-all
syn keyword lispFunc    vl-load-com                                     vl-load-reactors                                vl-member-if
syn keyword lispFunc    vl-member-if-not                                vl-mkdir                                        vl-nanp
syn keyword lispFunc    vl-position                                     vl-prin1-to-string                              vl-princ-to-string
syn keyword lispFunc    vl-propagate                                    vl-registry-delete                              vl-registry-descendents
syn keyword lispFunc    vl-registry-read                                vl-registry-write                               vl-remove
syn keyword lispFunc    vl-remove-if                                    vl-remove-if-not                                vl-some
syn keyword lispFunc    vl-sort                                         vl-sort-i                                       vl-string->list
syn keyword lispFunc    vl-string-elt                                   vl-string-left-trim                             vl-string-mismatch
syn keyword lispFunc    vl-string-position                              vl-string-right-trim                            vl-string-search
syn keyword lispFunc    vl-string-subst                                 vl-string-translate                             vl-string-trim
syn keyword lispFunc    vl-symbol-name                                  vl-symbol-value                                 vl-symbolp
syn keyword lispFunc    vl-unload-vlx                                   vl-vbaload                                      vl-vbarun
syn keyword lispFunc    vl-vlx-loaded-p                                 vla-Activate                                    vla-Add
syn keyword lispFunc    vla-Add3DFace                                   vla-Add3DMesh                                   vla-Add3DPoly
syn keyword lispFunc    vla-AddArc                                      vla-AddAttribute                                vla-AddBox
syn keyword lispFunc    vla-AddCircle                                   vla-AddCone                                     vla-AddCustomObject
syn keyword lispFunc    vla-AddCylinder                                 vla-AddDim3PointAngular                         vla-AddDimAligned
syn keyword lispFunc    vla-AddDimAngular                               vla-AddDimDiametric                             vla-AddDimOrdinate
syn keyword lispFunc    vla-AddDimRadial                                vla-AddDimRotated                               vla-AddEllipse
syn keyword lispFunc    vla-AddEllipticalCone                           vla-AddEllipticalCylinder                       vla-AddExtrudedSolid
syn keyword lispFunc    vla-AddExtrudedSolidAlongPath                   vla-AddFitPoint                                 vla-AddHatch
syn keyword lispFunc    vla-AddItems                                    vla-AddLeader                                   vla-AddLightWeightPolyline
syn keyword lispFunc    vla-AddLine                                     vla-AddMenuItem                                 vla-AddMInsertBlock
syn keyword lispFunc    vla-AddMLine                                    vla-AddMText                                    vla-AddObject
syn keyword lispFunc    vla-AddPoint                                    vla-AddPolyfaceMesh                             vla-AddPolyline
syn keyword lispFunc    vla-AddPViewport                                vla-AddRaster                                   vla-AddRay
syn keyword lispFunc    vla-AddRegion                                   vla-AddRevolvedSolid                            vla-AddSeparator
syn keyword lispFunc    vla-AddShape                                    vla-AddSolid                                    vla-AddSphere
syn keyword lispFunc    vla-AddSpline                                   vla-AddSubMenu                                  vla-AddText
syn keyword lispFunc    vla-AddTolerance                                vla-AddToolbarButton                            vla-AddTorus
syn keyword lispFunc    vla-AddTrace                                    vla-AddVertex                                   vla-AddWedge
syn keyword lispFunc    vla-AddXline                                    vla-AddXRecord                                  vla-AngleFromXAxis
syn keyword lispFunc    vla-AngleToReal                                 vla-AngleToString                               vla-AppendInnerLoop
syn keyword lispFunc    vla-AppendItems                                 vla-AppendOuterLoop                             vla-AppendVertex
syn keyword lispFunc    vla-ArrayPolar                                  vla-ArrayRectangular                            vla-AttachExternalReference
syn keyword lispFunc    vla-AttachToolbarToFlyout                       vla-AuditInfo                                   vla-Bind
syn keyword lispFunc    vla-Boolean                                     vla-CheckInterference                           vla-Clear
syn keyword lispFunc    vla-ClipBoundary                                vla-Close                                       vla-Copy
syn keyword lispFunc    vla-CopyFrom                                    vla-CopyObjects                                 vla-CopyProfile
syn keyword lispFunc    vla-CreateTypedArray                            vla-Delete                                      vla-DeleteConfiguration
syn keyword lispFunc    vla-DeleteFitPoint                              vla-DeleteProfile                               vla-Detach
syn keyword lispFunc    vla-Display                                     vla-DisplayPlotPreview                          vla-DistanceToReal
syn keyword lispFunc    vla-Dock                                        vla-ElevateOrder                                vla-EndUndoMark
syn keyword lispFunc    vla-Erase                                       vla-Eval                                        vla-Evaluate
syn keyword lispFunc    vla-Explode                                     vla-Export                                      vla-ExportProfile
syn keyword lispFunc    vla-Float                                       vla-get-Active                                  vla-get-ActiveDimStyle
syn keyword lispFunc    vla-get-ActiveDocument                          vla-get-ActiveLayer                             vla-get-ActiveLayout
syn keyword lispFunc    vla-get-ActiveLinetype                          vla-get-ActiveProfile                           vla-get-ActivePViewport
syn keyword lispFunc    vla-get-ActiveSelectionSet                      vla-get-ActiveSpace                             vla-get-ActiveTextStyle
syn keyword lispFunc    vla-get-ActiveUCS                               vla-get-ActiveViewport                          vla-get-ADCInsertUnitsDefaultSource
syn keyword lispFunc    vla-get-ADCInsertUnitsDefaultTarget             vla-get-Alignment                               vla-get-AlignmentPointAcquisition
syn keyword lispFunc    vla-get-AllowLongSymbolNames                    vla-get-AltFontFile                             vla-get-AltRoundDistance
syn keyword lispFunc    vla-get-AltSuppressLeadingZeros                 vla-get-AltSuppressTrailingZeros                vla-get-AltSuppressZeroFeet
syn keyword lispFunc    vla-get-AltSuppressZeroInches                   vla-get-AltTabletMenuFile                       vla-get-AltTextPrefix
syn keyword lispFunc    vla-get-AltTextSuffix                           vla-get-AltTolerancePrecision                   vla-get-AltToleranceSuppressLeadingZeros
syn keyword lispFunc    vla-get-AltToleranceSuppressTrailingZeros       vla-get-AltToleranceSuppressZeroFeet            vla-get-AltToleranceSuppressZeroInches
syn keyword lispFunc    vla-get-AltUnits                                vla-get-AltUnitsFormat                          vla-get-AltUnitsPrecision
syn keyword lispFunc    vla-get-AltUnitsScale                           vla-get-angle                                   vla-get-AngleFormat
syn keyword lispFunc    vla-get-AngleVertex                             vla-get-Annotation                              vla-get-Application
syn keyword lispFunc    vla-get-ArcLength                               vla-get-ArcSmoothness                           vla-get-Area
syn keyword lispFunc    vla-get-Arrowhead1Block                         vla-get-Arrowhead1Type                          vla-get-Arrowhead2Block
syn keyword lispFunc    vla-get-Arrowhead2Type                          vla-get-ArrowheadBlock                          vla-get-ArrowheadSize
syn keyword lispFunc    vla-get-ArrowheadType                           vla-get-AssociativeHatch                        vla-get-AttachmentPoint
syn keyword lispFunc    vla-get-AutoAudit                               vla-get-AutoSaveInterval                        vla-get-AutoSavePath
syn keyword lispFunc    vla-get-AutoSnapAperture                        vla-get-AutoSnapApertureSize                    vla-get-AutoSnapMagnet
syn keyword lispFunc    vla-get-AutoSnapMarker                          vla-get-AutoSnapMarkerColor                     vla-get-AutoSnapMarkerSize
syn keyword lispFunc    vla-get-AutoSnapToolTip                         vla-get-AutoTrackingVecColor                    vla-get-AutoTrackTooltip
syn keyword lispFunc    vla-get-Backward                                vla-get-BasePoint                               vla-get-BatchPlotProgress
syn keyword lispFunc    vla-get-BeepOnError                             vla-get-BigFontFile                             vla-get-Block
syn keyword lispFunc    vla-get-Blocks                                  vla-get-Brightness                              vla-get-CanonicalMediaName
syn keyword lispFunc    vla-get-Caption                                 vla-get-Center                                  vla-get-CenterMarkSize
syn keyword lispFunc    vla-get-CenterPlot                              vla-get-CenterType                              vla-get-Centroid
syn keyword lispFunc    vla-get-Check                                   vla-get-Circumference                           vla-get-Clipped
syn keyword lispFunc    vla-get-ClippingEnabled                         vla-get-Closed                                  vla-get-Color
syn keyword lispFunc    vla-get-Columns                                 vla-get-ColumnSpacing                           vla-get-ConfigFile
syn keyword lispFunc    vla-get-ConfigName                              vla-get-Constant                                vla-get-ConstantWidth
syn keyword lispFunc    vla-get-ContourLinesPerSurface                  vla-get-Contrast                                vla-get-ControlPoints
syn keyword lispFunc    vla-get-Coordinate                              vla-get-Coordinates                             vla-get-Count
syn keyword lispFunc    vla-get-CreateBackup                            vla-get-CursorSize                              vla-get-CustomDictionary
syn keyword lispFunc    vla-get-CustomScale                             vla-get-Database                                vla-get-DecimalSeparator
syn keyword lispFunc    vla-get-DefaultInternetURL                      vla-get-DefaultOutputDevice                     vla-get-DefaultPlotStyleForLayer
syn keyword lispFunc    vla-get-DefaultPlotStyleForObjects              vla-get-DefaultPlotStyleTable                   vla-get-Degree
syn keyword lispFunc    vla-get-Delta                                   vla-get-DemandLoadARXApp                        vla-get-Description
syn keyword lispFunc    vla-get-Diameter                                vla-get-Dictionaries                            vla-get-DimensionLineColor
syn keyword lispFunc    vla-get-DimensionLineExtend                     vla-get-DimensionLineWeight                     vla-get-DimLine1Suppress
syn keyword lispFunc    vla-get-DimLine2Suppress                        vla-get-DimLineInside                           vla-get-DimLineSuppress
syn keyword lispFunc    vla-get-DimStyles                               vla-get-Direction                               vla-get-DirectionVector
syn keyword lispFunc    vla-get-Display                                 vla-get-DisplayGrips                            vla-get-DisplayGripsWithinBlocks
syn keyword lispFunc    vla-get-DisplayLayoutTabs                       vla-get-DisplayLocked                           vla-get-DisplayOLEScale
syn keyword lispFunc    vla-get-DisplayScreenMenu                       vla-get-DisplayScrollBars                       vla-get-DisplaySilhouette
syn keyword lispFunc    vla-get-DockedVisibleLines                      vla-get-DockStatus                              vla-get-Document
syn keyword lispFunc    vla-get-Documents                               vla-get-Drafting                                vla-get-DrawingDirection
syn keyword lispFunc    vla-get-DriversPath                             vla-get-Elevation                               vla-get-ElevationModelSpace
syn keyword lispFunc    vla-get-ElevationPaperSpace                     vla-get-Enable                                  vla-get-EnableStartupDialog
syn keyword lispFunc    vla-get-EndAngle                                vla-get-EndParameter                            vla-get-EndPoint
syn keyword lispFunc    vla-get-EndSubMenuLevel                         vla-get-EndTangent                              vla-get-ExtensionLineColor
syn keyword lispFunc    vla-get-ExtensionLineExtend                     vla-get-ExtensionLineOffset                     vla-get-ExtensionLineWeight
syn keyword lispFunc    vla-get-ExtLine1EndPoint                        vla-get-ExtLine1Point                           vla-get-ExtLine1StartPoint
syn keyword lispFunc    vla-get-ExtLine1Suppress                        vla-get-ExtLine2EndPoint                        vla-get-ExtLine2Point
syn keyword lispFunc    vla-get-ExtLine2StartPoint                      vla-get-ExtLine2Suppress                        vla-get-Fade
syn keyword lispFunc    vla-get-FieldLength                             vla-get-Files                                   vla-get-Fit
syn keyword lispFunc    vla-get-FitPoints                               vla-get-FitTolerance                            vla-get-FloatingRows
syn keyword lispFunc    vla-get-Flyout                                  vla-get-FontFile                                vla-get-FontFileMap
syn keyword lispFunc    vla-get-ForceLineInside                         vla-get-FractionFormat                          vla-get-Freeze
syn keyword lispFunc    vla-get-FullCRCValidation                       vla-get-FullName                                vla-get-FullScreenTrackingVector
syn keyword lispFunc    vla-get-GraphicsWinLayoutBackgrndColor          vla-get-GraphicsWinModelBackgrndColor           vla-get-GridOn
syn keyword lispFunc    vla-get-GripColorSelected                       vla-get-GripColorUnselected                     vla-get-GripSize
syn keyword lispFunc    vla-get-Groups                                  vla-get-Handle                                  vla-get-HasAttributes
syn keyword lispFunc    vla-get-HasExtensionDictionary                  vla-get-HatchStyle                              vla-get-Height
syn keyword lispFunc    vla-get-HelpFilePath                            vla-get-HelpString                              vla-get-HistoryLines
syn keyword lispFunc    vla-get-HorizontalTextPosition                  vla-get-HWND                                    vla-get-HyperlinkDisplayCursor
syn keyword lispFunc    vla-get-HyperlinkDisplayTooltip                 vla-get-Hyperlinks                              vla-get-ImageFile
syn keyword lispFunc    vla-get-ImageFrameHighlight                     vla-get-ImageHeight                             vla-get-ImageVisibility
syn keyword lispFunc    vla-get-ImageWidth                              vla-get-IncrementalSavePercent                  vla-get-index
syn keyword lispFunc    vla-get-InsertionPoint                          vla-get-Invisible                               vla-get-IsCloned
syn keyword lispFunc    vla-get-IsLayout                                vla-get-ISOPenWidth                             vla-get-IsOwnerXlated
syn keyword lispFunc    vla-get-IsPeriodic                              vla-get-IsPlanar                                vla-get-IsPrimary
syn keyword lispFunc    vla-get-IsQuiescent                             vla-get-IsRational                              vla-get-IsXRef
syn keyword lispFunc    vla-get-Key                                     vla-get-KeyboardAccelerator                     vla-get-KeyboardPriority
syn keyword lispFunc    vla-get-Knots                                   vla-get-Label                                   vla-get-LargeButtons
syn keyword lispFunc    vla-get-LastHeight                              vla-get-Layer                                   vla-get-LayerOn
syn keyword lispFunc    vla-get-Layers                                  vla-get-Layout                                  vla-get-LayoutCreateViewport
syn keyword lispFunc    vla-get-LayoutCrosshairColor                    vla-get-LayoutDisplayMargins                    vla-get-LayoutDisplayPaper
syn keyword lispFunc    vla-get-LayoutDisplayPaperShadow                vla-get-Layouts                                 vla-get-LayoutShowPlotSetup
syn keyword lispFunc    vla-get-Left                                    vla-get-Length                                  vla-get-LensLength
syn keyword lispFunc    vla-get-LicenseServer                           vla-get-Limits                                  vla-get-LinearScaleFactor
syn keyword lispFunc    vla-get-LineSpacingFactor                       vla-get-LineSpacingStyle                        vla-get-Linetype
syn keyword lispFunc    vla-get-LinetypeGeneration                      vla-get-Linetypes                               vla-get-LinetypeScale
syn keyword lispFunc    vla-get-LineWeight                              vla-get-LineWeightDisplay                       vla-get-LoadAcadLspInAllDocuments
syn keyword lispFunc    vla-get-LocaleId                                vla-get-Lock                                    vla-get-LogFileOn
syn keyword lispFunc    vla-get-LogFilePath                             vla-get-LowerLeftCorner                         vla-get-Macro
syn keyword lispFunc    vla-get-MainDictionary                          vla-get-MajorAxis                               vla-get-MajorRadius
syn keyword lispFunc    vla-get-MaxActiveViewports                      vla-get-MaxAutoCADWindow                        vla-get-MClose
syn keyword lispFunc    vla-get-MDensity                                vla-get-Measurement                             vla-get-MenuBar
syn keyword lispFunc    vla-get-MenuFile                                vla-get-MenuFileName                            vla-get-MenuGroups
syn keyword lispFunc    vla-get-Menus                                   vla-get-MinorAxis                               vla-get-MinorRadius
syn keyword lispFunc    vla-get-Mode                                    vla-get-ModelCrosshairColor                     vla-get-ModelSpace
syn keyword lispFunc    vla-get-ModelType                               vla-get-MomentOfInertia                         vla-get-MRUNumber
syn keyword lispFunc    vla-get-MSpace                                  vla-get-MVertexCount                            vla-get-Name
syn keyword lispFunc    vla-get-NameNoMnemonic                          vla-get-NClose                                  vla-get-NDensity
syn keyword lispFunc    vla-get-Normal                                  vla-get-NumberOfControlPoints                   vla-get-NumberOfCopies
syn keyword lispFunc    vla-get-NumberOfFaces                           vla-get-NumberOfFitPoints                       vla-get-NumberOfLoops
syn keyword lispFunc    vla-get-NumberOfVertices                        vla-get-NVertexCount                            vla-get-ObjectARXPath
syn keyword lispFunc    vla-get-ObjectID                                vla-get-ObjectName                              vla-get-ObjectSnapMode
syn keyword lispFunc    vla-get-ObjectSortByPlotting                    vla-get-ObjectSortByPSOutput                    vla-get-ObjectSortByRedraws
syn keyword lispFunc    vla-get-ObjectSortByRegens                      vla-get-ObjectSortBySelection                   vla-get-ObjectSortBySnap
syn keyword lispFunc    vla-get-ObliqueAngle                            vla-get-OLELaunch                               vla-get-OLEQuality
syn keyword lispFunc    vla-get-OnMenuBar                               vla-get-OpenSave                                vla-get-Origin
syn keyword lispFunc    vla-get-OrthoOn                                 vla-get-Output                                  vla-get-OwnerID
syn keyword lispFunc    vla-get-PaperSpace                              vla-get-PaperUnits                              vla-get-Parent
syn keyword lispFunc    vla-get-Path                                    vla-get-PatternAngle                            vla-get-PatternDouble
syn keyword lispFunc    vla-get-PatternName                             vla-get-PatternScale                            vla-get-PatternSpace
syn keyword lispFunc    vla-get-PatternType                             vla-get-Perimeter                               vla-get-PickAdd
syn keyword lispFunc    vla-get-PickAuto                                vla-get-PickBoxSize                             vla-get-PickDrag
syn keyword lispFunc    vla-get-PickFirst                               vla-get-PickfirstSelectionSet                   vla-get-PickGroup
syn keyword lispFunc    vla-get-Plot                                    vla-get-PlotConfigurations                      vla-get-PlotHidden
syn keyword lispFunc    vla-get-PlotLegacy                              vla-get-PlotOrigin                              vla-get-PlotPolicy
syn keyword lispFunc    vla-get-PlotRotation                            vla-get-PlotStyleName                           vla-get-Plottable
syn keyword lispFunc    vla-get-PlotType                                vla-get-PlotViewportBorders                     vla-get-PlotViewportsFirst
syn keyword lispFunc    vla-get-PlotWithLineweights                     vla-get-PlotWithPlotStyles                      vla-get-PolarTrackingVector
syn keyword lispFunc    vla-get-PostScriptPrologFile                    vla-get-Preferences                             vla-get-Preset
syn keyword lispFunc    vla-get-PrimaryUnitsPrecision                   vla-get-PrincipalDirections                     vla-get-PrincipalMoments
syn keyword lispFunc    vla-get-PrinterConfigPath                       vla-get-PrinterDescPath                         vla-get-PrinterPaperSizeAlert
syn keyword lispFunc    vla-get-PrinterSpoolAlert                       vla-get-PrinterStyleSheetPath                   vla-get-PrintFile
syn keyword lispFunc    vla-get-PrintSpoolerPath                        vla-get-PrintSpoolExecutable                    vla-get-ProductOfInertia
syn keyword lispFunc    vla-get-Profiles                                vla-get-PromptString                            vla-get-ProxyImage
syn keyword lispFunc    vla-get-QuietErrorMode                          vla-get-RadiiOfGyration                         vla-get-Radius
syn keyword lispFunc    vla-get-RadiusRatio                             vla-get-ReadOnly                                vla-get-RegisteredApplications
syn keyword lispFunc    vla-get-RemoveHiddenLines                       vla-get-RenderSmoothness                        vla-get-Rotation
syn keyword lispFunc    vla-get-RoundDistance                           vla-get-Rows                                    vla-get-RowSpacing
syn keyword lispFunc    vla-get-SaveAsType                              vla-get-Saved                                   vla-get-SavePreviewThumbnail
syn keyword lispFunc    vla-get-ScaleFactor                             vla-get-ScaleLineweights                        vla-get-SCMCommandMode
syn keyword lispFunc    vla-get-SCMDefaultMode                          vla-get-SCMEditMode                             vla-get-SecondPoint
syn keyword lispFunc    vla-get-SegmentPerPolyline                      vla-get-Selection                               vla-get-SelectionSets
syn keyword lispFunc    vla-get-ShortcutMenu                            vla-get-ShortCutMenuDisplay                     vla-get-ShowPlotStyles
syn keyword lispFunc    vla-get-ShowProxyDialogBox                      vla-get-ShowRasterImage                         vla-get-ShowRotation
syn keyword lispFunc    vla-get-ShowWarningMessages                     vla-get-SingleDocumentMode                      vla-get-SnapBasePoint
syn keyword lispFunc    vla-get-SnapOn                                  vla-get-SnapRotationAngle                       vla-get-SolidFill
syn keyword lispFunc    vla-get-StandardScale                           vla-get-StartAngle                              vla-get-StartParameter
syn keyword lispFunc    vla-get-StartPoint                              vla-get-StartTangent                            vla-get-StatusId
syn keyword lispFunc    vla-get-StoreSQLIndex                           vla-get-StyleName                               vla-get-StyleSheet
syn keyword lispFunc    vla-get-SubMenu                                 vla-get-SupportPath                             vla-get-SuppressLeadingZeros
syn keyword lispFunc    vla-get-SuppressTrailingZeros                   vla-get-SuppressZeroFeet                        vla-get-SuppressZeroInches
syn keyword lispFunc    vla-get-System                                  vla-get-TablesReadOnly                          vla-get-TabOrder
syn keyword lispFunc    vla-get-TagString                               vla-get-Target                                  vla-get-TempFileExtension
syn keyword lispFunc    vla-get-TempFilePath                            vla-get-TemplateDwgPath                         vla-get-TempXrefPath
syn keyword lispFunc    vla-get-TextAlignmentPoint                      vla-get-TextColor                               vla-get-TextEditor
syn keyword lispFunc    vla-get-TextFont                                vla-get-TextFontSize                            vla-get-TextFontStyle
syn keyword lispFunc    vla-get-TextFrameDisplay                        vla-get-TextGap                                 vla-get-TextGenerationFlag
syn keyword lispFunc    vla-get-TextHeight                              vla-get-TextInside                              vla-get-TextInsideAlign
syn keyword lispFunc    vla-get-TextMovement                            vla-get-TextOutsideAlign                        vla-get-TextOverride
syn keyword lispFunc    vla-get-TextPosition                            vla-get-TextPrecision                           vla-get-TextPrefix
syn keyword lispFunc    vla-get-TextRotation                            vla-get-TextString                              vla-get-TextStyle
syn keyword lispFunc    vla-get-TextStyles                              vla-get-TextSuffix                              vla-get-TextureMapPath
syn keyword lispFunc    vla-get-TextWinBackgrndColor                    vla-get-TextWinTextColor                        vla-get-Thickness
syn keyword lispFunc    vla-get-ToleranceDisplay                        vla-get-ToleranceHeightScale                    vla-get-ToleranceJustification
syn keyword lispFunc    vla-get-ToleranceLowerLimit                     vla-get-TolerancePrecision                      vla-get-ToleranceSuppressLeadingZeros
syn keyword lispFunc    vla-get-ToleranceSuppressTrailingZeros          vla-get-ToleranceSuppressZeroFeet               vla-get-ToleranceSuppressZeroInches
syn keyword lispFunc    vla-get-ToleranceUpperLimit                     vla-get-Toolbars                                vla-get-Top
syn keyword lispFunc    vla-get-TotalAngle                              vla-get-TranslateIDs                            vla-get-Transparency
syn keyword lispFunc    vla-get-TrueColorImages                         vla-get-TwistAngle                              vla-get-Type
syn keyword lispFunc    vla-get-UCSIconAtOrigin                         vla-get-UCSIconOn                               vla-get-UCSPerViewport
syn keyword lispFunc    vla-get-UnitsFormat                             vla-get-UpperRightCorner                        vla-get-UpsideDown
syn keyword lispFunc    vla-get-URL                                     vla-get-URLDescription                          vla-get-URLNamedLocation
syn keyword lispFunc    vla-get-UseLastPlotSettings                     vla-get-User                                    vla-get-UserCoordinateSystems
syn keyword lispFunc    vla-get-UseStandardScale                        vla-get-Utility                                 vla-get-Value
syn keyword lispFunc    vla-get-VBE                                     vla-get-Verify                                  vla-get-Version
syn keyword lispFunc    vla-get-VerticalTextPosition                    vla-get-ViewportDefault                         vla-get-ViewportOn
syn keyword lispFunc    vla-get-Viewports                               vla-get-Views                                   vla-get-ViewToPlot
syn keyword lispFunc    vla-get-VisibilityEdge1                         vla-get-VisibilityEdge2                         vla-get-VisibilityEdge3
syn keyword lispFunc    vla-get-VisibilityEdge4                         vla-get-Visible                                 vla-get-Volume
syn keyword lispFunc    vla-get-Weights                                 vla-get-Width                                   vla-get-WindowLeft
syn keyword lispFunc    vla-get-WindowState                             vla-get-WindowTitle                             vla-get-WindowTop
syn keyword lispFunc    vla-get-WorkspacePath                           vla-get-XRefDatabase                            vla-get-XrefDemandLoad
syn keyword lispFunc    vla-get-XRefEdit                                vla-get-XRefFadeIntensity                       vla-get-XRefLayerVisibility
syn keyword lispFunc    vla-get-XScaleFactor                            vla-get-XVector                                 vla-get-YScaleFactor
syn keyword lispFunc    vla-get-YVector                                 vla-get-ZScaleFactor                            vla-GetAcadState
syn keyword lispFunc    vla-GetAllProfileNames                          vla-GetAngle                                    vla-GetAttributes
syn keyword lispFunc    vla-GetBitmaps                                  vla-GetBoundingBox                              vla-GetBulge
syn keyword lispFunc    vla-GetCanonicalMediaNames                      vla-GetConstantAttributes                       vla-GetControlPoint
syn keyword lispFunc    vla-GetCorner                                   vla-GetCustomScale                              vla-GetDistance
syn keyword lispFunc    vla-GetEntity                                   vla-GetExtensionDictionary                      vla-GetFitPoint
syn keyword lispFunc    vla-GetFont                                     vla-GetGridSpacing                              vla-GetInput
syn keyword lispFunc    vla-GetInteger                                  vla-GetInterfaceObject                          vla-GetInvisibleEdge
syn keyword lispFunc    vla-GetKeyword                                  vla-GetLocaleMediaName                          vla-GetLoopAt
syn keyword lispFunc    vla-GetName                                     vla-GetObject                                   vla-GetOrientation
syn keyword lispFunc    vla-GetPaperMargins                             vla-GetPaperSize                                vla-GetPlotDeviceNames
syn keyword lispFunc    vla-GetPlotStyleTableNames                      vla-GetPoint                                    vla-GetProjectFilePath
syn keyword lispFunc    vla-GetReal                                     vla-GetRemoteFile                               vla-GetSnapSpacing
syn keyword lispFunc    vla-GetString                                   vla-GetSubEntity                                vla-GetUCSMatrix
syn keyword lispFunc    vla-GetVariable                                 vla-GetWeight                                   vla-GetWidth
syn keyword lispFunc    vla-GetWindowToPlot                             vla-GetXData                                    vla-GetXRecordData
syn keyword lispFunc    vla-HandleToObject                              vla-Highlight                                   vla-Import
syn keyword lispFunc    vla-ImportProfile                               vla-InitializeUserInput                         vla-InsertBlock
syn keyword lispFunc    vla-InsertInMenuBar                             vla-InsertLoopAt                                vla-InsertMenuInMenuBar
syn keyword lispFunc    vla-IntersectWith                               vla-IsRemoteFile                                vla-IsURL
syn keyword lispFunc    vla-Item                                        vla-LaunchBrowserDialog                         vla-ListArx
syn keyword lispFunc    vla-Load                                        vla-LoadArx                                     vla-LoadDVB
syn keyword lispFunc    vla-LoadShapeFile                               vla-Mirror                                      vla-Mirror3D
syn keyword lispFunc    vla-Modified                                    vla-Move                                        vla-New
syn keyword lispFunc    vla-OBJECT                                      vla-ObjectIDToObject                            vla-Offset
syn keyword lispFunc    vla-Open                                        vla-PlotToDevice                                vla-PlotToFile
syn keyword lispFunc    vla-PolarPoint                                  vla-Prompt                                      vla-PurgeAll
syn keyword lispFunc    vla-PurgeFitData                                vla-put-ActiveDimStyle                          vla-put-ActiveDocument
syn keyword lispFunc    vla-put-ActiveLayer                             vla-put-ActiveLayout                            vla-put-ActiveLinetype
syn keyword lispFunc    vla-put-ActiveProfile                           vla-put-ActivePViewport                         vla-put-ActiveSpace
syn keyword lispFunc    vla-put-ActiveTextStyle                         vla-put-ActiveUCS                               vla-put-ActiveViewport
syn keyword lispFunc    vla-put-ADCInsertUnitsDefaultSource             vla-put-ADCInsertUnitsDefaultTarget             vla-put-Alignment
syn keyword lispFunc    vla-put-AlignmentPointAcquisition               vla-put-AllowLongSymbolNames                    vla-put-AltFontFile
syn keyword lispFunc    vla-put-AltRoundDistance                        vla-put-AltSuppressLeadingZeros                 vla-put-AltSuppressTrailingZeros
syn keyword lispFunc    vla-put-AltSuppressZeroFeet                     vla-put-AltSuppressZeroInches                   vla-put-AltTabletMenuFile
syn keyword lispFunc    vla-put-AltTextPrefix                           vla-put-AltTextSuffix                           vla-put-AltTolerancePrecision
syn keyword lispFunc    vla-put-AltToleranceSuppressLeadingZeros        vla-put-AltToleranceSuppressTrailingZeros       vla-put-AltToleranceSuppressZeroFeet
syn keyword lispFunc    vla-put-AltToleranceSuppressZeroInches          vla-put-AltUnits                                vla-put-AltUnitsFormat
syn keyword lispFunc    vla-put-AltUnitsPrecision                       vla-put-AltUnitsScale                           vla-put-AngleFormat
syn keyword lispFunc    vla-put-AngleVertex                             vla-put-Annotation                              vla-put-ArcSmoothness
syn keyword lispFunc    vla-put-Area                                    vla-put-Arrowhead1Block                         vla-put-Arrowhead1Type
syn keyword lispFunc    vla-put-Arrowhead2Block                         vla-put-Arrowhead2Type                          vla-put-ArrowheadBlock
syn keyword lispFunc    vla-put-ArrowheadSize                           vla-put-ArrowheadType                           vla-put-AssociativeHatch
syn keyword lispFunc    vla-put-AttachmentPoint                         vla-put-AutoAudit                               vla-put-AutoSaveInterval
syn keyword lispFunc    vla-put-AutoSavePath                            vla-put-AutoSnapAperture                        vla-put-AutoSnapApertureSize
syn keyword lispFunc    vla-put-AutoSnapMagnet                          vla-put-AutoSnapMarker                          vla-put-AutoSnapMarkerColor
syn keyword lispFunc    vla-put-AutoSnapMarkerSize                      vla-put-AutoSnapToolTip                         vla-put-AutoTrackingVecColor
syn keyword lispFunc    vla-put-AutoTrackTooltip                        vla-put-Backward                                vla-put-BasePoint
syn keyword lispFunc    vla-put-BatchPlotProgress                       vla-put-BeepOnError                             vla-put-BigFontFile
syn keyword lispFunc    vla-put-Brightness                              vla-put-CanonicalMediaName                      vla-put-Center
syn keyword lispFunc    vla-put-CenterMarkSize                          vla-put-CenterPlot                              vla-put-CenterType
syn keyword lispFunc    vla-put-Check                                   vla-put-Circumference                           vla-put-ClippingEnabled
syn keyword lispFunc    vla-put-Closed                                  vla-put-Color                                   vla-put-Columns
syn keyword lispFunc    vla-put-ColumnSpacing                           vla-put-ConfigName                              vla-put-Constant
syn keyword lispFunc    vla-put-ConstantWidth                           vla-put-ContourLinesPerSurface                  vla-put-Contrast
syn keyword lispFunc    vla-put-ControlPoints                           vla-put-Coordinate                              vla-put-Coordinates
syn keyword lispFunc    vla-put-CreateBackup                            vla-put-CursorSize                              vla-put-CustomDictionary
syn keyword lispFunc    vla-put-CustomScale                             vla-put-DecimalSeparator                        vla-put-DefaultInternetURL
syn keyword lispFunc    vla-put-DefaultOutputDevice                     vla-put-DefaultPlotStyleForLayer                vla-put-DefaultPlotStyleForObjects
syn keyword lispFunc    vla-put-DefaultPlotStyleTable                   vla-put-DemandLoadARXApp                        vla-put-Description
syn keyword lispFunc    vla-put-Diameter                                vla-put-DimensionLineColor                      vla-put-DimensionLineExtend
syn keyword lispFunc    vla-put-DimensionLineWeight                     vla-put-DimLine1Suppress                        vla-put-DimLine2Suppress
syn keyword lispFunc    vla-put-DimLineInside                           vla-put-DimLineSuppress                         vla-put-Direction
syn keyword lispFunc    vla-put-DirectionVector                         vla-put-DisplayGrips                            vla-put-DisplayGripsWithinBlocks
syn keyword lispFunc    vla-put-DisplayLayoutTabs                       vla-put-DisplayLocked                           vla-put-DisplayOLEScale
syn keyword lispFunc    vla-put-DisplayScreenMenu                       vla-put-DisplayScrollBars                       vla-put-DisplaySilhouette
syn keyword lispFunc    vla-put-DockedVisibleLines                      vla-put-DrawingDirection                        vla-put-DriversPath
syn keyword lispFunc    vla-put-Elevation                               vla-put-ElevationModelSpace                     vla-put-ElevationPaperSpace
syn keyword lispFunc    vla-put-Enable                                  vla-put-EnableStartupDialog                     vla-put-EndAngle
syn keyword lispFunc    vla-put-EndParameter                            vla-put-EndPoint                                vla-put-EndSubMenuLevel
syn keyword lispFunc    vla-put-EndTangent                              vla-put-ExtensionLineColor                      vla-put-ExtensionLineExtend
syn keyword lispFunc    vla-put-ExtensionLineOffset                     vla-put-ExtensionLineWeight                     vla-put-ExtLine1EndPoint
syn keyword lispFunc    vla-put-ExtLine1Point                           vla-put-ExtLine1StartPoint                      vla-put-ExtLine1Suppress
syn keyword lispFunc    vla-put-ExtLine2EndPoint                        vla-put-ExtLine2Point                           vla-put-ExtLine2StartPoint
syn keyword lispFunc    vla-put-ExtLine2Suppress                        vla-put-Fade                                    vla-put-FieldLength
syn keyword lispFunc    vla-put-Fit                                     vla-put-FitPoints                               vla-put-FitTolerance
syn keyword lispFunc    vla-put-FloatingRows                            vla-put-FontFile                                vla-put-FontFileMap
syn keyword lispFunc    vla-put-ForceLineInside                         vla-put-FractionFormat                          vla-put-Freeze
syn keyword lispFunc    vla-put-FullCRCValidation                       vla-put-FullScreenTrackingVector                vla-put-GraphicsWinLayoutBackgrndColor
syn keyword lispFunc    vla-put-GraphicsWinModelBackgrndColor           vla-put-GridOn                                  vla-put-GripColorSelected
syn keyword lispFunc    vla-put-GripColorUnselected                     vla-put-GripSize                                vla-put-HatchStyle
syn keyword lispFunc    vla-put-Height                                  vla-put-HelpFilePath                            vla-put-HelpString
syn keyword lispFunc    vla-put-HistoryLines                            vla-put-HorizontalTextPosition                  vla-put-HyperlinkDisplayCursor
syn keyword lispFunc    vla-put-HyperlinkDisplayTooltip                 vla-put-ImageFile                               vla-put-ImageFrameHighlight
syn keyword lispFunc    vla-put-ImageHeight                             vla-put-ImageVisibility                         vla-put-ImageWidth
syn keyword lispFunc    vla-put-IncrementalSavePercent                  vla-put-InsertionPoint                          vla-put-Invisible
syn keyword lispFunc    vla-put-ISOPenWidth                             vla-put-KeyboardAccelerator                     vla-put-KeyboardPriority
syn keyword lispFunc    vla-put-Knots                                   vla-put-Label                                   vla-put-LargeButtons
syn keyword lispFunc    vla-put-LastHeight                              vla-put-Layer                                   vla-put-LayerOn
syn keyword lispFunc    vla-put-LayoutCreateViewport                    vla-put-LayoutCrosshairColor                    vla-put-LayoutDisplayMargins
syn keyword lispFunc    vla-put-LayoutDisplayPaper                      vla-put-LayoutDisplayPaperShadow                vla-put-LayoutShowPlotSetup
syn keyword lispFunc    vla-put-LeaderLength                            vla-put-Left                                    vla-put-LensLength
syn keyword lispFunc    vla-put-Limits                                  vla-put-LinearScaleFactor                       vla-put-LineSpacingFactor
syn keyword lispFunc    vla-put-LineSpacingStyle                        vla-put-Linetype                                vla-put-LinetypeGeneration
syn keyword lispFunc    vla-put-LinetypeScale                           vla-put-LineWeight                              vla-put-LineWeightDisplay
syn keyword lispFunc    vla-put-LoadAcadLspInAllDocuments               vla-put-Lock                                    vla-put-LogFileOn
syn keyword lispFunc    vla-put-LogFilePath                             vla-put-Macro                                   vla-put-MainDictionary
syn keyword lispFunc    vla-put-MajorAxis                               vla-put-MajorRadius                             vla-put-MaxActiveViewports
syn keyword lispFunc    vla-put-MaxAutoCADWindow                        vla-put-MClose                                  vla-put-MDensity
syn keyword lispFunc    vla-put-MenuFile                                vla-put-MinorRadius                             vla-put-Mode
syn keyword lispFunc    vla-put-ModelCrosshairColor                     vla-put-MSpace                                  vla-put-Name
syn keyword lispFunc    vla-put-NClose                                  vla-put-NDensity                                vla-put-Normal
syn keyword lispFunc    vla-put-NumberOfCopies                          vla-put-ObjectARXPath                           vla-put-ObjectSnapMode
syn keyword lispFunc    vla-put-ObjectSortByPlotting                    vla-put-ObjectSortByPSOutput                    vla-put-ObjectSortByRedraws
syn keyword lispFunc    vla-put-ObjectSortByRegens                      vla-put-ObjectSortBySelection                   vla-put-ObjectSortBySnap
syn keyword lispFunc    vla-put-ObliqueAngle                            vla-put-OLELaunch                               vla-put-OLEQuality
syn keyword lispFunc    vla-put-Origin                                  vla-put-OrthoOn                                 vla-put-PaperUnits
syn keyword lispFunc    vla-put-Path                                    vla-put-PatternAngle                            vla-put-PatternDouble
syn keyword lispFunc    vla-put-PatternScale                            vla-put-PatternSpace                            vla-put-PickAdd
syn keyword lispFunc    vla-put-PickAuto                                vla-put-PickBoxSize                             vla-put-PickDrag
syn keyword lispFunc    vla-put-PickFirst                               vla-put-PickGroup                               vla-put-PlotHidden
syn keyword lispFunc    vla-put-PlotLegacy                              vla-put-PlotOrigin                              vla-put-PlotPolicy
syn keyword lispFunc    vla-put-PlotRotation                            vla-put-PlotStyleName                           vla-put-Plottable
syn keyword lispFunc    vla-put-PlotType                                vla-put-PlotViewportBorders                     vla-put-PlotViewportsFirst
syn keyword lispFunc    vla-put-PlotWithLineweights                     vla-put-PlotWithPlotStyles                      vla-put-PolarTrackingVector
syn keyword lispFunc    vla-put-PostScriptPrologFile                    vla-put-Preset                                  vla-put-PrimaryUnitsPrecision
syn keyword lispFunc    vla-put-PrinterConfigPath                       vla-put-PrinterDescPath                         vla-put-PrinterPaperSizeAlert
syn keyword lispFunc    vla-put-PrinterSpoolAlert                       vla-put-PrinterStyleSheetPath                   vla-put-PrintFile
syn keyword lispFunc    vla-put-PrintSpoolerPath                        vla-put-PrintSpoolExecutable                    vla-put-PromptString
syn keyword lispFunc    vla-put-ProxyImage                              vla-put-QuietErrorMode                          vla-put-Radius
syn keyword lispFunc    vla-put-RadiusRatio                             vla-put-RemoveHiddenLines                       vla-put-RenderSmoothness
syn keyword lispFunc    vla-put-Rotation                                vla-put-RoundDistance                           vla-put-Rows
syn keyword lispFunc    vla-put-RowSpacing                              vla-put-SaveAsType                              vla-put-SavePreviewThumbnail
syn keyword lispFunc    vla-put-ScaleFactor                             vla-put-ScaleLineweights                        vla-put-SCMCommandMode
syn keyword lispFunc    vla-put-SCMDefaultMode                          vla-put-SCMEditMode                             vla-put-SecondPoint
syn keyword lispFunc    vla-put-SegmentPerPolyline                      vla-put-ShortCutMenuDisplay                     vla-put-ShowPlotStyles
syn keyword lispFunc    vla-put-ShowProxyDialogBox                      vla-put-ShowRasterImage                         vla-put-ShowRotation
syn keyword lispFunc    vla-put-ShowWarningMessages                     vla-put-SingleDocumentMode                      vla-put-SnapBasePoint
syn keyword lispFunc    vla-put-SnapOn                                  vla-put-SnapRotationAngle                       vla-put-SolidFill
syn keyword lispFunc    vla-put-StandardScale                           vla-put-StartAngle                              vla-put-StartParameter
syn keyword lispFunc    vla-put-StartPoint                              vla-put-StartTangent                            vla-put-StoreSQLIndex
syn keyword lispFunc    vla-put-StyleName                               vla-put-StyleSheet                              vla-put-SupportPath
syn keyword lispFunc    vla-put-SuppressLeadingZeros                    vla-put-SuppressTrailingZeros                   vla-put-SuppressZeroFeet
syn keyword lispFunc    vla-put-SuppressZeroInches                      vla-put-TablesReadOnly                          vla-put-TabOrder
syn keyword lispFunc    vla-put-TagString                               vla-put-Target                                  vla-put-TempFileExtension
syn keyword lispFunc    vla-put-TempFilePath                            vla-put-TemplateDwgPath                         vla-put-TempXrefPath
syn keyword lispFunc    vla-put-TextAlignmentPoint                      vla-put-TextColor                               vla-put-TextEditor
syn keyword lispFunc    vla-put-TextFont                                vla-put-TextFontSize                            vla-put-TextFontStyle
syn keyword lispFunc    vla-put-TextFrameDisplay                        vla-put-TextGap                                 vla-put-TextGenerationFlag
syn keyword lispFunc    vla-put-TextHeight                              vla-put-TextInside                              vla-put-TextInsideAlign
syn keyword lispFunc    vla-put-TextMovement                            vla-put-TextOutsideAlign                        vla-put-TextOverride
syn keyword lispFunc    vla-put-TextPosition                            vla-put-TextPrecision                           vla-put-TextPrefix
syn keyword lispFunc    vla-put-TextRotation                            vla-put-TextString                              vla-put-TextStyle
syn keyword lispFunc    vla-put-TextSuffix                              vla-put-TextureMapPath                          vla-put-TextWinBackgrndColor
syn keyword lispFunc    vla-put-TextWinTextColor                        vla-put-Thickness                               vla-put-ToleranceDisplay
syn keyword lispFunc    vla-put-ToleranceHeightScale                    vla-put-ToleranceJustification                  vla-put-ToleranceLowerLimit
syn keyword lispFunc    vla-put-TolerancePrecision                      vla-put-ToleranceSuppressLeadingZeros           vla-put-ToleranceSuppressTrailingZeros
syn keyword lispFunc    vla-put-ToleranceSuppressZeroFeet               vla-put-ToleranceSuppressZeroInches             vla-put-ToleranceUpperLimit
syn keyword lispFunc    vla-put-Top                                     vla-put-TranslateIDs                            vla-put-Transparency
syn keyword lispFunc    vla-put-TrueColorImages                         vla-put-TwistAngle                              vla-put-Type
syn keyword lispFunc    vla-put-UCSIconAtOrigin                         vla-put-UCSIconOn                               vla-put-UCSPerViewport
syn keyword lispFunc    vla-put-UnitsFormat                             vla-put-UpsideDown                              vla-put-URL
syn keyword lispFunc    vla-put-URLDescription                          vla-put-URLNamedLocation                        vla-put-UseLastPlotSettings
syn keyword lispFunc    vla-put-UseStandardScale                        vla-put-Verify                                  vla-put-VerticalTextPosition
syn keyword lispFunc    vla-put-ViewportDefault                         vla-put-ViewportOn                              vla-put-ViewToPlot
syn keyword lispFunc    vla-put-VisibilityEdge1                         vla-put-VisibilityEdge2                         vla-put-VisibilityEdge3
syn keyword lispFunc    vla-put-VisibilityEdge4                         vla-put-Visible                                 vla-put-Weights
syn keyword lispFunc    vla-put-Width                                   vla-put-WindowLeft                              vla-put-WindowState
syn keyword lispFunc    vla-put-WindowTop                               vla-put-WorkspacePath                           vla-put-XrefDemandLoad
syn keyword lispFunc    vla-put-XRefEdit                                vla-put-XRefFadeIntensity                       vla-put-XRefLayerVisibility
syn keyword lispFunc    vla-put-XScaleFactor                            vla-put-XVector                                 vla-put-YScaleFactor
syn keyword lispFunc    vla-put-YVector                                 vla-put-ZScaleFactor                            vla-PutRemoteFile
syn keyword lispFunc    vla-Quit                                        vla-RealToString                                vla-RefreshPlotDeviceInfo
syn keyword lispFunc    vla-Regen                                       vla-Reload                                      vla-Remove
syn keyword lispFunc    vla-RemoveFromMenuBar                           vla-RemoveItems                                 vla-RemoveMenuFromMenuBar
syn keyword lispFunc    vla-Rename                                      vla-RenameProfile                               vla-Replace
syn keyword lispFunc    vla-ResetProfile                                vla-Reverse                                     vla-Rotate
syn keyword lispFunc    vla-Rotate3D                                    vla-RunMacro                                    vla-Save
syn keyword lispFunc    vla-SaveAs                                      vla-ScaleEntity                                 vla-SectionSolid
syn keyword lispFunc    vla-Select                                      vla-SelectAtPoint                               vla-SelectByPolygon
syn keyword lispFunc    vla-SelectOnScreen                              vla-SendCommand                                 vla-SetBitmaps
syn keyword lispFunc    vla-SetBulge                                    vla-SetControlPoint                             vla-SetCustomScale
syn keyword lispFunc    vla-SetFitPoint                                 vla-SetFont                                     vla-SetGridSpacing
syn keyword lispFunc    vla-SetInvisibleEdge                            vla-SetLayoutsToPlot                            vla-SetPattern
syn keyword lispFunc    vla-SetProjectFilePath                          vla-SetSnapSpacing                              vla-SetVariable
syn keyword lispFunc    vla-SetView                                     vla-SetWeight                                   vla-SetWidth
syn keyword lispFunc    vla-SetWindowToPlot                             vla-SetXData                                    vla-SetXRecordData
syn keyword lispFunc    vla-SliceSolid                                  vla-Split                                       vla-StartBatchMode
syn keyword lispFunc    vla-StartUndoMark                               vla-TransformBy                                 vla-TranslateCoordinates
syn keyword lispFunc    vla-Unload                                      vla-UnloadArx                                   vla-UnloadDVB
syn keyword lispFunc    vla-Update                                      vla-Wblock                                      vla-ZoomAll
syn keyword lispFunc    vla-ZoomCenter                                  vla-ZoomExtents                                 vla-ZoomPickWindow
syn keyword lispFunc    vla-ZoomPrevious                                vla-ZoomScaled                                  vla-ZoomWindow
syn keyword lispFunc    vlarts-init                                     vlax-3d-point                                   vlax-add-cmd
syn keyword lispFunc    vlax-create-object                              vlax-curve-getArea                              vlax-curve-getClosestPointTo
syn keyword lispFunc    vlax-curve-getClosestPointToProjection          vlax-curve-getDistAtParam                       vlax-curve-getDistAtPoint
syn keyword lispFunc    vlax-curve-getEndParam                          vlax-curve-getEndPoint                          vlax-curve-getFirstDeriv
syn keyword lispFunc    vlax-curve-getParamAtDist                       vlax-curve-getParamAtPoint                      vlax-curve-getPointAtDist
syn keyword lispFunc    vlax-curve-getPointAtParam                      vlax-curve-getSecondDeriv                       vlax-curve-getStartParam
syn keyword lispFunc    vlax-curve-getStartPoint                        vlax-curve-isClosed                             vlax-curve-isPeriodic
syn keyword lispFunc    vlax-curve-isPlanar                             vlax-dump-Object                                vlax-ename->vla-object
syn keyword lispFunc    vlax-erased-p                                   vlax-for                                        vlax-get
syn keyword lispFunc    vlax-get-acad-object                            vlax-get-object                                 vlax-get-or-create-object
syn keyword lispFunc    vlax-get-property                               vlax-import-type-library                        vlax-invoke
syn keyword lispFunc    vlax-invoke-method                              vlax-ldata-delete                               vlax-ldata-get
syn keyword lispFunc    vlax-ldata-list                                 vlax-ldata-put                                  vlax-ldata-test
syn keyword lispFunc    vlax-make-safearray                             vlax-make-variant                               vlax-map-Collection
syn keyword lispFunc    vlax-method-applicable-p                        vlax-object-released-p                          vlax-product-key
syn keyword lispFunc    vlax-property-available-p                       vlax-put                                        vlax-put-property
syn keyword lispFunc    vlax-queueexpr                                  vlax-read-enabled-p                             vlax-reg-app
syn keyword lispFunc    vlax-release-object                             vlax-remove-cmd                                 vlax-safearray->list
syn keyword lispFunc    vlax-safearray-fill                             vlax-safearray-get-dim                          vlax-safearray-get-element
syn keyword lispFunc    vlax-safearray-get-l-bound                      vlax-safearray-get-u-bound                      vlax-safearray-put-element
syn keyword lispFunc    vlax-safearray-type                             vlax-tmatrix                                    vlax-typeinfo-available-p
syn keyword lispFunc    vlax-variant-change-type                        vlax-variant-type                               vlax-variant-value
syn keyword lispFunc    vlax-vla-object->ename                          vlax-write-enabled-p                            vlisp-compile
syn keyword lispFunc    vlisp-compile-list                              vlisp-dclres-list                               vlisp-dclres-load-dialog
syn keyword lispFunc    vlisp-drop-project                              vlisp-export-symbol                             vlisp-fasres-list
syn keyword lispFunc    vlisp-fasres-load                               vlisp-find-project                              vlisp-import-exsubrs
syn keyword lispFunc    vlisp-import-symbol                             vlisp-inires-list                               vlisp-list-loaded-projects
syn keyword lispFunc    vlisp-load-project                              vlisp-make-file-fas                             vlisp-make-project-fas
syn keyword lispFunc    vlisp-make-project-load-file                    vlisp-project-fas-list                          vlisp-project-list
syn keyword lispFunc    vlisp-read-file-xdv-list                        vlisp-read-project-xdv-list                     vlr-AcDb-Reactor
syn keyword lispFunc    vlr-Add                                         vlr-added-p                                     vlr-beep-reaction
syn keyword lispFunc    vlr-Command-Reactor                             vlr-current-reaction-name                       vlr-Data
syn keyword lispFunc    vlr-Data-Set                                    vlr-DeepClone-Reactor                           vlr-DocManager-Reactor
syn keyword lispFunc    vlr-document                                    vlr-DWG-Reactor                                 vlr-DXF-Reactor
syn keyword lispFunc    vlr-Editor-Reactor                              vlr-Insert-Reactor                              vlr-Linker-Reactor
syn keyword lispFunc    vlr-Lisp-Reactor                                vlr-Miscellaneous-Reactor                       vlr-Mouse-Reactor
syn keyword lispFunc    vlr-notification                                vlr-Object-Reactor                              vlr-Owner-Add
syn keyword lispFunc    vlr-Owner-Remove                                vlr-Owners                                      vlr-pers
syn keyword lispFunc    vlr-pers-activate                               vlr-pers-DictName                               vlr-pers-list
syn keyword lispFunc    vlr-pers-p                                      vlr-pers-release                                vlr-Reaction-Names
syn keyword lispFunc    vlr-Reaction-Set                                vlr-Reactions                                   vlr-Reactor.getDictKey
syn keyword lispFunc    vlr-reactors                                    vlr-Remove                                      vlr-remove-all
syn keyword lispFunc    vlr-set-notification                            vlr-SysVar-Reactor                              vlr-Toolbar-Reactor
syn keyword lispFunc    vlr-trace-reaction                              vlr-Type                                        vlr-types
syn keyword lispFunc    vlr-Undo-Reactor                                vlr-Wblock-Reactor                              vlr-Window-Reactor
syn keyword lispFunc    vlr-XREF-Reactor                 
":vlax-True                       :vlax-False   

"" lispSpecial

" ---------------------------------------------------------------------/*}}}*/
" Auto/Visual Lisp Special : /*{{{*/
" Special functions/values for the Autolisp language. 
syn case ignore

syn keyword lispSpecial  acAttachmentPointTopLeft       acAttachmentPointTopCenter      acAttachmentPointTopRight 
syn keyword lispSpecial  acAttachmentPointMiddleLeft    acAttachmentPointMiddleCenter   acAttachmentPointMiddleRight 
syn keyword lispSpecial  acAttachmentPointBottomLeft    acAttachmentPointBottomCenter   acAttachmentPointBottomRight 
syn keyword lispSpecial  acAlignmentLeft                acAlignmentMiddle               acAlignmentTop 
syn keyword lispSpecial  :vlax-True                     :vlax-False
syn keyword lispSpecial  vlax-vbInteger                 vlax-vbLong                     vlax-vbSingle 
syn keyword lispSpecial  vlax-vbDouble                  vlax-vbString                   vlax-vbObject 
syn keyword lispSpecial  vlax-vbBoolean                 vlax-vbVariant
syn keyword lispSpecial  *error*                        t                               nil

" ---------------------------------------------------------------------/*}}}*/
" Numbers: /*{{{*
" supporting integers and floating point numbers 
syn match lispNumber             "-\=\(\.\d\+\|\d\+\(\.\d*\)\=\)\(e[-+]\=\d\+\)\="

syn match lispSpecial            "\*[a-zA-Z_][a-zA-Z_0-9-]*\*"
syn match lispSpecial            !#|[^()'`,"; \t]\+|#!
syn match lispSpecial            !#x[0-9a-fA-F]\+!
syn match lispSpecial            !#o[0-7]\+!
syn match lispSpecial            !#b[01]\+!
syn match lispSpecial            !#\\[ -\~]!
syn match lispSpecial            !#[':][^()'`,"; \t]\+!
syn match lispSpecial            !#([^()'`,"; \t]\+)!

syn match lispConcat             "\s\.\s"
syn match lispParenError         ")"

" ---------------------------------------------------------------------/*}}}*/
" Comments: /*{{{*/
syn cluster lispCommentGroup     contains=lispTodo,@Spell
syn match   lispComment          ";.*$"                           contains=@lispCommentGroup
syn region  lispCommentRegion    start=";|" end="|;"              contains=lispCommentRegion,@lispCommentGroup
syn case ignore
syn keyword lispTodo contained combak combak: todo: usage: example: Ex: By: Notes: ver: version: *:
syn case match

" ---------------------------------------------------------------------/*}}}*/
" Synchronization: /*{{{*/
syn sync lines=100

" ---------------------------------------------------------------------/*}}}*/
" Define Highlighting: /*{{{*/
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508
  command -nargs=+ HiLink hi def link <args>

  HiLink lispCommentRegion       lispComment
  " refer to comment regen
  HiLink lispAtomNmbr            lispNumber
  " refer to number
  HiLink lispAtomMark            Type 
  " refer to mark
  HiLink lispAtom                Identifier
"  HiLink lispAtomBarSymbol       Special
  HiLink lispBarSymbol           Special
  HiLink lispInStringString      lispString

  HiLink lispQuoteSymbol         Special
  HiLink lispComment             Comment
  HiLink lispConcat              Statement
  HiLink lispDecl                Statement
  HiLink lispFunc                Statement
  HiLink lispKey                 Type
  HiLink lispMark                Delimiter
  HiLink lispNumber              Number
  HiLink lispParenError          Error
  HiLink lispSpecial             Special "Type
  HiLink lispString              String
  HiLink lispTodo                Todo
  HiLink lispVar                 Statement

  if exists("g:lisp_rainbow") && g:lisp_rainbow != 0
   if &bg == "dark"
    hi def hlLevel0 ctermfg=red         guifg=red1
    hi def hlLevel1 ctermfg=yellow      guifg=orange1      
    hi def hlLevel2 ctermfg=green       guifg=yellow1      
    hi def hlLevel3 ctermfg=cyan        guifg=greenyellow  
    hi def hlLevel4 ctermfg=magenta     guifg=green1       
    hi def hlLevel5 ctermfg=red         guifg=springgreen1 
    hi def hlLevel6 ctermfg=yellow      guifg=cyan1        
    hi def hlLevel7 ctermfg=green       guifg=slateblue1   
    hi def hlLevel8 ctermfg=cyan        guifg=magenta1     
    hi def hlLevel9 ctermfg=magenta     guifg=purple1
   else
    hi def hlLevel0 ctermfg=red         guifg=red3
    hi def hlLevel1 ctermfg=darkyellow  guifg=orangered3
    hi def hlLevel2 ctermfg=darkgreen   guifg=orange2
    hi def hlLevel3 ctermfg=blue        guifg=yellow3
    hi def hlLevel4 ctermfg=darkmagenta guifg=olivedrab4
    hi def hlLevel5 ctermfg=red         guifg=green4
    hi def hlLevel6 ctermfg=darkyellow  guifg=paleturquoise3
    hi def hlLevel7 ctermfg=darkgreen   guifg=deepskyblue4
    hi def hlLevel8 ctermfg=blue        guifg=darkslateblue
    hi def hlLevel9 ctermfg=darkmagenta guifg=darkviolet
   endif
  endif

  delcommand HiLink
endif

let b:current_syntax = "lisp"

" ---------------------------------------------------------------------/*}}}*/
" vim: ts=8 nowrap fdm=marker 
