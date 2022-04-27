local gl = require("galaxyline")

local onedarkdeep = {
		black = "#0c0e15",
		bg0 = "#1a212e",
		bg1 = "#21283b",
		bg2 = "#283347",
		bg3 = "#2a324a",
		bg_d = "#141b24",
		bg_blue = "#54b0fd",
		bg_yellow = "#f2cc81",
		fg = "#93a4c3",
		purple = "#c75ae8",
		green = "#8bcd5b",
		orange = "#dd9046",
		blue = "#41a7fc",
		yellow = "#efbd5d",
		cyan = "#34bfd0",
		red = "#f65866",
		grey = "#455574",
		light_grey = "#6c7d9c",
		dark_cyan = "#1b6a73",
		dark_red = "#992525",
		dark_yellow = "#8f610d",
		dark_purple = "#862aa1",
		diff_add = "#27341c",
		diff_delete = "#331c1e",
		diff_change = "#102b40",
		diff_text = "#1c4a6e",
}
local colors = {
  bg = onedarkdeep.bg0,
  bg_inactive = onedarkdeep.bg3,
  fg = onedarkdeep.fg,
  fg_focus= '#f8f8f2',
  section_bg = onedarkdeep.bg0,
  yellow = onedarkdeep.yellow,
  cyan = onedarkdeep.cyan,
  green = onedarkdeep.green,
  orange = onedarkdeep.orange,
  magenta = onedarkdeep.purple,
  blue = onedarkdeep.blue,
  red = onedarkdeep.red,
  black = onedarkdeep.black,
}
local condition = require("galaxyline.condition")
local gls = gl.section
gl.short_line_list = { "NvimTree", "vista", "dbui", "packer" }

gls.left[1] = {
  RainbowRed = {
    provider = function()
      return ""
    end,
    highlight = { colors.blue, colors.bg },
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.blue,
        i = colors.green,
        v = colors.yellow,
        [""] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.red,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.red,
        t = colors.red,
      }
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v = 'VISUAL',
        R = 'REPLACE',
      }
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
      return ' ' .. alias[vim.fn.mode()] .. ' '
    end,
    highlight = { colors.bg, colors.section_bg, "bold" },
  },
}
gls.left[3] = {
  FileSize = {
    provider = "FileSize",
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg },
  },
}
gls.left[4] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = { require("galaxyline.providers.fileinfo").get_file_icon_color, colors.bg },
  },
}

gls.left[5] = {
  FileName = {
    provider = "FileName",
    condition = condition.buffer_not_empty,
    highlight = { colors.magenta, colors.bg, "bold" },
  },
}

gls.left[6] = {
  LineInfo = {
    provider = "LineColumn",
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.fg, colors.bg },
  },
}

--gls.left[7] = {
--  PerCent = {
--    provider = "LinePercent",
--    separator = " ",
--    separator_highlight = { "NONE", colors.bg },
--    highlight = { colors.fg, colors.bg, "bold" },
--  },
--}

gls.left[8] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = { colors.red, colors.bg },
  },
}
gls.left[9] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = { colors.yellow, colors.bg },
  },
}

gls.left[10] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = "  ",
    highlight = { colors.cyan, colors.bg },
  },
}

gls.left[11] = {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = "  ",
    highlight = { colors.blue, colors.bg },
  },
}

--gls.mid[1] = {
--  ShowLspClient = {
--    provider = "GetLspClient",
--    condition = function()
--      local tbl = { ["dashboard"] = true, [""] = true }
--      if tbl[vim.bo.filetype] then
--        return false
--      end
--      return true
--    end,
--    icon = " LSP:",
--    highlight = { colors.cyan, colors.bg, "bold" },
--  },
--}

gls.right[1] = {
  FileEncode = {
    provider = "FileEncode",
    condition = condition.hide_in_width,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.green, colors.bg, "bold" },
  },
}

gls.right[2] = {
  FileFormat = {
    provider = "FileFormat",
    condition = condition.hide_in_width,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.green, colors.bg, "bold" },
  },
}

gls.right[3] = {
  GitIcon = {
    provider = function()
      return "  "
    end,
    condition = condition.check_git_workspace,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.violet, colors.bg, "bold" },
  },
}

gls.right[4] = {
  GitBranch = {
    provider = "GitBranch",
    condition = condition.check_git_workspace,
    highlight = { colors.violet, colors.bg, "bold" },
  },
}

gls.right[5] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.green, colors.bg },
  },
}
gls.right[6] = {
  DiffModified = {
    provider = "DiffModified",
    condition = condition.hide_in_width,
    icon = " 柳",
    highlight = { colors.orange, colors.bg },
  },
}
gls.right[7] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.red, colors.bg },
  },
}

gls.right[8] = {
  RainbowBlue = {
    provider = function()
      return ""
    end,
    highlight = { colors.blue, colors.bg },
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = "FileTypeName",
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.blue, colors.bg, "bold" },
  },
}

gls.short_line_left[2] = {
  SFileName = {
    provider = "SFileName",
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, "bold" },
  },
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    highlight = { colors.fg, colors.bg },
  },
}
