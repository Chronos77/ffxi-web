
desc "Import FFXI Topaz-next files"
task :import_lua do
  def checkInt(id)
    if id.match('x') 
      id.to_i(16)
    else
      id
    end
  end
  REDIS_CLIENT = Redis.new(host: '192.168.1.38', port: 6379, db: 0)

  Dir.glob("/home/ubuntu/projects/server/scripts/globals/**/*.lua").each do |file|
    pp file
    file = File.open(file)

    regexp_group = /xi.([aA-zZ]+)\s*=\s*[\r\n]([{][^}]+[}])*/
    regexp_line = /[\s-]*([aA0-zZ9]+)\s+=\s+([aA0-zZ9]+)([,]*)/

    groups = file.read.scan(regexp_group)

    groups.each do |g|
      name = g[0]
      values = g[1]
      
      values.gsub!(/[\-]{2}[^\n]+/, "")
      values.gsub!(regexp_line) { |line| "\"#{checkInt($2)}\":\"#{$1}\"#{$3}" }
      values.gsub!(/\,[\r\n\s]+/, "")
      REDIS_CLIENT.set(g[0].upcase, values)
    end
  end
end