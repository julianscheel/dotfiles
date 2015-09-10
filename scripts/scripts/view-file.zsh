#!/usr/bin/zsh

REMOVE_FILE_PREFIX="s#^.*: ##"

if [[ ! -a $1 ]]; then
    echo "Could not find \"$1\""
    exit 0
fi

MIME_TYPE=`file --mime-type $1 | sed $REMOVE_FILE_PREFIX`

if [[ "$MIME_TYPE" =~ "(text)|(xml)" ]]; then
    PYGMENTIZE_LEXER=`pygmentize -N $1`
    if [[ "$PYGMENTIZE_LEXER" != "text" ]]; then
        exec pygmentize -l $PYGMENTIZE_LEXER -O style=monokai -f console $1
    else
        cat $1
    fi
else
    file $1 | sed $REMOVE_FILE_PREFIX
fi
