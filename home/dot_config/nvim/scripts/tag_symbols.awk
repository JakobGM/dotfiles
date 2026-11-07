# Render a universal-ctags tags file as fzf entries for the global symbol picker
# (lua/tag_symbols.lua). Keeps classes, functions and methods; drops imports and
# the !_TAG_ header lines.
#
# Input line: name<TAB>file<TAB>excmd;"<TAB>kind<TAB>field:value...
# Output line: <icon> <scope.>name<pad><SEP>file:line:
# Everything before SEP is what fzf matches on; the trailing file:line: is parsed
# by fzf-lua's path.entry_to_file for jumping and previewing.
#
# Variables (-v): SEP, DIM, RESET, and per kind (c, f, m) ICON_x and HL_x.

BEGIN {
  FS = "\t"
  icon["c"] = ICON_c; hl["c"] = HL_c
  icon["f"] = ICON_f; hl["f"] = HL_f
  icon["m"] = ICON_m; hl["m"] = HL_m
  WIDTH = 56
}

{
  # The excmd pattern may contain tabs, so locate the extension fields by the
  # ;"<TAB> terminator instead of by field number.
  ext = index($0, ";\"\t")
  if (ext == 0) next
  n = split(substr($0, ext + 3), field, "\t")
  kind = field[1]
  if (!(kind in icon)) next

  line = ""
  scope = ""
  for (i = 2; i <= n; i++) {
    if (substr(field[i], 1, 5) == "line:") line = substr(field[i], 6)
    else if (field[i] ~ /^(class|function|member):/) scope = substr(field[i], index(field[i], ":") + 1)
  }
  # Tags written before --fields=+n was added carry no line number; the first
  # full regeneration by gutentags adds it.
  if (line == "") line = 1

  plain = $1
  label = hl[kind] $1 RESET
  if (scope != "") {
    plain = scope "." plain
    label = DIM scope "." RESET label
  }
  pad = WIDTH - length(plain)
  if (pad < 2) pad = 2
  printf "%s %s%*s%s%s%s:%s:%s\n", hl[kind] icon[kind] RESET, label, pad, "", SEP, DIM, $2, line, RESET
}
