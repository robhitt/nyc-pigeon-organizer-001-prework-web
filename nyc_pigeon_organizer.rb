def nyc_pigeon_organizer(pigeon_data)
  pigeon_hash = {}

 pigeon_data.each do |attribute_sym, attribute_detail_hash|

   # attribute_sym == :color
   # attribut_detail_hash == all the different colors and their value array

   attribute_detail_hash.each do |attribute_detail_sym, name_array|

     # attribute_detail_sym == :purple
     # name_array == array of names of people who have purple pigeons

     name_array.each do |name|

       # name == each individual person

       if pigeon_hash.empty?

         temp_attributes_hash = {}
         temp_attribute_detail_array = [attribute_detail_sym.to_s]
         temp_attributes_hash = {attribute_sym => temp_attribute_detail_array}
         pigeon_hash = {name => temp_attributes_hash}

       else

         if pigeon_hash.has_key?(name)

             if pigeon_hash[name].has_key?(attribute_sym)

               pigeon_hash[name][attribute_sym].push(attribute_detail_sym.to_s)

             else

               pigeon_hash[name].merge!(attribute_sym => [attribute_detail_sym.to_s])

             end

         else

           temp_hash = {attribute_sym => [attribute_detail_sym.to_s]}
           pigeon_hash[name] = temp_hash

         end
       end
     end
   end
 end
 return pigeon_hash
end
