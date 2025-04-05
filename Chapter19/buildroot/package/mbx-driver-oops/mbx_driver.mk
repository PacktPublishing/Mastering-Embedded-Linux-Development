################################################################################
#
# mbx_driver_oops
#
################################################################################

MBX_DRIVER_OOPS_VERSION = 1.0.0
MBX_DRIVER_OOPS_SITE = /home/frank/MELD/Chapter19/mbx-driver-oops
MBX_DRIVER_OOPS_SITE_METHOD = local

$(eval $(kernel-module))
$(eval $(generic-package))
