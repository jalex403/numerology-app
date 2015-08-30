class Person < ActiveRecord::Base

  validates_presence_of :birthdate, :first_name, :last_name
  
  def self.get_birth_path_num (date_of_birth)

    sum_dob = 0
    date_of_birth.each_char do |x|   
      sum_dob += x.to_i  
    end
    number = sum_dob.to_s
    number = number[0].to_i + number[1].to_i

    if number > 9
      number = number.to_s
      number = number[0].to_i + number[1].to_i
    end
    return number
  end


  def self.numerology_message (path_number)
    case path_number
    when 1
       return "One is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."

    when 2
       return "This is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."

    when 3
       return "Number Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."

    when 4
       return "This is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."

    when 5 
       return "This is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."

    when 6 
       return "This is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."

    when 7 
      return "This is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."

    when 8
       return "This is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."

    when 9
       return "This is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."

    end   

  end
  
  def self.valid_birthdate(input)
    if input.length == 8 and (input.match(/^[0-9]+[0-9]$/))
      return true
    end
      return false
  end
  
end