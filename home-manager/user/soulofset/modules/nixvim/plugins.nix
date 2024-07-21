{lib, pkgs, ...}: {
  programs.nixvim.plugins = {

    # Auto save
    auto-save = {
      enable = true;
    };

    # Buffer bar
    bufferline = {
      enable = true;
    };

    # Status bar
    lualine = {
      enable = true;
    };

    # Make `nvim .` look prettier
    oil = {
      enable = true;
    };

    # Includes all parsers for treesitter
    treesitter = {
      enable = true;
    };

    # Auto-tagging
    ts-autotag = {
      enable = true;
    };

    # Autopairs
    nvim-autopairs = {
      enable = true;
    };

    # Debugger
    dap = {
      enable = true;
      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "●";
          texthl = "DapBreakpointCondition";
        };
        dapLogPoint = {
          text = "◆";
          texthl = "DapLogPoint";
        };
      };
      extensions = {
        dap-python = {
          enable = true;
        };
        dap-ui = {
          enable = true;
          floating.mappings = {
            close = ["<ESC>" "q"];
          };
        };
        dap-virtual-text = {
          enable = true;
        };
      };
      configurations = {
        java = [
          {
            type = "java";
            request = "launch";
            name = "Debug (Attach) - Remote";
            hostName = "127.0.0.1";
            port = 5005;
          }
        ];
      };
    };

    # Linting
    lint = {
      enable = true;
      lintersByFt = {
        text = ["vale"];
        json = ["jsonlint"];
        markdown = ["vale"];
        rst = ["vale"];
        ruby = ["ruby"];
        janet = ["janet"];
        inko = ["inko"];
        clojure = ["clj-kondo"];
        dockerfile = ["hadolint"];
        terraform = ["tflint"];
      };
    };

    # Trouble
    trouble = {
      enable = true;
    };

    # Code snippets
    luasnip = {
      enable = true;
    };

    # Easily toggle comments
    commentary.enable = true;

    # Terminal inside Neovim
    toggleterm = {
      enable = true;
      settings = {
        hide_numbers = false;
        autochdir = true;
        close_on_exit = true;
        direction = "vertical";
      };
    };

    # Git signs in code
    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };

    which-key = {
      enable = true;
    };

    # Markdown preview server
    markdown-preview = {
      enable = true;
      settings.theme = "dark";
    };

    # Prettier fancier command window
    noice = {
      enable = true;
    };

    # Good old Telescope
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
    };

    # Todo comments
    todo-comments = {
      enable = true;
      colors = {
        error = ["DiagnosticError" "ErrorMsg" "#DC2626"];
        warning = ["DiagnosticWarn" "WarningMsg" "#FBBF24"];
        info = ["DiagnosticInfo" "#2563EB"];
        hint = ["DiagnosticHint" "#10B981"];
        default = ["Identifier" "#7C3AED"];
        test = ["Identifier" "#FF00FF"];
      };
    };

    # File tree
    neo-tree = {
      enable = true;
      enableDiagnostics = true;
      enableGitStatus = true;
      enableModifiedMarkers = true;
      enableRefreshOnWrite = true;
      closeIfLastWindow = true;
      popupBorderStyle = "rounded";
      buffers = {
        bindToCwd = false;
        followCurrentFile = {
          enabled = true;
        };
      };
      window = {
        width = 40;
        height = 15;
        autoExpandWidth = false;    
      };
    };

    # Nix expressions in Neovim
    nix = {
      enable = true;
    };

    # Language server
    lsp = {
      enable = true;
      servers = {
        tsserver.enable = true;
        cssls.enable = true;
        tailwindcss.enable = true;
        html.enable = true;
        astro.enable = true;
        phpactor.enable = true;
        svelte.enable = false;
        vuels.enable = false;
        pyright.enable = true;
        marksman.enable = true;
        nil-ls.enable = true;
        dockerls.enable = true;
        bashls.enable = true;
        clangd.enable = true;
        csharp-ls.enable = true;
        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
      };
    };

   nvim-jdtls = {
      enable = true;
      cmd = [
        (lib.getExe pkgs.jdt-language-server)
          "-data" "/home/soulofset/Documents/projects/"
          "-configuration" "/home/soulofset/.jdtls/config/"
          "--jvm-arg=-Xbootclasspath/a:/home/soulofset/.assets/jar/lombok.jar"
          "--jvm-arg=-javaagent:/home/soulofset/.assets/jar/lombok.jar"
        ];
    };

    # Dashboard
    alpha = {
      enable = true;
      theme = "dashboard";
      iconsEnabled = true;
    };

    cmp.enable = true;

    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-buffer = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    };
    cmp_luasnip = {
      enable = true;
    };
    cmp-cmdline = {
      enable = false;
    };
  };

  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    project-nvim
    jupytext-nvim
  ];

  # Configure project.nvim and cmp
  programs.nixvim.extraConfigLua = ''
    require("project_nvim").setup({
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      show_hidden = true,
      silent_chdir = true,
      scope_chdir = 'global',
      datapath = vim.fn.stdpath("data"),
    })
    require('telescope').load_extension('projects')

    -- Configure jupytext-nvim
    require("jupytext").setup({style = "light"})


    -- Configure nvim-cmp
    local cmp = require'cmp'
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
        { name = 'path' },
      })
    })
  '';
}

