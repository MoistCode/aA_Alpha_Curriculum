# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  hsh = Hash.new(0)
  str.split(" ").each {|el| hsh["#{el}"] = el.length}
  return hsh
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  return hash.sort_by{|k, v| v}.last[0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each {|k,v| older[k] = v}
  return older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  hsh = Hash.new(0)
  word.split("").each {|el| hsh[el] += 1}
  return hsh
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  hsh = {}
  arr.each {|el| hsh[el] = 0}
  return hsh.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  hsh = Hash.new(0)
  numbers.each{|el| el.odd? ? hsh[:odd] += 1 : hsh[:even] += 1}
  return hsh
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  hsh = Hash.new(0)
  string.split("").each do |el|
    hsh["#{el}"] += 1 if el.match (/[aeiou]/)
  end
  if hsh.values.uniq.length == 1
    return hsh.keys.first
  else
    hsh.sort_by{|k, v| v}.last[0]
  end
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  filtered_hsh = {}
  final_arr = []
  students.each {|k, v| filtered_hsh[k] = v if v >= 7}
  filtered_hsh.each do |k, v|
    filtered_hsh.each do |k2, v2|
      final_arr << [k, k2] if k != k2
    end
    filtered_hsh.delete(k)
  end
  p final_arr
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  hsh = Hash.new(0)
  specimens.each {|el| hsh["#{el}"] += 1}
  hsh.sort_by{|k, v| v}
  return hsh.length ** 2 * hsh.values.first / hsh.values.last
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  vandal_split = vandalized_sign.gsub(/[,.'!?\s]/, "").downcase.split("")
  normal_split = normal_sign.gsub(/[,.'!?\s]/, "").downcase.split("")
  vandal_split.each do |el|
    return false if normal_split.index(el) == nil
    normal_split.slice!(normal_split.index(el))
  end
  true
end

def character_count(str)
end
