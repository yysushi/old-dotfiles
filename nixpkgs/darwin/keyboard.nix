{ ... }:
{
  system.defaults = {
    NSGlobalDomain = {
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 12;
      KeyRepeat = 1;
    };
  };
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
    userKeyMapping = [
      # https://developer.apple.com/library/archive/technotes/tn2450/_index.html
      {
        # Keyboard Delete Forward 0x70000004C
        HIDKeyboardModifierMappingSrc = 30064771148;
        # Keyboard Right Shift 0x7000000E5
        HIDKeyboardModifierMappingDst = 30064771301;
      }
    ];
  };
}
