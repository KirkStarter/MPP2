def ipv4_address?(str)
  octets = str.split('.')

  # Check if the string contains exactly 4 octets
  return false unless octets.length == 4

  octets.each do |octet|
    # Check if each octet is a real number
    return false unless octet.match?(/^\d+$/)

    # Check if each octet is in the range from 0 to 255
    return false unless octet.to_i >= 0 && octet.to_i <= 255

    # Check if the octet does not start with zero
    return false if octet.to_i.to_s != octet
  end

  true
end

puts ipv4_address?('192.168.0.1')  # true
puts ipv4_address?('10.0.0.0')     # true
puts ipv4_address?('255.255.255.0') # true
puts ipv4_address?('0.0.0.0')       # true

puts ipv4_address?('192.168.0')     # false
puts ipv4_address?('10.0.0.256')    # false
puts ipv4_address?('192.168.01.1')  # false
puts ipv4_address?('192.168.0.01')  # false
puts ipv4_address?('25 5.255.255.0') # false
puts ipv4_address?('10.0 .0.0')     # false