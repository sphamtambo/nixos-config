# {pkgs, ...}: {
#   programs = {
#     nixvim.extraPlugins = with pkgs.vimPlugins; [
#       comment-nvim
#     ];
#
#     nixvim.extraConfigLua = ''
#       require('comment').setup()
#     '';
#   };
# }
{
  programs.nixvim.plugins.comment.enable = true;
}
