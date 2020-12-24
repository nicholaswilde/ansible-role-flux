# Ansible Role: Flux

[![CI](https://github.com/nicholaswilde/ansible-role-flux/workflows/CI/badge.svg?event=push)](https://github.com/nicholaswilde/ansible-role-flux/actions?query=workflow%3ACI)

This role installs the [Flux](https://helm.sh) binary on any supported host.

## Requirements

N/A

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yaml](./defaults/main.yaml)):

    app_ver: '0.5.7'
    app_platform: linux
    app_arch: amd64

Controls for the version of Helm to be installed. See [available Flux releases](https://github.com/fluxcd/flux2/releases/). You can upgrade or downgrade versions by changing the `app_ver`.

    app_bin_path: /usr/local/bin/flux

The location where the Helm binary will be installed.

## Dependencies

    [andrewrothstein.unarchive-deps](https://galaxy.ansible.com/andrewrothstein/unarchive-deps)

## Example Playbook

    - hosts: all
      roles:
        - role: nicholaswilde.flux

## Inspiration

Inspiration for this repository has been taken from [Andrew Rothstein](https://github.com/andrewrothstein) and [Jeff Geerling](https://github.com/geerlingguy/).

## License

[Apache 2.0 License](./LICENSE)

## Author Information

This project was started in 2020 by [Nicholas Wilde](https://github.com/nicholaswilde/).
