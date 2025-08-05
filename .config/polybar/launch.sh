killall -q polybar
echo "---" | tee -a /tmp/example_bar.log
polybar example >> /tmp/example_bar.log
