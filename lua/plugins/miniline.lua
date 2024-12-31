return {
{ 
  'echasnovski/mini.nvim',
  config = function()
    local statusline = require 'mini.statusline'
    local function get_word_count()
      return vim.fn.wordcount().words
    end

    -- Function to get character count
    local function get_char_count()
      -- This calculates the total bytes of the file, which for ASCII text is equivalent to character count
      return vim.fn.line2byte(vim.fn.line('$') + 1) - 1
    end
    statusline.setup { 
      use_icons = true,
      -- content = {
      --   active = function()
      --     -- Here we combine existing sections with new ones for word and character count
      --     local mode, mode_hl = statusline.section_mode()
      --     local git = statusline.section_git()
      --     local diagnostics = statusline.section_diagnostics()
      --     local filename = statusline.section_filename()
      --     local fileinfo = statusline.section_fileinfo()
      --     local location = statusline.section_location()
      --
      --     -- Combine sections with new ones for word and character count
      --     return statusline.combine_groups({
      --       { { mode, hl = mode_hl } },
      --       { git, diagnostics },
      --       { filename },
      --       { fileinfo, string.format("Words: %d Chars: %d", get_word_count(), get_char_count()) },
      --       { location }
      --     })
      --   end
      -- }
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode({trunc_width = 12})

          return MiniStatusline.combine_groups({
            {hl = mode_hl, strings = { mode}},
          })
        end
      }
    }
  end
},
}
