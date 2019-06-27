class ProfanityValidator < ActiveModel::Validator
  # profanity_list = ['fuck', 'shit', 'bitch', 'damn', 'f*ck', 'sh*t', 'b*tch', 'd*mn']
  
  def validate(record)
    if record.saying =~ /[Ff].ck/ || record.saying =~ /[Ss]hit/ || record.saying =~ /[Bb]itch/ || record.saying =~ /[Dd]amn/
      record.errors.add :saying, "profanity"
    end
  end

end
    