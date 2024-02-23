local utils = require "astronvim.utils"
return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  --
  -- VV
  --
  --
  {
    "ronisbr/nano-theme.nvim",
    init = function ()
      -- vim.o.background = "dark" -- or "dark".
      vim.o.background = "light" -- or "dark".
    end
  },
  {
    "cappyzawa/trim.nvim",
    config = function()
      require('trim').setup({
        -- if you want to ignore markdown file.
        -- you can specify filetypes.
        ft_blocklist = {"markdown"},

        -- if you want to remove multiple blank lines
        -- patterns = {
        --   [[%s/\(\n\n\)\n\+/\1/]],   -- replace multiple blank lines with a single line
        -- },
        trim_last_line = false,
        trim_first_line = false,
        -- if you want to disable trim on write by default
        trim_on_write = true,
      })
    end,
    lazy=false
  },

  {"scalameta/nvim-metals",
  dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
  ft = { "scala", "sbt" },
  event = "BufEnter *.worksheet.sc",
  config = function()
    local api = vim.api
    ----------------------------------
    -- OPTIONS -----------------------
    ----------------------------------
    -- global
    vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
    vim.opt_global.shortmess:remove("F")
    vim.opt_global.shortmess:append("c")
    -- LSP Setup ---------------------
    ----------------------------------
    local metals_config = require("metals").bare_config()

    -- Example of settings
    metals_config.settings = {
      showImplicitArguments = true,
      showInferredType = true,
      superMethodLensesEnabled = true,
      showImplicitConversionsAndClasses = true,
    }

    -- *READ THIS*
    -- I *highly* recommend setting statusBarProvider to true, however if you do,
    -- you *have* to have a setting to display this in your statusline or else
    -- you'll not see any messages from metals. There is more info in the help
    -- docs about this
    metals_config.init_options.statusBarProvider = "on"

    -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
    -- metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Debug settings if you're using nvim-dap
    local dap = require("dap")

    dap.configurations.scala = {
      {
        type = "scala",
        request = "launch",
        name = "RunOrTest",
        metals = {
          runType = "runOrTestFile",
          --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
        },
      },
      {
        type = "scala",
        request = "launch",
        name = "Test Target",
        metals = {
          runType = "testTarget",
        },
      },
    }

    metals_config.on_attach = function(client, bufnr)
      local metals = require("metals")
      metals.setup_dap()

      local wk = require("which-key")
      wk.register({
        ["<localleader>"] = {
          h = {
            name = "hover",
            c = {
              function()
                metals.toggle_setting("showImplicitConversionsAndClasses")
              end,
              "Toggle show implicit conversions and classes",
            },
            i = {
              function()
                metals.toggle_setting("showImplicitArguments")
              end,
              "Toggle show implicit arguments",
            },
            t = {
              function()
                metals.toggle_setting("showInferredType")
              end,
              "Toggle show inferred type",
            },
          },
          t = {
            name = "Tree view",
            t = {
              function()
                require("metals.tvp").toggle_tree_view()
              end,
              "Toggle tree view",
            },
            r = {
              function()
                require("metals.tvp").reveal_in_tree()
              end,
              "Review in tree view",
            },
          },
          w = {
            function()
              metals.hover_worksheet({ border = "single" })
            end,
            "Hover worksheet",
          },
        },
      }, {
        buffer = bufnr,
      })
      wk.register({
        ["<localleader>t"] = {
          function()
            metals.type_of_range()
          end,
          "Type of range",
        },
      }, {
        mode = "v",
        buffer = bufnr,
      })
    end

    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      -- NOTE: You may or may not want java included here. You will need it if you
      -- want basic Java support but it may also conflict if you are using
      -- something like nvim-jdtls which also works on a java filetype autocmd.
      pattern = { "scala", "sbt", "java" },
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
},
{"famiu/bufdelete.nvim", lazy=false},
{"MunifTanjim/nui.nvim", lazy=false},
{"guysherman/pg.nvim",
requires = "nvim-lua/plenary.nvim",
lazy=false},
{"giusgad/hologram.nvim",
lazy=false
  },

  {"catppuccin/nvim",
  name = "catppuccin",
  opts = {
    integrations = {
      nvimtree = false,
      ts_rainbow = false,
      aerial = true,
      dap = { enabled = true, enable_ui = true },
      mason = true,
      neotree = true,
      notify = true,
      semantic_tokens = true,
      symbols_outline = true,
      telescope = true,
      which_key = true,
    },
  },
},

{"emmanueltouzery/agitator.nvim",
lazy=false},

{"Pocco81/true-zen.nvim",
lazy=false,
config = function()
  require("true-zen").setup {
    -- your config goes here
    -- or just leave it empty :)
  }
