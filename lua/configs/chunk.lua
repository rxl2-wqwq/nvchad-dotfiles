require("hlchunk").setup {
  chunk = {
    enable = true,
    delay = 50,
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "╭",
      left_bottom = "╰",
      right_arrow = ">",
    },
    style = "#806d9c",
    line_num = {
      enable = true,
      style = "#806d9c",
    },
  },
}
