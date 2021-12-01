require('staline').setup {
    mode_icons = {
        n = 'NRM',
        i = 'INS',
        c = 'CMD',
        v = 'VIS'
    },
    sections = {
        left = {'mode', '|', ' ', 'branch'},
        mid = {'lsp'},
        right = {'line_column', '- '..vim.fn.expand('%')..' ' , vim.bo.fileencoding}
    },
    defaults = {
        bg = "#252526",
        line_column = " %l:%c",
        branch_symbol = ":"
    }
}
