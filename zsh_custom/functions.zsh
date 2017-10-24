# Use gpip to install global python packages, as pip requires virtualenv
gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
