local prefix = "<leader>o"

-- filepath: lua/plugins/obsidian.lua
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  keys = {
    { prefix .. "o", "<cmd>Obsidian open<CR>", desc = "Open on App" },
    { prefix .. "g", "<cmd>Obsidian search<CR>", desc = "Grep" },
    { prefix .. "n", "<cmd>Obsidian new<CR>", desc = "New Note" },
    { prefix .. "N", "<cmd>Obsidian new_from_template<CR>", desc = "New Note (Template)" },
    { prefix .. "<space>", "<cmd>Obsidian quick_switch<CR>", desc = "Find Files" },
    { prefix .. "b", "<cmd>Obsidian backlinks<CR>", desc = "Backlinks" },
    { prefix .. "t", "<cmd>Obsidian tags<CR>", desc = "Tags" },
    { prefix .. "T", "<cmd>Obsidian template<CR>", desc = "Template" },
    { prefix .. "L", "<cmd>Obsidian link<CR>", mode = "v", desc = "Link" },
    { prefix .. "l", "<cmd>Obsidian links<CR>", desc = "Links" },
    { prefix .. "k", "<cmd>Obsidian link_new<CR>", mode = "v", desc = "New Link" },
    { prefix .. "e", "<cmd>Obsidian extract_note<CR>", mode = "v", desc = "Extract Note" },
    { prefix .. "w", "<cmd>Obsidian workspace<CR>", desc = "Workspace" },
    { prefix .. "r", "<cmd>Obsidian rename<CR>", desc = "Rename" },
    { prefix .. "i", "<cmd>Obsidian paste_img<CR>", desc = "Paste Image" },
    { prefix .. "d", "<cmd>Obsidian today<CR>", desc = "Daily Note" },
  },
  opts = {
    -- Disable legacy commands (ObsidianX) in favour of new format (Obsidian x)
    legacy_commands = false,
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/personal",
      },
      {
        name = "qued",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/qued",
      },
      {
        name = "vv",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/vv",
      },
    },
    log_level = vim.log.levels.INFO,
    completion = {
      -- Disables completion using nvim_cmp
      nvim_cmp = false,
      -- Enables completion using blink.cmp
      blink = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
      -- Set to false to disable new note creation in the picker
      create_new = true,
    },

    -- New notes go into the notes subdirectory
    notes_subdir = "notes",
    new_notes_location = "notes_subdir",

    -- Daily notes configuration
    daily_notes = {
      folder = "2. areas/daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily" },
      workdays_only = false,
    },

    -- Prepend date to new note filenames
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      local date = os.date("%Y-%m-%d")
      if title ~= nil and title ~= "" then
        local suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        return date .. "-" .. suffix
      end
      -- Random suffix if no title provided
      local suffix = ""
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
      return date .. "-" .. suffix
    end,
    -- Either 'wiki' or 'markdown'.
    preferred_link_style = "wiki",
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "snacks.pick",
    },
  },
}
