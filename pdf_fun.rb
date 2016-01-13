require 'rubygems'
require 'pdf/reader'

# filename = "D:/Users/ddixon/Documents/ISO/ISO9001/ISO 9001.pdf"
filename = "D:/Users/ddixon/Documents/ISO/ISO IEC IEEE 29119-1.pdf"
foo = StringIO.new

receiver = PDF::Reader::TextReceiver.new(foo)
reader = PDF::Reader.file(filename, receiver)

blah = /(\.{4,})(.*)(\.{4,})/m.match(foo.string).to_a
a = blah[0].gsub(/\.{4,}/, '~').split('~')

a.each do |line|
    puts line
end

File.open("./tempt.txt", 'w') do |file|
    a.each do |line|
    file << line
  end
end

#
# page_with_contents = []
# receiver = PDF::Reader::TextReceiver.new($stdout)
# PDF::Reader.file(filename, receiver) do |reader|
#   reader.pages.each do |page|
#     if page.text =~ /\.{4,}/i
#       page_with_contents.push(page.text)
#     end
#   end
# end
# puts page_with_contents.count
# if page_with_contents.count > 0
#   File.open("./tempt.txt", 'w') do |file|
#     page_with_contents.each do |page|
#       page.scan(/\d\.?\d*\s+[A-Z]+\w.*\.+\d+/).each do |line|
#         a = line.split(/\s\.{2}/)[0]
#         b = a.split(/\s{2,}/)
#         file << "#{b[0]}\t#{b[1]}" << "\r"
#       end
#     end
#   end
# end
