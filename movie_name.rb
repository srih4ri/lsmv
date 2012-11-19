class MovieName < String
  REPLACEMENTS = [
    [/\(|\)|\[|\]/,''],
    ['.',' '],
    [/dvdrip/i,''],
    [/hdrip/i,''],
    [/tsrip/i,''],
    [/(19|20)\d{2}/,''],
    [/avi|flv|wmv|mkv/,''],
    ['.srt',''],
    ['-Salman',''],
    [/\d{3}MB/,''],
    ['Unrated Edition',''],
    [/axxo/i,''],
    [/XViD/i,''],
    [/x264/i,''],
    [/Unrated/i,''],
    ['Eng-FXG',''],
    ['Eng-xKR',''],
    ['Eng-DmD',''],
    ['AC3Eng-',''],
    [/DivX/i,''],
    ['Eng-',''],
  ]

  def initialize(raw_name)
    @name = raw_name
  end

  def cleanup
    filters.inject(@name){|name,filter| send(filter,name) }
  end

  def filters
    [:replacements,:whitespace]
  end

  def replacements(name)
    REPLACEMENTS.inject(name){|str,repl| str.gsub(repl[0],repl[1])}
  end

  def whitespace(name)
    name.strip
  end

end
