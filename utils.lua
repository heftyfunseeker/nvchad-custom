M = {}

M.findNvimFile = function()
   require("telescope.builtin").find_files {
      cwd = "~/.config/nvim/",
      layout_config = {
         prompt_position = "top",
      },
   }
end

M.openExercism = function()
   require("telescope.builtin").file_browser {
      cwd = "~/dev/exercism/",
      layout_config = {
         prompt_position = "top",
      },
   }
end

return M
