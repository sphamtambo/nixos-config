{inputs, ...}: {
  overlays = final: prev: {
    neovim = inputs.nixvimed.packages.${prev.system}.default;
  };
}
