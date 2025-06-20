{
  inputs,
  username,
  ...
}: {
  imports = [inputs.xremap.nixosModules.default];
  services.xremap = {
    userName = username;
    serviceMode = "system";
    config = {
      modmap = [
        {
          name = "HENKAN";
          remap = {
            CapsLock = "LEFTCTRL";
          }; 
          application = {
            not = [];
          };
        }
      ];
      keymap = [
        {
          name = "HENKAN";
          remap = {
            M-Grave = "LEFTCTRL";
          }; 
          application = {
            not = [
                "remmina"
            ];
          };
        }
        {
          name = "Alt";
          remap = {
            Alt-KEY_LEFTBRACE = "Alt-Left";
            Alt-KEY_RIGHTBRACE = "Alt-Right";
          };
        }
        {
          name = "move workspace";
          remap = {
            Super-J = "Super-PageUp";
            Super-K = "Super-PageDown";
          };
        }
      ];
    };
  };
}
