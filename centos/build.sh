#!/bin/bash

. ${PWD}/vars_${ARCH}

wget -nc ${VMLINUX} -O ${LOCAL_VMLINUX}
wget -nc ${INITRD} -O ${LOCAL_INITRD}

VMLINUX=${LOCAL_VMLINUX}
INITRD=${LOCAL_INITRD}

cp ${INITRD} ${TMP_INITRD}

initrd_align

echo ${KICKSTART} | cpio -ovH newc >> ${TMP_INITRD}

img_create

${QEMU} ${QEMU_OPTS} -drive file=${ISO},media=cdrom -drive file=${TMP_IMAGE} -kernel ${VMLINUX} -initrd ${TMP_INITRD} -append "${QEMU_APPEND}"

img_convert
