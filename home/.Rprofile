defaults <- c("utils", "grDevices", "graphics", "stats", "methods")
if(Sys.getenv("NVIMR_TMPDIR") == ""){
   options(defaultPackages = defaults)
} else {
   options(defaultPackages = c(defaults, "nvimcom"))
}
