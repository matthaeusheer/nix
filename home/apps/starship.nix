{ lib, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;

      format = lib.concatStrings [
        "$directory"
        "$status"
        "$shlvl"
        "$custom"
        "$username"
        "$hostname"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_status"
        "$kubernetes"
        "$docker_context"
        "$package"
        "$cmake"
        "$dart"
        "$dotnet"
        "$elixir"
        "$elm"
        "$erlang"
        "$golang"
        "$helm"
        "$java"
        "$julia"
        "$nim"
        "$nodejs"
        "$ocaml"
        "$perl"
        "$lua"
        "$php"
        "$purescript"
        "$python"
        "$ruby"
        "$crystal"
        "$rust"
        "$swift"
        "$terraform"
        "$zig"
        "$nix_shell"
        "$conda"
        "$aws"
        "$gcloud"
        "$openstack"
        "$env_var "
        "$character"
      ];

      gcloud.disabled = true;

      memory_usage = {
        disabled = false;
        threshold = 75;
        symbol = "";
        style = "bold dimmed white";
        format = "[ $symbol \${ram} ](bg:none $style)[ ](bg:none)";
      };

      shlvl = {
        disabled = false;
        format = "[ $shlvl](bg:none $style)[ ](bg:none)";
        style = "bold red";
        threshold = 2;
      };

      username = {
        style_user = "white bold";
        style_root = "black bold";
        format = "[  $user ](bg:none $style)[](bg:none)";
        disabled = false;
        show_always = false;
      };

      hostname = {
        format = "[  $hostname ](bg:none $style)[](bg:none)";
        trim_at = ".";
        style = "dimmed bold red";
        disabled = false;
      };

      git_branch = {
        symbol = " ";
        format = "[ $symbol$branch ](bg:none $style)";
        style = "bold green";
        truncation_length = 18;
      };

      git_commit = {
        commit_hash_length = 7;
        tag_symbol = " ";
        tag_disabled = false;
        format = "[ $hash](bg:none $style)[($tag) ](bg:none $style)";
      };

      git_state = {
        format = "([$state( $progress_current/$progress_total) ](bg:none $style)\\)";
      };

      git_status = {
        format = "([\\[$all_status$ahead_behind\\] ](bg:none $style))";
        style = "red";
        conflicted = "";
        ahead = "[ \${count}](bg:none yellow)";
        behind = "[ \${count}](bg:none yellow)";
        diverged = "[  \${ahead_count}\${behind_count}](bg:none yellow)";
        staged = "[\\($count\\)](bg:none green)";
        renamed = "凜";
        deleted = "";
      };

      kubernetes = {
        disabled = false;
        format = "[ ](bg:none)[$symbol $context $namespace ](bg:none $style)";
        style = "#BA55D3 dimmed bold";
        symbol = "⎈";
      };

      docker_context = {
        symbol = " ";
        format = "[ ](bg:none)[$symbol$context ](bg:none$style)";
      };

      package = {
        symbol = " ";
        format = "[ ](bg:none)[$symbol$version ](bg:none $style)";
      };

      cmake.format = "[ ](bg:none)[$symbol$version ](bg:none $style)";

      golang = {
        symbol = "🐹 ";
        format = "[ ](bg:none)[$symbol$version ](bg:none $style)";
      };

      lua = {
        symbol = " ";
        format = "[ ](bg:none)[$symbol$version ](bg:none $style)";
      };

      nim = {
        symbol = " ";
        format = "[ ](bg:none)[$symbol$version ](bg:none $style)";
      };

      java = {
        symbol = " ";
        format = "[ ](bg:none)[$symbol$version ](bg:none $style)";
      };

      rust = {
        symbol = " ";
        format = "[ ](bg:none)[$symbol$version ](bg:none $style)";
      };

      python = {
        symbol = "🐍 ";
        pyenv_version_name = false;
        format = "[ ](bg:none)[\${symbol}\${version} \${virtualenv}](bg:none $style)";
      };

      perl = {
        symbol = " ";
        format = "[ ](bg:none)[$symbol$version ](bg:none $style)";
      };

      helm = {
        symbol = "🪖 ";
        format = "[ ]()[$symbol$version ](bg:none $style)";
      };

      directory = {
        truncation_length = 8;
        truncation_symbol = "…/";
        truncate_to_repo = false;
        read_only = " ";
        format = "([$read_only]($read_only_style) )[$path]($style) ";
      };

      status = {
        symbol = "❌";
        format = "\\[[$symbol](red) [$status](bold dimmed)\\] ";
        disabled = false;
      };
    };
  };
}
