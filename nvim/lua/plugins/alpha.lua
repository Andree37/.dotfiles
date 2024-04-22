return {
  "goolord/alpha-nvim",
  cmd = "Alpha",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = {
      " .d888888                 dP",
      "d8'    88                 88",
      "88aaaaa88a 88d888b. .d888b88 88d888b. .d8888b.",
      "88     88  88'  `88 88'  `88 88'  `88 88ooood8",
      "88     88  88    88 88.  .88 88       88.  ...",
      "88     88  dP    dP `88888P8 dP       `88888P'",
    }
    dashboard.section.header.opts.hl = "DashboardHeader"

    local button = require("astronvim.utils").alpha_button
    dashboard.section.buttons.val = {
      button("LDR n  ", "  New File  "),
      button("LDR f f", "  Find File  "),
      button("LDR f o", "󰈙  Recents  "),
      button("LDR f w", "󰈭  Find Word  "),
      button("LDR f '", "  Bookmarks  "),
      button("LDR S l", "  Last Session  "),
    }

    dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
    dashboard.config.layout[3].val = 5
    dashboard.config.opts.noautocmd = true
    return dashboard
  end,
  config = require "plugins.configs.alpha",
}
