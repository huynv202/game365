namespace :url do
  task init: :environment do
    urls = File.read('lib/tasks/urls.txt').split(/\n/)
    urls.each do |url|
      url = url.gsub(/\n/, "").gsub(/\?.*?$/, "")
      path_file = "#{url.gsub(/http.*?:\/\/(.*?\.)*.*?\.com\//, "")}"
      path_folder = path_file.split("/")
      path_folder.pop
      path_folder = path_folder.join("/")

      command = "mkdir -p #{path_folder}"
      puts command
      system command
      command = "#{url} -O #{url.gsub(/http.*?:\/\/(.*?\.)*.*?\.com\//, "").gsub(/wget/,"")}"
      puts command
      system command
    end
  end
end
