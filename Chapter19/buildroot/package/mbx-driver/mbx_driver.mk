################################################################################
#
# mbx_driver 
#
################################################################################

MBX_DRIVER_VERSION = 1.0.0
MBX_DRIVER_SITE = /home/frank/MELD/Chapter19/mbx-driver
MBX_DRIVER_SITE_METHOD = local

$(eval $(kernel-module))
$(eval $(generic-package))
