-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {

      ["<leader>e"] = false,
      ["<leader>E"] = {'<cmd>PGConnectBuffer<cr>', desc = "run pg query"},
      ["<leader>gT"] = {
        function()
          require("agitator").git_time_machine({ use_current_win = true })
        end,
        desc = "Time machine"},
      ["<leader>C"] = false,
      ["<leader>c"] = false,
      ["<leader>/"] = false,
      ["<leader>h"] = false,
      ["<leader>w"] = false,
      ["<leader>o"] = false,
      ["<C-q>"] = false,
      ["<S-l>"] = false,
      ["N"] = false,
      ["<C-k>"] = false,
      ["gx"] = false,
      ["<leader>gh"] = false,
      ["<leader>gp"] = {"<cmd>ToggleBlame<CR>", desc = "Toggle blame"},

      ["<leader>gk"] = false,
      ["<leader>gj"] = false,
      ["<C-b>"] = false,
      ["<C-i>"] = false,
      ["<M-e>"] = false,
      ["<leader>x"] = { function() require("bufdelete").bufdelete(0, false) end, desc = "Close buffer" },
      ["<S-tab>"] = { "<cmd>bprevious<cr>", desc = "prev buffer" },
      ["<Tab>"] = { '<cmd>bnext<cr>', desc = "next buffer"},
      ["<leader>ge"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous git hunk" },
      ["<leader>gn"] = { function() require("gitsigns").next_hunk() end, desc = "Next git hunk" },
      ["<leader>gr"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset git hunk" },

      ["<localleader>tt"] = { ":CcaNreplRunCurrentTest<CR>", desc = "Run current test" },
      ["<localleader>tn"] = { ":CcaNreplRunTestsInTestNs<CR><CR>", desc = "Run ns tests" },
      ["<localleader>tT"] = { ":CcaNreplJumpToFailingCljTest<CR><CR>", desc = "Go to failing test" },
      -- ["<localleader>tT"] = { ":ConjureCljRunAlternateNsTests<CR>", desc = "Run tests of this non-test ns" },
      -- ["<localleader>tg"] = {":CcaNsJumpToAlternate<CR>", desc = "go to test"},

      -- ["<localleader>tt"] = { ":ConjureCljRunCurrentTest<CR>", desc = "Run current test" },
      --
      ["<leader>uo"] = { ":TZAtaraxis<CR>", desc = "center" },
      ["<leader>uO"] = { ":TZMinimalist<CR>", desc = "center2" },
      ["<leader>fa"] =  {"<cmd>Telescope dir live_grep<CR>", desc = "live grep in dir"},
      ["<leader>fg"] =  {"<cmd>Telescope dir find_files<CR>", desc = "find files in dir"},
      ["n"] = { "<down>", desc = "down" },
      ["e"] = { "<up>", desc = "up" },
      ["s"] = { "h", desc = "left" },
      ["t"] = { "l", desc = "right" },
      ["h"] = { "n", desc = "next" },
      ["<S-h>"] = { "N", desc = "prev" },
      -- ["E"] = { "e|", desc = "end" },
      ["<C-m>"] = { "m|", desc = "mark" },
      -- ["<leader>gR"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset git buffer" }
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bD"] = {
          function()
              require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
          end,
          desc = "Pick to close",
      },
      -- tables with the `name` key will be registered with which-key if it's installed
      -- this is useful for naming menus
      ["<leader>b"] = { name = "Buffers" },

      ["<leader>bb"] = { "<cmd>Telescope projects<cr>", desc = "Select project" },
      -- ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["gd"] = {function() vim.lsp.buf.definition() end, desc = "go to definition my"},
      ["<Leader>ws"] = { "<C-W>s", desc = "Horizontal split" },
      ["<C-t>"] = { "<C-w>l", desc = "Go to right window" },
      ["<C-s>"] = { "<C-w>h", desc = "Go to left window" },
      ["<C-n>"] = { "<C-w>j", desc = "Go to bottom window" },
      ["<C-e>"] = { "<C-w>k", desc = "Go to upper window" },
      ["<Leader>wv"] = { "<C-W>v", desc = "Vertical split" },
      ["<Leader>wd"] = { ":q<CR>", desc = "Close buffer" },
      ["<leader>op"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
      ["k"] = { "<cmd>ConjureEvalCurrentForm<cr>"--[[ , desc = "Eval form conjure" ]]},
      ["<leader>bl"] = { ':bprevious<cr>', desc = "Previous buffer"},
      -- ["H"] = { '?<cr>', desc = "search backwards"},
      -- ["h"] = { '/<cr>', desc = "search"},
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      ["gcb"] = { "i#_<esc>", desc = "my comment" },
      ["<leader>rr"] = { "<Plug>(sexp_raise_element)", desc = "raise" },
      ["<leader>("] = { "<Plug>(sexp_round_head_wrap_list)", desc = "wrap(" },
      ["<leader>)"] = { "<Plug>(sexp_round_tail_wrap_list)", desc = "wrap)" },
      ["<leader>["] = { "<Plug>(sexp_square_head_wrap_list)", desc = "wrap[" },
      ["<leader>]"] = { "<Plug>(sexp_square_tail_wrap_list)", desc = "wrap]" },
      ["<leader>{"] = { "<Plug>(sexp_curly_head_wrap_list)", desc = "wrap{" },
      ["<leader>r("] = { "<Plug>(sexp_round_head_wrap_element)", desc = "wrapel(" },

      ["<leader>r)"] = { "<Plug>(sexp_round_tail_wrap_element)", desc = "wrapel)" },
      ["<leader>r["] = { "<Plug>(sexp_square_head_wrap_element)", desc = "wrapel[" },
      ["<leader>r]"] = { "<Plug>(sexp_square_tail_wrap_element)", desc = "wrapel]" },
      ["<leader>r{"] = { "<Plug>(sexp_curly_head_wrap_element)", desc = "wrapel{" },
      ["<leader>r}"] = { "<Plug>(sexp_curly_tail_wrap_element)", desc = "wrapel}" },
      ["<leader>rw"] = { "<Plug>(sexp_round_head_wrap_element)", desc = "wrap(" },
      ["<leader>rv"] = { "<Plug>(sexp_indent)", desc = "indent" },
      ["<leader>r,"] = { "<Plug>(sexp_capture_prev_element)", desc = "slurp left" },
      ["<leader>r."] = { "<Plug>(sexp_capture_next_element)", desc = "slurp right" },
      ["Y"] = { "y<Plug>(sexp_outer_element)", desc = "yank element" },

      [")"] = {"<Plug>(sexp_flow_to_next_open)", desc = "hz1n"},
      ["("] = {"<Plug>(sexp_flow_to_prev_open)", desc = "hz1na"},
      ["<silent>ae"] = {"<Plug>(sexp_outer_element)", desc = "ae"},
      ["<silent>ie"] = {"<Plug>(sexp_inner_element)", desc = "ie"},
      ["<localleader>ea"] = {"<cmd>CcaFormFlameResults<CR>", desc = "Open flamegraphs"},
      ["<localleader>el"] = {"<cmd>CcaFormFlame<CR>", desc = "Make flamegraph"},
      ["<localleader>ej"] = {"<cmd>CcaFormBench<CR>", desc = "Benchmark criterium"}

  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
      ["<C-h>"] = false,
      ["<C-j>"] = false,
      ["<C-k>"] = false,
      ["<C-l>"] = false,

      ["<C-s>"] = { "<c-\\><c-n><c-w>h", desc = "Terminal left window navigation" },
      ["<C-t>"] = { "<c-\\><c-n><c-w>j", desc = "Terminal down window navigation" },
      ["<C-e>"] = { "<c-\\><c-n><c-w>k", desc = "Terminal up window navigation" },
      ["<C-n>"] = { "<c-\\><c-n><c-w>l", desc = "Terminal right window navigation" },
      ["<C-o>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  },
  v = {

      ["<leader>e"] = {':<c-u>exec "PGRunQuery"<cr>', desc = "run pg query"},
      ["n"] = { "gj|", desc = "down" },
      ["e"] = { "gk|", desc = "up" },
      ["s"] = { "h", desc = "left" },
      ["t"] = { "l", desc = "right" },
      ["h"] = { "n", desc = "next" },
      ["<S-h>"] = { "N", desc = "prev" },
      -- ["E"] = { "e|", "end" },
      ["<C-m>"] = { "m|", desc = "mark" }
  },
  o = {
      ["n"] = { "<down>", desc = "down" },
      ["e"] = { "<up>", desc = "up" },
      ["s"] = { "h", desc = "left" },
      ["t"] = { "l", desc = "right" },
      ["h"] = { "n", desc = "next" },
      ["<S-h>"] = { "N", desc = "prev" },
      -- ["E"] = { "e|", desc = "end" },
      ["k"] = { "t", desc = "till" },
  }
}
