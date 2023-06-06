-- Create screenshot of code with :CarbonNowSh
return {
    "kristijanhusak/vim-carbon-now-sh",
    cmd = "CarbonNowSh",
    config = function()
        vim.g.carbon_now_sh_options = {
            ln = "false",
            fm = "Fira Code",
            t = "monokai",
            bg = "none",
            wt = "none",
            wc = "true",
            fs = "18px",
            ds = "true",
            dsyoff = "3px",
            dsblur = "5px",
            wa = "true",
            pv = "15px",
            ph = "15px",
            si = "false",
            wm = "false",
            es = "2x",
            type = "png"
        }
    end
}
