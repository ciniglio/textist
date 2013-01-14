require 'sanitize'

module Textist
  module Sanitizer
    def sanitize(s)
      Sanitize.clean(s).downcase
    end
  end
end
