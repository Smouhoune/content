# platform = Red Hat Virtualization 4,multi_platform_fedora,multi_platform_ol,multi_platform_rhel,multi_platform_sle,multi_platform_slmicro,multi_platform_almalinux

{{% if 'sle' in product or 'slmicro' in produc %}}
zypper -q --no-remote ref
{{% endif %}}

{{{ bash_package_install("aide") }}}
{{{ aide_bin_path }}} --init
/bin/cp -p {{{ aide_db_new_path }}} {{{ aide_db_path }}}
