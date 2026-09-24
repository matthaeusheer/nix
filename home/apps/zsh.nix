{ pkgs, ... }:

{
  home.packages = [
    pkgs.eza
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "docker" ];
    };

    shellAliases = {
      l = "eza -F";
      ls = "eza -F";
      ll = "eza -lF --git";
      la = "eza -Fa";
      ".." = "cd ..";
      pass = "gopass ls --flat | rofi -dmenu -normal-window -steal-focus -p password | xargs --no-run-if-empty gopass show -o | wl-copy";
      sclip = "wl-paste -n | wl-copy -p";
      k = "kubectl";
      vim = "nvim";
      vi = "nvim";
      v = "nvim";
      oldvim = "vim";
      lg = "lazygit";
      ks = "k9s";
      c = "clear";
      cl = "claude";

      zrc = "vim ~/.zshrc";
      szrc = "source ~/.zshrc";
      kconf = "vim ~/.config/kitty/kitty.conf";
      vrc = "vim ~/.vimrc";

      pshell = "pipenv shell";
      jlnotebooks = "jupyter lab notebooks";

      tm = "task-master";
      taskmaster = "task-master";

      tf = "terraform";
      tfa = "terraform apply";
      tfc = "terraform console";
      tfd = "terraform destroy";
      tff = "terraform fmt";
      tfg = "terraform graph";
      tfim = "terraform import";
      tfin = "terraform init";
      tfo = "terraform output";
      tfp = "terraform plan";
      tfpr = "terraform providers";
      tfr = "terraform refresh";
      tfsh = "terraform show";
      tft = "terraform taint";
      tfut = "terraform untaint";
      tfv = "terraform validate";
      tfw = "terraform workspace";
      tfs = "terraform state";
      tffu = "terraform force-unlock";
      tfwst = "terraform workspace select";
      tfwsw = "terraform workspace show";
      tfssw = "terraform state show";
      tfwde = "terraform workspace delete";
      tfwls = "terraform workspace list";
      tfsls = "terraform state list";
      tfwnw = "terraform workspace new";
      tfsmv = "terraform state mv";
      tfspl = "terraform state pull";
      tfsph = "terraform state push";
      tfsrm = "terraform state rm";
      tfay = "terraform apply -auto-approve";
      tfdy = "terraform destroy -auto-approve";
      tfinu = "terraform init -upgrade";
      tfpde = "terraform plan --destroy";
    };

    initContent = ''
      complete -F __start_kubectl k

      if [[ -n $SSH_CONNECTION ]]; then
        export EDITOR='vim'
      else
        export EDITOR='nvim'
      fi

      zstyle ':completion:*:*:docker:*' option-stacking yes
      zstyle ':completion:*:*:docker-*:*' option-stacking yes
      zstyle ':completion:*:*:make:*' tag-order 'targets'

      autoload -U +X bashcompinit && bashcompinit
      if command -v terraform >/dev/null 2>&1; then
        complete -o nospace -C "$(command -v terraform)" terraform
      fi

      if [[ "$(uname -m)" == "aarch64" ]]; then
        export DOCKER_DEFAULT_PLATFORM=linux/amd64
      fi

      if command -v kubectl >/dev/null 2>&1; then
        source <(kubectl completion zsh)
      fi
      if command -v helm >/dev/null 2>&1; then
        source <(helm completion zsh)
      fi
      if command -v oc >/dev/null 2>&1; then
        source <(oc completion zsh)
      fi
    '';
  };
}
