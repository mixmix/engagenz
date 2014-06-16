namespace :import do
  task :far_north => :environment do
    region_name = "Far North"
    region = Region.find_by_name(region_name) || Region.create(name: region)

    file = open_file("#{region_name.downcase.gsub(' ', '_')}.txt")
    text = file.read

    parse_and_create_providers(text, region)

    file.close
  end


end

def parse_and_create_providers(text, region)
  lines = text.split("\n")

  provider_line = 0
  p = Provider.new(region_id: region.id)

  lines.each_with_index do |line, i|
    if line.empty?
      # p p
      # p.save!
      p = Provider.new(region_id: region.id)
      provider_line = -1
    end

    case provider_line
    when -1
      #skip
    when 0
      printf "-----------------------------\n"
      printf "%3s %15s:  \e[32m%s\e[0m\n" % [provider_line, 'name', line]
      p.name = line
    else
      if is_an_email?(line)
        nice_print(provider_line, "email", line)
        p.email += line + ' '
      elsif is_an_address?(line)
        nice_print(provider_line, "address", line)
        p.address += line + ' '
      elsif is_a_phone_number?(line)
        nice_print(provider_line, "phone_number", line)
        p.phone_number += line + ' '
      elsif is_a_website?(line)
        nice_print(provider_line, "website", line)
        p.website += line + ' '
      else
        nice_print(provider_line, "description", line)
        p.description += line + ' '
      end
    end

    provider_line += 1
  end
end

def open_file(filename)
  File.open("lib/assets/#{filename}")
end

def is_an_address?(string)
  string.scan(/^[0-9]+[\s0-9a-zA-Z]*\s[a-zA-z]+/).present?
end

def is_a_phone_number?(string)
  string.scan(/\(?[0-9\s]+\)?[0-9\s]*$/).present?
end

def is_an_email?(string)
  string.scan(/^\s*[a-zA-Z0-9\_\.@]+\s*$/).present?
end

def is_a_website?(string)
  string.scan(/(http|www)/).present?
end

def nice_print(provider_line, title, line)
  printf "%3s %15s:  %s\n" % [provider_line, title, line]
end


