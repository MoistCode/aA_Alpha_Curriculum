# MyHashSet
#
# Ruby provides a class named `Set`. A set is an unordered collection of
# values with no duplicates.  You can read all about it in the documentation:
#
# http://www.ruby-doc.org/stdlib-2.1.2/libdoc/set/rdoc/Set.html
#
# Let's write a class named `MyHashSet` that will implement some of the
# functionality of a set. Our `MyHashSet` class will utilize a Ruby hash to keep
# track of which elements are in the set.  Feel free to use any of the Ruby
# `Hash` methods within your `MyHashSet` methods.
#
# Write a `MyHashSet#initialize` method which sets an empty hash object to
# `@store`. Next, write an `#insert(el)` method that stores `el` as a key
# in `@store`, storing `true` as the value. Write an `#include?(el)`
# method that sees if `el` has previously been `insert`ed by checking the
# `@store`; return `true` or `false`.
#
# Next, write a `#delete(el)` method to remove an item from the set.
# Return `true` if the item had been in the set, else return `false`.  Add
# a method `#to_a` which returns an array of the items in the set.
#
# Next, write a method `set1#union(set2)` which returns a new set which
# includes all the elements in `set1` or `set2` (or both). Write a
# `set1#intersect(set2)` method that returns a new set which includes only
# those elements that are in both `set1` and `set2`.
#
# Write a `set1#minus(set2)` method which returns a new set which includes
# all the items of `set1` that aren't in `set2`.

class MyHashSet
  attr_reader :store

  def initialize(store = {})
    @store = store
  end

  def insert(input)
    @store[input] = true
  end

  def include?(input)
    @store.keys.each do |k|
      return true if k == input
    end
    false
  end

  def delete(input)
    @store.delete_if {|k, v| k == input}
  end

  def to_a
    arr = []
    @store.keys.each {|k| arr << k}
    arr.compact
  end

  def union(second_set)
    new_set = MyHashSet.new()
    @store.keys.each {|k| new_set.insert(k)}
    second_set.store.keys.each {|k| new_set.insert(k)}
    new_set
  end

  def intersect(second_set)
    new_set = MyHashSet.new()
    @store.keys.each do |k|
      new_set.insert(k) if second_set.store.keys.include?(k)
    end
    new_set
  end

  def minus(second_set)
    new_set = MyHashSet.new()
    @store.keys.each do |k|
      new_set.insert(k) if !second_set.store.keys.include?(k)
    end
    new_set
  end

  def symmetric_difference(second_set)
    arr = []
    @store.keys.each do |k|
      if !second_set.store.keys.include?(k)
        arr << k
      end
    end

    second_set.store.keys.each do |k|
      if !@store.keys.include?(k)
        arr << k
      end
    end

    new_set = MyHashSet.new()
    arr.each {|el| new_set.insert(el)}
    new_set
  end
end

# Bonus
#
# - Write a `set1#symmetric_difference(set2)` method; it should return the
#   elements contained in either `set1` or `set2`, but not both!
# - Write a `set1#==(object)` method. It should return true if `object` is
#   a `MyHashSet`, has the same size as `set1`, and every member of
#   `object` is a member of `set1`.
