require 'rubygems'
require 'mechanize'

TimeBegin = Time.now
#


$urls = []
 file = File.open("/root/list.txt", "r")
   while (line = file.gets) 
     url = line.sub("\n","")
     $urls <<  url unless url == "" 
   end
file.close

puts $urls


# В один поток
# browser = Mechanize.new
#   $urls.each do |url|
#     # puts '----- url ---- ' + url
#     img = browser.get(url)
#     # puts '----- img ---- ' + url
#     img.save("/root/img/#{img.filename}")
#     # puts img.filename +  ' saved'
#   end




t1=Thread.new{ 
  browser = Mechanize.new

  while( $urls.size != 0 ) 
    url =  $urls.shift
    puts '-- url -- ' + url 
    img = browser.get(url)
    img.save("/root/img/#{img.filename}")
  end
}



t2=Thread.new{ 
  browser = Mechanize.new

  while( $urls.size != 0 ) 
    url =  $urls.shift
    puts '-- url -- ' + url 
    img = browser.get(url)
    img.save("/root/img/#{img.filename}")
  end
}



t3=Thread.new{ 
  browser = Mechanize.new

  while( $urls.size != 0 ) 
    url =  $urls.shift
    puts '-- url -- ' + url 
    img = browser.get(url)
    img.save("/root/img/#{img.filename}")
  end
}


t4=Thread.new{ 
  browser = Mechanize.new

  while( $urls.size != 0 ) 
    url =  $urls.shift
    puts '-- url -- ' + url 
    img = browser.get(url)
    img.save("/root/img/#{img.filename}")
  end
}



t5=Thread.new{ 
  browser = Mechanize.new

  while( $urls.size != 0 ) 
    url =  $urls.shift
    puts '-- url -- ' + url 
    img = browser.get(url)
    img.save("/root/img/#{img.filename}")
  end
}



t6=Thread.new{ 
  browser = Mechanize.new

  while( $urls.size != 0 ) 
    url =  $urls.shift
    puts '-- url -- ' + url 
    img = browser.get(url)
    img.save("/root/img/#{img.filename}")
  end
}


t7=Thread.new{ 
  browser = Mechanize.new

  while( $urls.size != 0 ) 
    url =  $urls.shift
    puts '-- url -- ' + url 
    img = browser.get(url)
    img.save("/root/img/#{img.filename}")
  end
}


t1.join
t2.join
t3.join
t4.join
t5.join
t6.join
t7.join


# Code here
#
Time.now - TimeBegin 






