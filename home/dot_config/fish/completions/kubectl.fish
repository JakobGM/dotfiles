# Fish loads this file the first time kubectl is completed, which keeps the
# slow `kubectl completion` call out of shell startup.
command -q kubectl; and kubectl completion fish | source
