keel-laravel — Laravel PHP framework appliance
===============================================

A Keel Linux appliance for deploying Laravel applications. Built on
the LNMP layer, which carries nginx, MariaDB, and PHP-FPM. This layer
adds Composer, Node.js, npm, and the PHP extensions Laravel needs.

Parent layer: **lnmp**.

Build
-----

::

    bt-layer laravel --parent lnmp

What it ships
-------------

- Composer, Node.js, and npm for dependency management and frontend
  tooling (Vite).
- PHP extensions: xml, curl, zip, mbstring, cli.
- An nginx site configuration pointing at ``/var/www/laravel/public``.
- A skeleton directory the first boot populates with
  ``composer create-project laravel/laravel``.
- Webmin on 12321, web shell on 12320.

What it inherits
----------------

- nginx on 80/443 (from lnmp).
- MariaDB (from lnmp); the pair modes of the LNMP layer apply.
- PHP-FPM (from lnmp).

First boot
----------

The first boot hook reads the instance description, writes
``/var/www/laravel/.env`` from the declared secrets and options,
creates the database and user, and runs ``php artisan migrate``.
