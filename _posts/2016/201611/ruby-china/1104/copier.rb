from_file, to_file = ARGV
script = $PROGRAM_NAME

def ask
  puts "Split from #{from_file}"

  puts "The input file is #{indata.length} bytes long"

  puts 'Ready, hit RETURN to continue, CTRL-C to abort.'

  STDIN.gets
end

def copy(indata)
  input = File.open(from_file)
  indata = input.read
  output = File.open(to_file, 'w')
  output.write(indata)
end

def readtoblank(lines_to_blank)
  lines_to_blank = lines_to_blank
end

ask

copy(indata)

puts 'Alright, all done.'

output.close

input.close
