require('gitsigns').setup {
  signs = {
    add = { hl = 'GitSignsAdd', text = '▊ ' },
    change = { hl = 'GitSignsChange', text = '▊ ' },
    delete = { hl = 'GitSignsDelete', text = '▊ ' },
  },
  numhl = false,
  linehl = false,
  keymaps = {
    noremap = false,
    buffer = false,
  },
  watch_index = {
    interval = 1000
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  use_decoration_api = true,
  use_internal_diff = true
}
