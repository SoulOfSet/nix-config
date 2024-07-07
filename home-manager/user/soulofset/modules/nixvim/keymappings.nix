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
        action = "<cmd>bd<CR>";
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

      # Tab navigation
      {
        mode = "n";
        key = "<C-A-Left>";
        options.silent = true;
        action = "<cmd>tabprevious<CR>";
      }
      {
        mode = "n";
        key = "<C-A-Right>";
        options.silent = true;
        action = "<cmd>tabnext<CR>";
      }

      # ToggleTerm floating terminal
      {
        mode = "n";
        key = "<C-\\>";
        options.silent = true;
        action = "<cmd>ToggleTerm direction=float<CR>";
      }
    ];

    # ToggleTerm configuration
    extraConfigLua = ''
      require("toggleterm").setup{
        open_mapping = [[<c-\>]],
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
      }
    '';
  };
}

