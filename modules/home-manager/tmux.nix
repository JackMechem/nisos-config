{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-Space";
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
    ];
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = ''
      unbind r
      bind r source-file ~/.tmux.conf

      unbind-key C-b
      set -g prefix C-Space

      unbind %
      bind '=' split-window -h

      unbind '"'
      bind - split-window -v

      set -s escape-time 0


      # Act like vim
      setw -g mode-keys vi

      set-window-option -g mode-keys vi

      bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
      bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

      unbind -T copy-mode-vi MouseDragEnd1Pane # don't exit copy mode after dragging with mouse

      bind-key -r j resize-pane -D 5
      bind-key -r k resize-pane -U 5
      bind-key -r l resize-pane -R 5
      bind-key -r h resize-pane -L 5

      bind -r m resize-pane -Z

      set -g mouse on

      bind S command-prompt -p "New Session:" "new-session -A -s '%%'"
      bind K confirm kill-session

      #List of plugins
      #set -g @plugin 'tmux-plugins/tpm'
      #set -g @plugin 'christoomey/vim-tmux-navigator'
      ## set -g @plugin 'jimeh/tmux-themepack'
      #set -g @plugin 'tmux-plugins/tmux-resurrect'
      #set -g @plugin 'tmux-plugins/tmux-continuum'
      ## set -g @plugin 'dracula/tmux'

      # Powerline (I prefer default tmux powerline)
      # set -g @themepack 'powerline/default/cyan'
      set -g @resurrect-capture-pane-contents 'on' # allow tmux-ressurect to capture pane contents
      set -g @continuum-restore 'on' # enable tmux-continuum functionality

      set -g default-terminal "screen-256color"

      set -g status-position bottom
      set -g status-left-length 50
      set -g status-right-length 140
      set -g status-justify centre # center align window list
      set -g status-bg "colour8"
      set -g status-fg "colour7"
    '';
  };
}

