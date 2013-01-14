require 'sanitize'

module Textist
  module Sanitizer
    PUNCT = %r{\p{Punct}]}

    def sanitize(s)
      s.downcase!
      s = Sanitize.clean(s)
      s.gsub! PUNCT, ''
    end
  end
end
