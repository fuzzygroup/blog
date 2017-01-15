---
layout: post
title: CS Tutorial 002 - Applying O(N) to Arrays vs Regex for Name Splitting
---


  def self.split_full_name_iterative(full_name)
    parts = full_name.split(" ")
    
    first_name_bits = []
    last_name_bits = []
    
    parts.each_with_index do |part, ctr|
      if ctr == parts.size - 1
        last_name_bits << part
      else
        first_name_bits << part
      end
    end
    
    return first_name_bits.join(" "), last_name_bits.join(" ")
  end
  
  def self.split_full_name_regex(full_name)
    first_name = ''
    last_name = ''
    full_name.scan(/(.+) ([^ ]+)$/){ first_name = $1; last_name = $2;}
    return first_name, last_name
  end