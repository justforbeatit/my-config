local obsdian_running = os.execute('ps aux | grep obsdian | grep -v grep | grep -v .lua')

if (not obsdian_running) then
    os.execute('/opt/obsdian/Obsidian-0.13.23.AppImage')
end
