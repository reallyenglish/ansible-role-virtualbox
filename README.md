# ansible-role-virtualbox

Installs and configures virtualbox

# Requirements

None

# Role Variables

| variable | description | default |
|----------|-------------|---------|
| `virtualbox_user` | Virtualbox user | `{{ __virtualbox_user }}` |
| `virtualbox_group` | Virtualbox group | `{{ __virtualbox_group }}` |
| `virtualbox_kernel_modules` | Virtualbox kernel modules | `{{ __virtualbox_kernel_modules|default('') }}` |
| `virtualbox_version_redhat` | Virtualbox version in RedHat | `{{ __virtualbox_version_redhat|default('') }}` |

## Debian

| Variable | Default |
|----------|---------|
| `__virtualbox_user` | `vboxusers` |
| `__virtualbox_group` | `vboxusers` |
| `__virtualbox_kernel_modules` | ( see below ) |
## __virtualbox_kernel_modules
```yaml
  - mname: vboxdrv
    kname: vboxdrv
  - mname: vboxnetflt
    kname: vboxnetflt
  - mname: vboxnetadp
    kname: vboxnetadp
```

## FreeBSD

| Variable | Default |
|----------|---------|
| `__virtualbox_user` | `vboxusers` |
| `__virtualbox_group` | `vboxusers` |
| `__virtualbox_kernel_modules` | ( see below ) |
## __virtualbox_kernel_modules
```yaml
  - mname: vboxdrv
    kname: vboxdrv
  - mname: ng_vboxnetflt
    kname: vboxnetflt
  - mname: vboxnetadp
    kname: vboxnetadp
```

## RedHat

| Variable | Default |
|----------|---------|
| `__virtualbox_user` | `vboxusers` |
| `__virtualbox_group` | `vboxusers` |
| `__virtualbox_version_redhat` | `5.1` |

# Dependencies

None

# Example Playbook

```yaml
- hosts: localhost
  roles:
    - ansible-role-virtualbox
```

# License

```
Copyright (c) 2017 mitsuruy,,, <mitsuruy@reallyenglish.com>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

# Author Information

mitsuruy,,, <mitsuruy@reallyenglish.com>

This README was created by [qansible](https://github.com/trombik/qansible)
