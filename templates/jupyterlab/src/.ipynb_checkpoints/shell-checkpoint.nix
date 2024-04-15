{
  pkgs ? import <nixpkgs> {},
  pythonPackages ? pkgs.python3Packages,
}: let
  kernels = [
    pkgs.python3Packages.ansible-kernel
    pythonPackages.jupyter-c-kernel
    pkgs.gophernotes
  ];

  additionalExtensions = [
    "@jupyterlab/toc"
    # "@jupyterlab/fasta-extension"
    # "@jupyterlab/geojson-extension"
    # "@jupyterlab/katex-extension"
    # "@jupyterlab/mathjax3-extension"
    "@jupyterlab/plotly-extension"
    # "@jupyterlab/vega2-extension"
    # "@jupyterlab/vega3-extension"
    # "@jupyterlab/xkcd-extension"
    # "jupyterlab-drawio"
    # "@jupyterlab/hub-extension"
    # "jupyterlab_bokeh"
    "@oriolmirosa/jupyterlab_materialdarker" # Dark mode theme
    "@krassowski/jupyterlab-lsp" # JupyterLab LSP extension
    "@jupyterlab/debugger" # JupyterLab debugger extension
    "@jupyterlab/variableinspector" # Variable inspector extension
  ];
in
  pkgs.mkShell rec {
    buildInputs =
      [
        ### Base Packages
        pythonPackages.jupyterlab
        pythonPackages.requests
        pythonPackages.numpy
        pythonPackages.pandas

        ### Extensions
        # pythonPackages.ipywidgets
        # pythonPackages.ipydatawidgets
        # pythonPackages.ipywebrtc
        # pythonPackages.pythreejs
        # pythonPackages.ipyvolume
        pythonPackages.jupyterlab-git
        # pythonPackages.jupyterlab-latex
        # pythonPackages.ipyleaflet
        # pythonPackages.ipympl

        ### Code formatting tools
        pythonPackages.isort
        pythonPackages.black
      ]
      ++ kernels;

    shellHook = ''
          TEMPDIR=$(mktemp -d -p /tmp)
          mkdir -p $TEMPDIR
          cp -r ${pkgs.python3Packages.jupyterlab}/share/jupyter/lab/* $TEMPDIR
          chmod -R 755 $TEMPDIR
          echo "$TEMPDIR is the app directory"

          # kernels
          export JUPYTER_PATH="${pkgs.lib.concatMapStringsSep ":" (p: "${p}/share/jupyter/") kernels}"

      # labextensions
      ${pkgs.lib.concatMapStrings
        (s: "jupyter labextension install --no-build --app-dir=$TEMPDIR ${s}; ")
        (pkgs.lib.unique
          ((pkgs.lib.concatMap
            (d: pkgs.lib.attrByPath ["passthru" "jupyterlabExtensions"] [] d)
            buildInputs)
          ++ additionalExtensions))}
      jupyter lab build --app-dir=$TEMPDIR

      # start jupyterlab
      jupyter lab --app-dir=$TEMPDIR

         # Start zsh instead of bash
      exec zsh
    '';
  }
