#!/bin/bash

. ${PWD}/vars_${ARCH}

wget -nc ${VMLINUX} -O ${LOCAL_VMLINUX}
wget -nc ${INITRD} -O ${LOCAL_INITRD}

cp ${LOCAL_INITRD} ${TMP_INITRD}

initrd_align

echo ${PRESEED} | cpio -ovH newc >> ${TMP_INITRD}

img_create

${QEMU} ${QEMU_OPTS} -drive file=${TMP_IMAGE} -kernel ${LOCAL_VMLINUX} -initrd ${TMP_INITRD} -append "${QEMU_APPEND}"

img_convert
