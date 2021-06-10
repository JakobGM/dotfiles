set textwidth=80
set colorcolumn=80
set shiftwidth=4
set makeprg="snowsql --abort-detached-query -o header=true -o timing=false -o friendly=false -o output_format=csv --filename='

" Altways highlight Jinja2 syntax in SQL files on write
autocmd! BufEnter *.sql set filetype=sql.jinja
