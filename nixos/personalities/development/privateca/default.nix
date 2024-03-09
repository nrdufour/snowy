{
    # security.pki.certificateFiles = [
    #     /etc/nixos/private_ca.crt
    # ]; 

    security.pki.certificates = [
        (builtins.readFile ./private-ca.crt)
        (builtins.readFile ./root_ca.crt)
    ];
}
