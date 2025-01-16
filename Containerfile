FROM registry.access.redhat.com/ubi9/ubi:latest

LABEL \
    io.openshift.tags="s3-sync" \
    io.k8s.display-name="Diskless s3-sync tooling" \
    io.k8s.description="Built on top of the RHEL Universal Base Image, s3-sync enables diskless synchronization from \
    one bucket to another, optionally on different endpoints, with configuration via environment variables, command \
    line arguments, and configuration files that can be mounted into the container." \
    description="Built on top of the RHEL Universal Base Image, s3-sync enables diskless synchronization from one \
    bucket to another, optionally on different endpoints, with configuration via environment variables, command line \
    arguments, and configuration files that can be mounted into the container." \
    summary="Provides the latest release of the s3-sync python package" \
    maintainer="James Harmison <jharmison@redhat.com>" \
    url="https://github.com/jharmison-redhat/s3-sync"

RUN dnf -y install python3.11-pip && \
    dnf -y clean all && \
    python3.11 -m pip install --no-cache-dir diskless-s3-sync

USER 1001

VOLUME ["/etc/s3-sync/config.toml"]

ENTRYPOINT ["/usr/local/bin/s3-sync"]
CMD []