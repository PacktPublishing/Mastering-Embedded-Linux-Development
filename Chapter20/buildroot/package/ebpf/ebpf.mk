################################################################################
#
# ebpf 
#
################################################################################

EBPF_VERSION = 0.1
EBPF_SITE = package/ebpf
EBPF_SITE_METHOD = local
EBPF_DEPENDENCIES = ply

define EBPF_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/fstab $(TARGET_DIR)/etc/
	$(INSTALL) -D -m 0755 $(@D)/self-test.sh $(TARGET_DIR)/root/
	$(INSTALL) -D -m 0755 $(@D)/test.sh $(TARGET_DIR)/root/
	$(INSTALL) -D -m 0755 $(@D)/count-syscalls.ply $(TARGET_DIR)/root/
	$(INSTALL) -D -m 0755 $(@D)/read-dist.ply $(TARGET_DIR)/root/
	$(INSTALL) -D -m 0755 $(@D)/i2c-stack.ply $(TARGET_DIR)/root/
	$(INSTALL) -D -m 0755 $(@D)/opensnoop.ply $(TARGET_DIR)/root/
	$(INSTALL) -D -m 0755 $(@D)/execsnoop.ply $(TARGET_DIR)/root/
	$(INSTALL) -D -m 0755 $(@D)/tcp-send-recv.ply $(TARGET_DIR)/root/
	$(INSTALL) -D -m 0755 $(@D)/heap-allocs.ply $(TARGET_DIR)/root/
endef

$(eval $(generic-package))
