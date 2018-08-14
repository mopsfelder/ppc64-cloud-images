ppc64-cloud-images
==================

These scripts build qcow2 images for various ppc64 and x86_64 distros.

Usage:

    $ ./build.sh <distro> <version> <arch>

Examples:

    $ export IMAGE_SIZE=160G
    $ ./build.sh centos 6 x86_64
    $ ./build.sh centos 7 ppc64
    $ ./build.sh centos 7 ppc64le
    $ ./build.sh centos 7 x86_64
    $ ./build.sh fedora 28 ppc64
    $ ./build.sh fedora 28 ppc64le
    $ ./build.sh fedora 28 x86_64
    $ ./build.sh fedora rawhide ppc64
    $ ./build.sh fedora rawhide ppc64le
    $ ./build.sh fedora rawhide x86_64
    $ ./build.sh ubuntu 14.04 ppc64
    $ ./build.sh ubuntu 14.04 x86_64
    $ ./build.sh ubuntu 16.04 ppc64
    $ ./build.sh ubuntu 16.04 ppc64le
    $ ./build.sh ubuntu 16.04 x86_64
    $ ./build.sh ubuntu 18.04 ppc64le
    $ ./build.sh ubuntu 18.04 x86_64

Images are created with:
- login/password: `user/user`
- root password: `user`
