# Create group
echo "[INFO] Creating group 'developers'"
sudo groupadd developers 

#verify group creation
echo "[INFO] Verifying group creation"
getent group developers
cut -d: -f1 /etc/group | grep developers

#create user
echo "[INFO] Creating user 'mordecai'"
sudo useradd -u 5000 -d /var/www/mordecai -m mordecai 

#verify user creation
echo "[INFO] Verifying user creation"
getent passwd mordecai
cut -d: -f1 /etc/passwd | grep mordecai

# Add user to group
echo "[INFO] Adding user 'mordecai' to group 'developers'"
sudo usermod -aG developers mordecai

#verify user is in group
echo "[INFO] Verifying user is in group"
groups mordecai

# Make group own the directory
echo "[INFO] Changing ownership of /var/www/mordecai to user 'mordecai' and group 'developers'"
sudo chown mordecai:developers /var/www/mordecai

# Give owner rwx, group r-x, others nothing
echo "[INFO] Setting permissions for /var/www/mordecai]"
sudo chmod 750 /var/www/mordecai