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
      keymap = [
        {
          name = "HENKAN";
          remap = {
            Shift-CapsLock = "HENKAN";
            CapsLock = "HENKAN";
            M-Grave = "HENKAN";
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
