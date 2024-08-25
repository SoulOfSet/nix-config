{ config, pkgs, ... }:
{
  programs.nixvim = {
    keymaps = [
      # Neotree command
      {
        mode = "n";
        key = "<leader>e";
        options.silent = true;
        action = "<cmd>Neotree<CR>";
      }

      # Navigate to current file in Neotree
      {
        mode = "n";
        key = "<leader>r";
        options.silent = true;
        action = "<cmd>Neotree reveal<CR>";
      }

      # Telescope commands
      {
        mode = "n";
        key = "<leader>ff";
        options.silent = true;
        action = "<cmd>Telescope find_files<CR>";
      }
      {
        mode = "n";
        key = "<leader>fp";
        options.silent = true;
        action = "<cmd>Telescope projects<CR>";
      }
      {
        mode = "n";
        key = "<leader>fg";
        options.silent = true;
        action = "<cmd>Telescope git_files<CR>";
      }
      {
        mode = "n";
        key = "<leader>fw";
        options.silent = true;
        action = "<cmd>Telescope live_grep<CR>";
      }
      {
        mode = "n";
        key = "<leader>fh";
        options.silent = true;
        action = "<cmd>Telescope help_tags<CR>";
      }
      {
        mode = "n";
        key = "<leader>fb";
        options.silent = true;
        action = "<cmd>Telescope buffers<CR>";
      }
      {
        mode = "n";
        key = "<leader>fc";
        options.silent = true;
        action = "<cmd>Telescope commands<CR>";
      }

      # Buffer commands
      {
        mode = "n";
        key = "<leader>w";
        options.silent = true;
        action = "<cmd>write<CR>";
      }
      {
        mode = "n";
        key = "<leader>c";
        options.silent = true;
        action = "<cmd>lua CloseBuffer()<CR>";
      }

      # Pane navigation
      {
        mode = "n";
        key = "<C-h>";
        options.silent = true;
        action = "<C-w>h";
      }
      {
        mode = "n";
        key = "<C-j>";
        options.silent = true;
        action = "<C-w>j";
      }
      {
        mode = "n";
        key = "<C-k>";
        options.silent = true;
        action = "<C-w>k";
      }
      {
        mode = "n";
        key = "<C-l>";
        options.silent = true;
        action = "<C-w>l";
      }

      # Buffer navigation
      {
        mode = "n";
        key = "gt";
        options.silent = true;
        action = "<cmd>BufferLineCycleNext<CR>";
      }
      {
        mode = "n";
        key = "gT";
        options.silent = true;
        action = "<cmd>BufferLineCyclePrev<CR>";
      }

      # Resize pane
      {
        mode = "n";
        key = "<A-Left>";
        options.silent = true;
        action = "<cmd>vertical resize -2<CR>";
      }
      {
        mode = "n";
        key = "<A-Right>";
        options.silent = true;
        action = "<cmd>vertical resize +2<CR>";
      }
      {
        mode = "n";
        key = "<A-Up>";
        options.silent = true;
        action = "<cmd>resize +2<CR>";
      }
      {
        mode = "n";
        key = "<A-Down>";
        options.silent = true;
        action = "<cmd>resize -2<CR>";
      }

      # Split windows
      {
        mode = "n";
        key = "<leader>sv";
        options.silent = true;
        action = "<cmd>vsplit<CR>";
      }
      {
        mode = "n";
        key = "<leader>sh";
        options.silent = true;
        action = "<cmd>split<CR>";
      }

      # ToggleTerm floating terminal
      {
        mode = "n";
        key = "<C-\\>";
        options.silent = true;
        action = "<cmd>ToggleTerm direction=float<CR>";
      }

      # Copy all text in the current buffer to the system clipboard
      {
        mode = "n";
        key = "<leader>y";
        options.silent = true;
        action = "ggVG\"+y";
      }
      # Go to definition
      {
        mode = "n";
        key = "<leader>ld";
        options.silent = true;
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      }

      # Find references/usages
      {
        mode = "n";
        key = "<leader>lr";
        options.silent = true;
        action = "<cmd>lua vim.lsp.buf.references()<CR>";
      }

      # Go to implementation
      {
        mode = "n";
        key = "<leader>li";
        options.silent = true;
        action = "<cmd>lua vim.lsp.buf.implementation()<CR>";
      }

      # Show hover documentation
      {
        mode = "n";
        key = "<leader>lk";
        options.silent = true;
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
      }

      # Rename symbol
      {
        mode = "n";
        key = "<leader>ln";
        options.silent = true;
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      }

      # Format code
      {
        mode = "n";
        key = "<leader>lf";
        options.silent = true;
        action = "<cmd>lua vim.lsp.buf.formatting()<CR>";
      }

      # Code actions
      {
        mode = "n";
        key = "<leader>la";
        options.silent = true;
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      }

      # Show diagnostics
      {
        mode = "n";
        key = "<leader>ld";
        options.silent = true;
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
      }

      # Go to next diagnostic
      {
        mode = "n";
        key = "<leader>ln";
        options.silent = true;
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
      }

      # Go to previous diagnostic
      {
        mode = "n";
        key = "<leader>lp";
        options.silent = true;
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
      }
    ];

    extraConfigLua = ''
      -- Ensure yank copies to the system clipboard as well as its existing functionality
      vim.api.nvim_set_keymap('n', 'y', 'y"+y', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('v', 'y', 'y"+y', { noremap = true, silent = true })
      
      require("toggleterm").setup{
        open_mapping = [[<c-\>]],
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
      }

      -- Utility function to close buffer without closing Neovim
      function CloseBuffer()
        local buf_info = vim.fn.getbufinfo({bufloaded = 1})
        if #buf_info > 1 then
          vim.cmd('bdelete')
        else
          vim.cmd('enew')
        end
      end
    '';
  };
}

