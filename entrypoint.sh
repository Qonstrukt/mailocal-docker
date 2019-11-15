#!/bin/bash

# Start the mailserver
php bin/console email:server --allowed_hosts 0.0.0.0 --port 2525 &

# Start the PHP web server
cd public
php -d variables_order=EGPCS -S 0.0.0.0:8000 ../vendor/symfony/web-server-bundle/Resources/router.php