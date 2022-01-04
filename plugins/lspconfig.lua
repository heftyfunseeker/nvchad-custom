local M = {}
USER = vim.fn.expand("$USER")

local sumneko_lua_path = "/Users/" .. USER .. "/.local/share/nvim/lsp_servers/sumneko_lua"
local sumneko_lua_binary = sumneko_lua_path .. "/extension/server/bin/macOS/lua-language-server"

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   lspconfig.rust_analyzer.setup {
      on_attach = attach,
      capabilities = capabilities,
   }

   lspconfig.sumneko_lua.setup {
      on_attach = attach,
      capabilities = capabilities,
      cmd = { sumneko_lua_binary, "-E" , sumneko_lua_path .. "/extension/server/main.lua" },
      settings = {
         Lua = {
            runtime = {
                -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim", "describe", "it", "mock", "expose"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                   [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                   ["/opt/homebrew/Cellar/luarocks/3.8.0/share/lua/5.4/busted"] = true,
                }
            }
         }
      }
   }
end

return M
