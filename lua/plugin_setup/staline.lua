-- Configuration reference: https://github.com/tamton-aquib/staline.nvim/wiki/Examples
require('staline').setup {
    mode_icons = {
        n = 'NRM',
        i = 'INS',
        c = 'CMD',
        v = 'VIS'
    },
    sections = {
        left = {'mode'},
        mid = {'lsp'},
        right = {'line_column', '- ' .. vim.fn.expand('%:t') .. ' '}
    },
    defaults = {
        bg = "#252526",
        line_column = " %l:%c",
        branch_symbol = ":"
    }
}
