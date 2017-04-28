require 'mechanize'
require 'fileutils'

module DropSync
  class Mecha

    def self.automatic_download(filename, url, verbose)
        # Gets download link
        agent = Mechanize.new do |agent|
          agent.user_agent_alias = 'Mac Safari'
        end
        page = agent.get(url)
        link = page.uri.to_s.gsub('dl=0', 'dl=1')

        # Creates download path
        download_path = "#{File.expand_path('~')}/Downloads"
        FileUtils.cd(download_path)
        FileUtils.mkdir(filename)
        FileUtils.cd(filename)

        # Downloads file using cURL
        if verbose == '--verbose'
            system("curl -L -o #{download_path}/#{filename}/#{filename}.zip #{link}")
        else
            system("curl -L -s -o #{download_path}/#{filename}/#{filename}.zip #{link}")
        end

        # Cleans up directory
        system("unzip #{download_path}/#{filename}/#{filename}.zip > /dev/null 2>&1")
        FileUtils.rm_rf("__MACOSX")
        system("rm #{filename}.zip")
    end
  end
end