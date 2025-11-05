{ pkgs, ... }:

{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        # Common language servers
        bashls.enable = true;
        clangd.enable = true;
        nixd.enable = true;
        ts_ls = { enable = true; package = null; };
        ruff.enable = true;

        # Packages is set to null to rely on the system wide installed packages
        # this is done to avoid conflicts with the nixpkgs versions.
        # elixirls = {
        #   enable = true;
        #   package = null; # default pkgs.elixir-ls
        #   cmd = [ "elixir-ls" ];
        # };
        # gleam = {
        #   enable = true;
        #   package = null; # default pkgs.gleam
        # };
        gopls = {
          enable = true;
          package = null; # default pkgs.gopls
        };
        # kotlin_language_server = {
        #   enable = true;
        #   package = null; # default pkgs.kotlin-language-server
        # };
        # prolog_ls = {
        #   enable = true;
        #   package = null; # default pkgs.swi-prolog;
        # };
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
    rustaceanvim.enable = true;
  };
  extraConfigLua = ''
    -- Auto organize imports before save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        vim.lsp.buf.code_action({
          context = { only = { "source.organizeImports" } },
          apply = true,
        })
        vim.lsp.buf.format({ async = false })
      end,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.c", "*.h" },
        callback = function()
            vim.lsp.buf.format({ async = false })
        end,
    })
  '';
}