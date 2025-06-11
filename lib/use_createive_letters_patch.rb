# encoding: utf-8

require 'pathname'
require 'language_filter/error'
require 'language_filter/version'

module LanguageFilter
  module UseCreativeLettersPatch
    
    def use_creative_letters(text)
      new_text = ""
      last_char = ""
      first_char_done = false
      text.each_char do |char|
        if last_char != '\\'
          # new_text += '[\\-_\\s\\*\\.\\,\\`\\:\\\']*' if last_char != "" and char =~ /[A-Za-z]/ and first_char_done
          new_text += case char.downcase
          when 'a' then first_char_done = true; '(?:a|@|4|\\^|/\\\\|/\\-\\\\|aye?)'
          when 'b' then first_char_done = true; '(?:b|i3|l3|13|\\|3|/3|\\\\3|3|8|6|\\u00df|p\\>|\\|\\:|[^a-z]bee+[^a-z])'
          when 'c','k' then first_char_done = true; '(?:c|\\u00a9|\\u00a2|\\(|\\[|[^a-z]cee+[^a-z]|[^a-z]see+[^a-z]|k|x|[\\|\\[\\]\\)\\(li1\\!\\u00a1][\\<\\{\\(]|[^a-z][ck]ay+[^a-z])'
          when 'd' then first_char_done = true; '(?:d|\\)|\\|\\)|\\[\\)|\\?|\\|\\>|\\|o|[^a-z]dee+[^a-z])'
          when 'e' then first_char_done = true; '(?:e|3|\\&|\\u20ac|\\u00eb|\\[\\-)'
          when 'f' then first_char_done = true; '(?:f|ph|\\u0192|[\\|\\}\\{\\\\/\\(\\)\\[\\]1il\\!][\\=\\#]|[^a-z]ef+[^a-z])'
          when 'g' then first_char_done = true; '(?:g|6|9|\\&|c\\-|\\(_\\+|[^a-z]gee+[^a-z])'
          when 'h' then first_char_done = true; '(?:h|\\#|[\\|\\}\\{\\\\/\\(\\)\\[\\]]\\-?[\\|\\}\\{\\\\/\\(\\)\\[\\]])'
          when 'i','l' then first_char_done = true; '(?:i|l|1|\\!|\\u00a1|\\||\\]|\\[|\\\\|/|[^a-z]eye[^a-z]|\\u00a3|[\\|li1\\!\\u00a1\\[\\]\\(\\)\\{\\}]_|\\u00ac|[^a-z]el+[^a-z])'
          when 'j' then first_char_done = true; '(?:j|\\]|\\u00bf|_\\||_/|\\</|\\(/|[^a-z]jay+[^a-z])'
          when 'm' then first_char_done = true; '(?:m|[\\|\\(\\)/](?:\\\\/|v|\\|)[\\|\\(\\)\\\\]|\\^\\^|[^a-z]em+[^a-z])'
          when 'n' then first_char_done = true; '(?:n|[\\|/\\[\\]\\<\\>]\\\\[\\|/\\[\\]\\<\\>]|/v|\\^/|[^a-z]en+[^a-z])'
          when 'o' then first_char_done = true; '(?:o|0|\\(\\)|\\[\\]|\\u00b0|[^a-z]oh+[^a-z])'
          when 'p' then first_char_done = true; '(?:p|\\u00b6|[\\|li1\\[\\]\\!\\u00a1/\\\\][\\*o\\u00b0\\"\\>7\\^]|[^a-z]pee+[^a-z])'
          when 'q' then first_char_done = true; '(?:q|9|(?:0|\\(\\)|\\[\\])_|\\(_\\,\\)|\\<\\||[^a-z][ck]ue*|qu?eue*[^a-z])'
          when 'r' then first_char_done = true; '(?:r|[/1\\|li]?[2\\^\\?z]|\\u00ae|[^a-z]ar+[^a-z])'
          when 's','z' then first_char_done = true; '(?:s|\\$|5|\\u00a7|[^a-z]es+[^a-z]|z|2|7_|\\~/_|\\>_|\\%|[^a-z]zee+[^a-z])'
          when 't' then first_char_done = true; '(?:t|7|\\+|\\u2020|\\-\\|\\-|\\\'\\]\\[\\\')'
          when 'u','v' then first_char_done = true; '(?:u|v|\\u00b5|[\\|\\(\\)\\[\\]\\{\\}]_[\\|\\(\\)\\[\\]\\{\\}]|\\L\\||\\/|[^a-z]you[^a-z]|[^a-z]yoo+[^a-z]|[^a-z]vee+[^a-z])'
          when 'w' then first_char_done = true; '(?:w|vv|\\\\/\\\\/|\\\\\\|/|\\\\\\\\\\\'|\\\'//|\\\\\\^/|\\(n\\)|[^a-z]do?u+b+l+e*[^a-z]?(?:u+|you|yoo+)[^a-z])'
          when 'x' then first_char_done = true; '(?:x|\\>\\<|\\%|\\*|\\}\\{|\\)\\(|[^a-z]e[ck]+s+[^a-z]|[^a-z]ex+[^a-z])'
          when 'y' then first_char_done = true; '(?:y|\\u00a5|j|\\\'/|[^a-z]wh?(?:y+|ie+)[^a-z])'
          else char
          end
        elsif char.downcase == 'w' then
          new_text += 'S'
        else
          new_text += char
        end
        last_char = char
      end
      new_text
    end
  end
end