# keel-laravel: Laravel PHP framework appliance.
# Built on LNMP, which carries nginx, MariaDB, and PHP-FPM. This layer
# adds Composer, Node.js, npm, and the PHP extensions Laravel needs, then
# drops a skeleton project the first boot populates.
#
#     bt-layer laravel --parent lnmp
#
# The web server and database come from the parent; this layer adds the
# framework tooling and a ready-to-deploy nginx site configuration.

COMMON_OVERLAYS += $(CURDIR)/overlay

# nginx on 80/443 (from lnmp), Webmin on 12321, web shell on 12320.
WEBMIN_FW_TCP_INCOMING = 22 80 443 12320 12321

include $(FAB_PATH)/common/mk/turnkey.mk

KEEL_BUILD_TOOLS ?= /usr/local/lib/keel-build
define _keel_root.patched/pre

	install -D -m 755 $(CURDIR)/bin/keel-project-packages $O/root.patched$(KEEL_BUILD_TOOLS)/keel-project-packages;
endef
root.patched/pre += $(_keel_root.patched/pre)
