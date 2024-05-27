local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
    sources = {
        -- C/C++
        null_ls.builtins.formatting.clang_format,
        -- JavaScript/TypeScript
        null_ls.builtins.formatting.prettierd,
        -- PHP
        -- null_ls.builtins.diagnostics.phpcs,
        null_ls.builtins.formatting.pint,
        -- Go
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.golines,
    },
    on_attach = function(client, bufnr)
        local file_name = vim.fn.expand('%:t') -- Get the file name of the current buffer
        if client.supports_method("textDocument/formatting") and not string.find(file_name, "%.blade%.php$") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
}

return opts
