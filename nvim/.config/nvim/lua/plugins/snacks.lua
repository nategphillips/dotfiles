return {
    "folke/snacks.nvim",
    priority = 1000,
    -- snacks are smart and don't need lazy loading
    lazy = false,
    ---@type snacks.Config
    opts = {
        dashboard = {
            enabled = true,
            preset = {
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                header = table.concat(
                    (function()
                        local h = require("ascii").get_random("text", "neovim")
                        return type(h[1]) == "string" and h or h[1]
                    end)(),
                    "\n"
                )
            },
        },
        explorer = { enabled = true },
        indent = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = true },
        picker = { enabled = true },
        rename = { enabled = true },
        terminal = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        -- explorer
        { "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },
        -- lazygit
        { "<leader>lg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
        -- rename
        { "<leader>cR",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
        -- terminal
        { "<c-/>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
        -- tmux and windows terminal compatible mode, since <c-/> gets interpreted as <c-_>
        { "<c-_>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
        -- words
        { "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",        mode = { "n", "t" } },
        { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",        mode = { "n", "t" } },
        -- picker
        -- undo history
        { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
        -- find
        { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
        { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
        { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
        { "<leader>fg",      function() Snacks.picker.grep() end,                                    desc = "Grep Files" },
        { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
        { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
        -- git
        { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
        { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
        { "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
        { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
        { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
        { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
        { "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
        -- LSP
        { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
        { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
        { "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                  desc = "References" },
        { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
        { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
        { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
        { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
        { "<leader>gf",      function() Snacks.picker.lsp_format() end,                              desc = "format" },
    }
}
