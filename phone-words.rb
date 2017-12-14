# == Overview
#
# expand phone-number sequences to a known list of good words
#
require 'set'

# globals
$good_words = Set.new %w[boy girl ham spam cox]
$key_pad = { '0' => [],
             '1' => [],
             '2' => %w[a b c],
             '3' => %w[d e f],
             '4' => %w[g h i],
             '5' => %w[j k l],
             '6' => %w[m n o],
             '7' => %w[p q r s],
             '8' => %w[t u v],
             '9' => %w[w x y z] }

# given a phone number as a string,
#  find all words that can be derived
#  by expanding the numbers from the
#  phone key pad.
# then filter that set to only those we care about.
def phone_word(phone, word, level)
  if phone.length.zero?
    return word if ($good_words.include? word)
    return
  end
  print "#{phone} YZ #{word} XXY #{level}\n"
  digits = phone.split('')
  key = digits.shift
  remainder = digits.join('')
  if $key_pad[key].empty?
    $key_pad[key].each { |w| phone_word(remainder, word + w, level + 1) }
  else
    # empty set of matching characters
    phone_word(remainder, word, level + 1)
  end
end

def phone_to_word(phone)
  phone_word(phone, '', 0)
end

phone_boy_cox = ['8732', '2691', '2169', '2069']
puts(phone_boy_cox.each { |pb| phone_to_word(pb) })
