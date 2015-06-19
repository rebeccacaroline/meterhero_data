# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'CSV'

CSV.foreach('testdb.csv', "r:ISO-8859-1") do |line|
  line_state = line[12] ? line[12].upcase : nil
  #I wanted to make the states consistent, and provide a nil value so that there wouldn't be an error when there was no value
  line_city = line[11] ? line[11].upcase : nil
  if line_city == "sf"
    line_city = "San Francisco"
  #I noticed that some people just put 'sf' for San Francisco. This will make error handling easier when I move to the front end.
  elsif line_city
    line_city = line_city.split(" ").map!{|word| word.downcase.capitalize}.join(" ")
    #This makes the database more consistent, and will make error handling a lot easier when I move to the front end.
  end
  dollars_saved = line[9].to_f.round(2)
  amt_units_saved = line[8].to_f

  slug = line[6]
  #I checked to see if the word "electric" or "gas" or "water" was included in the slug name. I noticed that in one slug, the name was "water-st-gas," and the next slug was "water-st-water." For that, I put "gas" above "water" so that when Ruby runs through, it will check the slugs against gas first, and assign the "water-st-gas" slug to "gas" instead of "water."
  if slug.include?("electric")
    slug = "Electric"
  elsif slug.include?("gas")
    slug = "Gas"
  elsif slug.include?("water")
    slug = "Water"
  else
    #Since some slugs didn't include the name of the utility, I checked the label in those cases.
    slug = line[1].downcase
    if slug.include?("electric")
      slug = "Electric"
    elsif slug.include?("gas")
      slug = "Gas"
    elsif slug.include?("water")
      slug = "Water"
    else
      #Some entries didn't mention the utility in the slug or the label. I chose, for the purposes of this challenge, to just ignore those entries.
      slug = nil
    end
  end
  #The variable name 'slug' might be a little confusing, because it doesn't refer to the actual Slug in the CSV file. I wanted to use 'meter_type,' but Rails interpreted that as a sub-class of the "Meter" class, because of the word "type."


  Meter.create({
    utility: slug,
    units_saved: amt_units_saved,
    dollar_amount_saved: dollars_saved,
    city: line_city,
    state: line_state
    })

end

