module Textist
  class Vectorize
    include Sanitizer

    def initialize(h)
      @strings = h
      @vectors = vectorize
    end

    def vectorize
      @strings.update(@strings) {|k, s| sanitize(s)}
      @strings.update(@strings) {|k, s| s.split}
      global_occurrences = count_occurrences @strings
      vectors = {}
      @strings.each do |k, a|
        vectors[k] = occurrence_vector(global_occurrences, a)
      end
      hash_to_id_vector(vectors)
    end

    def hash_to_id_vector(h)
      a = []
      h.each do |k,v|
        a << IdVector.new(v, k)
      end
      a
    end

    def count_occurrences(h)
      count = Hash.new(0)
      h.each do |_, a|
        a.each do |elem|
          count[elem] += 1
        end
      end
      count
    end

    def occurrence_vector(global_occurrences, split_string)
      a = []
      features = global_occurrences.sort_by {|_, count| count}.map {|i| i[0]}
      features.each do |f|
        a << split_string.count(f)
      end
      a
    end

    def vectors
      @vectors
    end
  end

  def vectorize(h)
    v = Vectorize.new(h)
    return v.vectors
  end

  class IdVector
    def initialize(a, id)
      @a = a
      @id = id
    end

    def id
      @id
    end

    private
    def method_missing(method, *args, &block)
      @a.send(method, *args, &block)
    end
  end
end
