class ShutdownVbox < Formula
  homepage 'https://github.com/thecontinium/homebrew-shutdownvbox/'
  url 'https://github.com/thecontinium/homebrew-shutdownvbox.git'
  version '0.0.1'

  skip_clean 'bin'

  def install
    bin.install 'shutdown-vbox'
  end

  #plist_options :startup => true

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <!--

	  You should customize the following placeholders:

      - BOOT.SHUTDOWN.SERVICE : If you don't know, leave it as is
      - SCRIPT_PATH : the path where the boot-shutdown.sh script is stored. 
      - LOG_PATH : the path where the logs are stored. If you don't care about logs, use: /tmp

      -->

      <key>Label</key>
      <string>#{plist_name}</string>

      <key>ProgramArguments</key>
      <array>
	<string>/usr/local/bin/shutdown-vbox</string>
      </array>

      <!--
      set RunAtLoad false if you don't want that script starts 
      automatically every time your mac os x boots
      -->
      <key>RunAtLoad</key>
      <true/>

      <key>WorkingDirectory</key>
      <string>/usr/loacl/bin</string>

      <key>StandardOutPath</key>
      <string>/tmp/#{plist_name}.out</string>

      <key>StandardErrorPath</key>
      <string>/tmp/#{plist_name}.err</string>

      <key>ExitTimeOut</key>
      <integer>600</integer>

    </dict>
    </plist>
    EOS
  end
end
