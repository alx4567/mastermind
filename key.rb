class Key
    # Generates random 4 digit key
    def generate_key
        @key1 = 1 + rand(6)
        @key2 = 1 + rand(6)
        @key3 = 1 + rand(6)
        @key4 = 1 + rand(6)

        no_duplicates_in_key
          
        @correct_key << @key1 << @key2 << @key3 << @key4
    end

    def no_duplicates_in_key
        check_key2
        check_key3
        check_key4
    end
    
    # Random num for key2 until it doesn't match key1
    def check_key2
        while @key2 == @key1
            @key2 = 1 + rand(6)
        end
    end

    # Random num for key3 until it doesn't match key1, key2
    def check_key3
        while @key3 == @key1 || @key3 == @key2
            @key3 = 1 + rand(6)
        end
    end

    # Random num for key4 until it doesn't match key1, key2, key3
    def check_key4
        while @key4 == @key1 || @key4 == @key2 || @key4 == @key3
            @key4 = 1 + rand(6)
        end
    end
end