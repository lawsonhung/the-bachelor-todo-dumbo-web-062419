# binding.pry
require 'pry'

# Takes in two arguments, a hash called data and a season. The method should return the first name of that season's winner. 
def get_first_name_of_season_winner(data, season)
  # code here
  winner_name = ""

  data.each do |data_season, participants|

    if data_season == season
      participants.each do |participant|
        participant.each do |detail_key, detail_value|
          if detail_value == "Winner"
            winner_name = participant["name"]
          end
        end
      end
    end
  end

  winner_name_split = winner_name.split(" ")
  winner_name = winner_name_split[0]
  # binding.pry

  winner_name
end

# Takes in the data hash and an occupation string and returns the name of the woman who has that occupation
def get_contestant_name(data, occupation)
  # code here
  name = ""

  data.each do |season_number, participants|
    participants.each do |participant|
      participant.each do |detail_key, detail_value|
        if detail_value == occupation
          name = participant["name"]
        end
      end
    end
  end

  name
end

# Takes in two arguments––the data hash and a string of a hometown. This method should return a counter of the number of contestants who are from that hometown
def count_contestants_by_hometown(data, hometown)
  # code here
  num_contestants_from_hometown = 0

  data.each do |season_number, participants|
    participants.each do |participant|
      participant.each do |detail_key, detail_value|
        if detail_value == hometown
          num_contestants_from_hometown += 1
        end
      end
    end
  end

  num_contestants_from_hometown
end

# Takes in two arguments––the data hash and a string of a hometown. It returns the occupation of the first contestant who hails from that hometown
def get_occupation(data, hometown)
  # code here

  data.each do |season_number, participants|
    participants.each do |participant|
      participant.each do |detail_key, detail_value|
        if detail_value == hometown
          return participant["occupation"]
        end
      end
    end
  end

end

# Takes in two arguments––the data hash and a string of a season. Iterate through the hash and return the average age of all of the contestants for that season
def get_average_age_for_season(data, season)
  # code here
  total_age = 0.0
  num_participants = 0

  data.each do |season_number, participants|

    if season_number == season
      participants.each do |participant|
        participant.each do |detail_key, detail_value|
          current_participant_age = participant["age"].to_f
          total_age += current_participant_age
          num_participants += 1
        end
      end
    end
  end

  averge_age = total_age / num_participants
  averge_age.round
end
