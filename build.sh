#!/bin/sh

set -a

DISTRO="${1}"
VERSION="${2}"
ARCH="${3}"

QEMU_NET="-netdev user,id=n0 -device virtio-net-pci,netdev=n0" # compatible with qemu 2.3 (PowerKVM)
QEMU_OPTS="-m 4G -nographic -nodefaults -serial mon:stdio ${QEMU_NET}"

IMAGE_SIZE="16G"
IMAGE="${DISTRO}_${VERSION}_${ARCH}.qcow2"

TMP_IMAGE="$$.qcow2"
TMP_INITRD="$$.initrd"

function atexit {
    rm -f ${TMP_IMAGE}
    rm -f ${TMP_INITRD}
}
trap atexit EXIT

# align to 4B
function initrd_align {
    SIZE=$(stat --printf=%s ${TMP_INITRD})
    MOD=$((SIZE % 4))
    if [ ${MOD} -ne 0 ]; then
        EXTRA=$((4 - MOD))
        dd if=/dev/zero of=${TMP_INITRD} bs=1 count=${EXTRA} conv=notrunc oflag=append
    fi
}

function img_create {
    qemu-img create -f qcow2 ${TMP_IMAGE} ${IMAGE_SIZE}
}

function img_convert {
    qemu-img convert -c -f qcow2 -O qcow2 ${TMP_IMAGE} ${IMAGE}
}

cd ${DISTRO}
./build.sh "${VERSION}" "${ARCH}"
exit