end,

  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "clojure_lsp") end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "clojure")
      end
    end,
  },

  {"rareitems/hl_match_area.nvim",
  lazy=false,
  config = function()
    require("hl_match_area").setup({})
  end},
  {"princejoogie/dir-telescope.nvim",
  -- telescope.nvim is a required dependency
  requires = { "nvim-telescope/telescope.nvim" },
  lazy=false,
  config = function()
    require("dir-telescope").setup({
      hidden = true,
      respect_gitignore = true,
    })
    require("telescope").load_extension("dir")
  end
},
{"folke/todo-comments.nvim",
lazy=false,
requires = "nvim-lua/plenary.nvim",
config = function()
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
end
    },

    {"Olical/conjure",
    -- lazy=false,
    ft = { "clojure", "python", "fennel" },
    init = function()
      vim.g['conjure#completion#omnifunc'] = nil
      vim.g['conjure#client#clojure#nrepl#mapping#refresh_changed'] = nil
      vim.g['conjure#client#clojure#nrepl#mapping#refresh_all'] = nil
      vim.g['conjure#client#clojure#nrepl#mapping#refresh_clear'] = nil
      vim.g['conjure#highlight#enabled'] = true
      vim.g['conjure#highlight#timeout'] = 200
      vim.g['conjure#log#hud#width'] = 0.5
      vim.g['conjure#log#hud#height'] = 0.5
      vim.g['conjure#log#hud#enabled'] = false

      vim.g['conjure#log#hud#overlap_padding'] = 0.0
      vim.g['conjure#log#hud#border'] = "rounded"
      vim.g['conjure#log#wrap'] = true
      vim.g["conjure#log#hud#anchor"] = "SE"
      vim.g["conjure#log#botright"] = true
      vim.g['conjure#log#jump_to_latest#enabled'] = false
      vim.g["conjure#extract#context_header_lines"] = 100
      vim.g['conjure#mapping#doc_word'] = false
      vim.g["conjure#eval#comment_prefix"] = ";; "
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
      vim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha"
      vim.g['conjure.log.jump_to_latest.enabled'] = true
      vim.g['conjure.log.wrap'] = true

      vim.g['conjure#eval#inline#highlight'] = 'MatchParen'
      -- !!
      -- vim.g['conjure#eval#inline#highlight'] = 'DiffAdd'
      -- !!
      -- vim.g['conjure#eval#inline#highlight'] = 'CursorLine'
      -- !!
      -- vim.g['conjure#eval#inline#highlight'] = 'CurSearch'

      -- vim.g['conjure#eval#inline#highlight'] = 'Substitute'
      -- vim.g['conjure#eval#inline#highlight'] = 'IncSearch'
      -- vim.g['conjure#eval#inline#highlight'] = 'FoldColumn'
      -- vim.g['conjure#eval#inline#highlight'] = 'Folded'
      -- vim.g['conjure#eval#inline#highlight'] = 'ErrorMsg'
      -- vim.g['conjure#eval#inline#highlight'] = 'TermCursorNC'
      -- vim.g['conjure#eval#inline#highlight'] = 'CursorColumn'
      -- vim.g['conjure#eval#inline#highlight'] = 'CursorIM'
      -- vim.g['conjure#eval#inline#highlight'] = 'Cursor'
      vim.g['conjure#client#clojure#nrepl#mapping#run_alternate_ns_tests'] = 'nil'
      vim.g['conjure#client#clojure#nrepl#mapping#run_current_ns_tests'] = 'nil'
      vim.g['conjure#client#clojure#nrepl#mapping#run_current_test'] = 'nil'


      vim.api.nvim_create_autocmd("BufNewFile", {
        group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
        pattern = { "conjure-log-*" },
        callback = function() vim.diagnostic.disable(0) end,
        desc = "Conjure Log disable LSP diagnostics",
      })
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("comment_config", { clear = true }),
        pattern = { "clojure" },
        callback = function() vim.bo.commentstring = ";; %s" end,
        desc = "Lisp style line comment",
      })
    end
  }
  ,
  {url="git@gitlab.com:invertisment/conjure-clj-additions-cider-nrepl-mw.git",
  requires = "Olical/conjure",

  lazy=false},

  {'Pocco81/auto-save.nvim',
  lazy=false,
  config = function()
    require("auto-save").setup {
      enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
      execution_message = {
        message = function() -- message to print on save
          return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18, -- dim the color of `message`
        cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
      },
      trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
      -- function that determines whether to save the current buffer or not
      -- return true: if buffer is ok to be saved
      -- return false: if it's not ok to be saved
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        if
          fn.getbufvar(buf, "&modifiable") == 1 and
          utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
          return true -- met condition(s), can save
        end
        return false -- can't save
      end,
      write_all_buffers = false, -- write all buffers when the current one meets `condition`
      debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
      callbacks = { -- functions to be executed at different intervals
      enabling = nil, -- ran when enabling auto-save
      disabling = nil, -- ran when disabling auto-save
      before_asserting_save = nil, -- ran before checking `condition`
      before_saving = nil, -- ran before doing the actual save
      after_saving = nil -- ran after doing the actual save
    }
  }
end
},

{'guns/vim-sexp', lazy=false},

{'f-person/git-blame.nvim', lazy=false, config = function()
  vim.g.gitblame_message_template = '[<date>] <committer> <summary>'
  vim.g.gitblame_date_format = '%x'
end
    },

    {"nvim-lua/plenary.nvim", lazy=false}
  }
