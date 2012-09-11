require 'mechanize'

THEAD_COUNT = 4

$urls = []
 file = File.open("/root/list.txt", "r")
   while (line = file.gets) 
     url = line.sub("\n","")
     $urls <<  url unless url == "" 
   end
file.close

def get_save_img
  browser = Mechanize.new
  while( $urls.size != 0 ) 
    url =  $urls.shift
    puts '-- url -- ' + url 
    img = browser.get(url)
    img.save("/root/img/#{img.filename}")
  end
end

ThreadArray = []
THEAD_COUNT.times do |t|
  ThreadArray <<  Thread.new{ get_save_img }
  ThreadArray.last.join
end