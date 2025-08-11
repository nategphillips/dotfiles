return {
    -- iron.nvim allows for interactions with a popup REPL
    "Vigemus/iron.nvim",
    -- load after reading a buffer into memory
    event = "BufRead",
    config = function()
        local iron = require("iron.core")
        local view = require("iron.view")

        -- trying to emulate how the Julia extension for VSCode works - sending an entire file calls
        -- include() instead of pasting the contents of the file into the REPL
        local function send_current_file()
            local file = vim.fn.expand("%:t")
            iron.send(nil, { string.format('include("%s")\n', file) })
        end

        iron.setup {
            config = {
                repl_definition = {
                    julia = {
                        -- start the REPL from inside the src/ directory and mark the base directory
                        -- as the project source
                        command = { "bash", "-c", "cd src && julia --project=.. --banner=no" },
                        block_dividers = { "#%%" },
                    },
                },
                repl_open_cmd = view.split.vertical.rightbelow("%40"),
            },
            keymaps = {
                toggle_repl = "<space>rr",
                restart_repl = "<space>rR",
                -- send file is redefined below
                -- send_file = "<space>sf",
                send_line = "<space>sl",
                send_paragraph = "<space>sp",
                send_until_cursor = "<space>su",
                send_mark = "<space>sm",
                send_code_block = "<space>sb",
                send_code_block_and_move = "<space>sn",
                exit = "<space>sq",
                clear = "<space>cl",
            },
            highlight = { italic = true },
            ignore_blank_lines = true,
        }
        vim.keymap.set("n", "<space>sf", send_current_file, { desc = "Send file to Julia REPL" })
    end
}
