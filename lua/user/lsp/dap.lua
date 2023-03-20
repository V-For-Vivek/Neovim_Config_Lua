local status_ok_dapui, dapui = pcall(require, "dapui")
local status_ok_dap, dap = pcall(require, "dap")
local status_ok_dapvt, dapvt = pcall(require, "nvim-dap-virtual-text")
if not status_ok_dap then
    return
end
if not status_ok_dapui then
    return
end
if not status_ok_dapvt then
    return
end

require('mason-nvim-dap').setup {
    automatic_setup = true,
}

require('mason-nvim-dap').setup_handlers()
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F1>', dap.step_into)
vim.keymap.set('n', '<F2>', dap.step_over)
vim.keymap.set('n', '<F3>', dap.step_out)
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end)

dapui.setup {
    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    controls = {
        icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
        },
    },
}

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close
