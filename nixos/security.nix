{ config, pkgs, ... }:{
  networking.hosts = {
    "127.0.0.1" = [
      "civitai.com"
      "www.civitai.com"
      "huggingface.co"
      "www.huggingface.co"
      "app.pixverse.ai"
      "pixverse.ai"
      "www.pixverse.ai"
      "deepswapper.com"
      "www.deepswapper.com"
      "pornhub.com"
      "www.pornhub.com"
    ];
  };  security.pam.services.sudo.text = ''
    # Account management
    account required pam_unix.so
    account required pam_time.so# Authentication management
auth       required   pam_env.so
auth       sufficient pam_unix.so try_first_pass likeauth nullok
auth       required   pam_deny.so

# Password management
password   sufficient pam_unix.so nullok sha512

# Session management
session    required   pam_unix.so  '';
}



