function Initialize()
    
    is_update = false
    is_update = update_skin_section("Distiller_Block" .."\\" .. "Display", "HideOnMouseOver", "1");
    
    if is_update == true then
        is_update = false       --update once only
        SKIN:Bang("[!Refresh]");
    end
    
end

function Update()
    
end


function update_skin_section( section, option, value )

    local setting_path = SELF:GetOption('setting_path','None') ;
    local ini_folder_path = SELF:GetOption('ini_folder_path','None') ;
    
    --Rainmeter.ini has got read and written before
    if ( read_file( ini_folder_path .. "Rainmeter.ini" ) ~= "" ) then
       return false;
    end

    --Since we can't read the file directly, we need to copy whole file using os.type and return it in txt
    command = "type " .. "\"".. setting_path .. "Rainmeter.ini" .. "\" " .. "> " .. "\"" .. ini_folder_path .. "Rainmeter.ini" .. "\""
    os.execute(command);

    local inText = read_file( ini_folder_path .. "Rainmeter.ini" ); 
    
    if inText ~= null then

        local outText = change_ini( inText, section, option, value );
        if (outText ~= nil) then
            write_file( outText, ini_folder_path .. "Rainmeter.ini");
            write_file( outText, setting_path .. "Rainmeter.ini");
            return true;
        end

    end
    
    return false;
end

    

--copy files from given location to destination
function copy_file( location, destination  )
    command = "copy " .. location .. " " .. destination
    os.execute(command);
end



-- read files via using lua io, return the string of whole file
function read_file(location)
   
    local read_file_r = io.open( location, 'r');
    
    if read_file_r then

        inText = read_file_r:read("*all");

        io.close(read_file_r);

        return inText;
    
    end
    
    return nil
end


function write_file(outText, destination)
    local write_file_wp = io.open( destination, "w+");
    
    if write_file_wp then

        write_file_wp:write(outText);
        
        io.close(write_file_wp);
    end

    return

end



--make changes to the text of Rainmeter ini
function change_ini( inText, section, option, value )

    --boolean value in determining whether the section is found
    section_found = false;

    --string of the whole file after modification
    outText = inText

    print(outText)

    --read the string inText char by char, break when a modification is done
    for i = 1, string.len(inText), 1 do
        
        if string.sub(inText, i, i + string.len(section) -1 ) == section then
            section_found = true
            print(section_found); --debug
        end

        -- option found in the section, just need to change the value of the option
        if string.sub(inText, i, i+string.len(option) -1 ) == option and section_found == true then
           
            if (option ~= "WindowsX" or "WindowsY") then
                outText = string.sub(inText, 1, i+string.len(option)  ) .. value  .. string.sub(inText, i+string.len(option)+2, -1); 
                break
            else
                original_value_digit = 1
                while ( tonumber( string.sub(inText, i+string.len(option) + original_value_digit) ) ~= nil ) do                
                    original_value_digit = original_value_digit + 1
                end

                outText = string.sub(inText, i, i+string.len(option)  ) .. value .. string.sub(inText, i+string.len(option)+original_value_digit+1, -1);
                break
            end

        
        end

        --option not found in the section, append "option=value" to the end of the section
        if string.sub(inText, i, i) == "[" and section_found == true  then
           
           last_character = 1
           while ( tonumber( string.sub(inText, i - last_character, i - last_character ) )  == nil ) do
                last_character = last_character + 1;
           end
           outText = string.sub(inText, 1, i - last_character) .. '\n' .. option .. "=" .. value  .."\n\n" .. string.sub(inText, i, -1);
           break

        end

    end
    
    -- If changes made, return outText
    if outText ~= inText then
        return outText;
    end
    
    -- Append at the very end
    if (section_found == true ) then
        last_character = 1
           while ( tonumber( string.sub(inText, i - last_character, i - last_character ) )  == nil ) do
                last_character = last_character + 1;
           end
        outText = string.sub(inText, 1, i - last_character) .. '\n' .. option .. "=" .. value;
        return outText;
    end
    

    --no changes made, probably section doesn't even exist
    return nil
end

