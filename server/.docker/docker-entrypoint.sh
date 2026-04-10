#!/bin/bash
set -e

echo "=== Laravel Docker Entrypoint ==="

# Clear and optimize caches
echo "Clearing caches..."
php /var/www/artisan config:cache
php /var/www/artisan route:cache
php /var/www/artisan view:cache
echo "✓ Caches optimized!"

# Run migrations if needed (optional, comment out if you prefer manual control)
# echo "Running Laravel migrations..."
# php /var/www/artisan migrate --force --no-interaction
# echo "✓ Migrations complete!"

echo ""
echo "=== Starting Services ==="
echo "Starting nginx on port 8000..."
service nginx start

echo "Starting PHP-FPM..."
exec php-fpm
