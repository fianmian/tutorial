mkdir -p /root/assets

# Adjust this path to where your assets actually are in the repo
cp -r /opt/killercoda/scenario/tutorial/blue-green-tutorial/assets/* /root/assets/

# Make scripts executable
chmod +x /root/assets/*.sh 2>/dev/null || true

echo "✅ Assets have been copied into /root/assets"
ls -l /root/assets
