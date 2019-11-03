errors = 0

filename = ARGV[0] == '' ? '*.rb' : ARGV[0]

Dir["./test/#{filename}"].each do |file|
  status = system('ruby ' + file)
  errors += 1 unless status
end

exit_code = (errors != 0 ? 1 : 0)
p '------------------------'
p "exited with #{exit_code}"
exit(exit_code)
