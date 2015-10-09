require "json"
require "dotenv"
require "octokit"

def see_childs(n)
  case n
  when Array
    n.map{|x| see_childs(x) }
  else
    n.each{|x|}
  end
end

def apply_env(val, val2 = nil)
     val2 ||= self.class
 case val
  #when String
   #val.gsub(/env\[(\w+?)\]/) { ENV[Regexp.last_match[1]] }
 when Array
   val.map { |v| apply_env(v, val2) }
 when val2
   val.each { |k, v| val[k] = apply_env(v, val2 ) }
   val.to_h.to_json
 else
   val
 end
end
