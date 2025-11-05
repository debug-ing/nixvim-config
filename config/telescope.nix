{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<C-f>" = {
        action = "current_buffer_fuzzy_find";
        options.desc = "Search in current file";
      };
      "<C-g>" = {
        action = "live_grep";
        options.desc = "Search in project";
      };
    #   "<C-f>" = "live_grep";
      "<C-p>" = {
        action = "git_files";
        options = {
          desc = "Telescope Git Files";
        };
      };
    };
    extensions.fzf-native = { enable = true; };
  };
}