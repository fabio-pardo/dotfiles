local prefix = "<leader>o"
local vault_path = vim.fn.expand("~/Library/Mobile Documents/iCloud~md~obsidian/Documents/my_vault")

-- Create daily notes in main vault + work subdirs (qued, vv)
local function create_linked_dailies()
  local Path = require("obsidian.path")
  local Note = require("obsidian.note")

  local date = os.date("%Y-%m-%d")
  local month = os.date("%Y-%m")
  local alias = os.date("%B %-d, %Y")
  local vault = Path.new(vault_path)

  -- Define the three daily notes to create
  local daily = {
    {
      id = date,
      dir = "1. projects/qued/daily/" .. month,
      aliases = { alias },
      tags = { "daily", "qued" },
    },
    {
      id = date,
      dir = "1. projects/vv/daily/" .. month,
      aliases = { alias },
      tags = { "daily", "vv" },
    },
    {
      id = date,
      dir = "2. areas/daily/" .. month,
      aliases = { alias },
      tags = { "daily" },
    },
  }

  local main_note
  for _, daily in ipairs(daily) do
    local full_dir = vault / daily.dir
    vim.fn.mkdir(tostring(full_dir), "p")

    local path = full_dir / (daily.id .. ".md")
    if not path:exists() then
      local note = Note.new(daily.id, daily.aliases, daily.tags, path)
      note:save({ insert_frontmatter = true })

      -- Add work links to main daily
      if daily.dir:match("^2%. areas") then
        local file = io.open(tostring(path), "a")
        if file then
          file:write("# " .. alias .. "\n\n")
          file:write("## Work\n")
          file:write("- [[1. projects/qued/daily/" .. month .. "/" .. date .. "|qued]]\n")
          file:write("- [[1. projects/vv/daily/" .. month .. "/" .. date .. "|vv]]\n")
          file:close()
        end
      end
    end

    if daily.dir:match("^2%. areas") then
      main_note = path
    end
  end

  -- Open the main daily
  if main_note then
    vim.cmd("edit " .. vim.fn.fnameescape(tostring(main_note)))
  end
end

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
    { prefix .. "d", create_linked_dailies, desc = "Daily Note" },
  },
  opts = {
    -- Disable legacy commands (ObsidianX) in favour of new format (Obsidian x)
    legacy_commands = false,
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/my_vault",
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

    -- New notes go into the Notes subdirectory
    notes_subdir = "Notes",
    new_notes_location = "notes_subdir",

    -- Daily notes configuration
    daily_notes = {
      folder = "2. areas/daily",
      date_format = "%Y-%m-%d", -- Format for daily note filenames
      alias_format = "%B %-d, %Y", -- Format for the alias (e.g., "December 8, 2025")
      default_tags = { "daily" }, -- Tags to add to daily notes
      workdays_only = false, -- Set true to skip weekends with yesterday/tomorrow commands
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
    -- templates = {
    --   folder = "Templates",
    -- },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "snacks.pick",
    },
  },
}
