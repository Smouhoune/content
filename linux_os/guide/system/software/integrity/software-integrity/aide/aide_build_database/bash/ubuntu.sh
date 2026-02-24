# platform = multi_platform_ubuntu

{{{ bash_package_install("aide") }}}

AIDE_CONFIG={{{ aide_conf_path }}}
DEFAULT_DB_PATH={{{ aide_db_path }}}
DEFAULT_DB_NEW_PATH={{{ aide_db_new_path }}}

# Fix db path in the config file, if necessary
if ! grep -q '^database=file:' ${AIDE_CONFIG}; then
    # replace_or_append gets confused by 'database=file' as a key, so should not be used.
    #replace_or_append "${AIDE_CONFIG}" '^database=file' "${DEFAULT_DB_PATH}" '@CCENUM@' '%s:%s'
    echo "database=file:${DEFAULT_DB_PATH}" >> ${AIDE_CONFIG}
fi

# Fix db out path in the config file, if necessary
if ! grep -q '^database_out=file:' ${AIDE_CONFIG}; then
    echo "database_out=file:${DEFAULT_DB_NEW_PATH}" >> ${AIDE_CONFIG}
fi

/usr/sbin/aideinit -y -f
