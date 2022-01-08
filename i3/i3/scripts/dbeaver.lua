local dbeaver_running = os.execute('ps aux | grep dbeaver | grep -v grep | grep -v .lua')

if (not dbeaver_running) then
    os.execute('/opt/dbeaver/dbeaver')
end
