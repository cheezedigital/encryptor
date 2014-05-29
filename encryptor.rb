class Encryptor
  def cipher
    { 'A' =>'N', 'B' => 'O', 'C' => 'P', 'D' => 'Q', 'E' =>'R', 'F' => 'S',
      'G' =>'T', 'H' => 'U', 'I' => 'V', 'J' => 'W', 'K' => 'X', 'L' => 'Y',
      'M' =>'Z', 'N' => 'A', 'O' =>'B', 'P' => 'C', 'Q' => 'D', 'R' => 'E',
      'S' => 'F', 'T' => 'G', 'U' => 'H', 'V' => 'I', 'W' => 'J', 'X' => 'K',
      'Y' => 'L', 'Z '=> 'M' }
  end

  def encrypt(character)   #<--- encrypt needs an argument which is used below
    cipher[character.upcase]
  end

    def encrypt_word(string)
      results = []                      #making an empty array for encrypted letters to go into
      letters = string.split("")    #taking string input and splitting into letters array
        letters.each do |letter|   #each item in letters array and putting it down the letter shoot
          encrypt(letter)             #calling method encrypt with argument using letters array
          results << encrypt(letter)    #now the encrypted letter is being shoveled into the results array
      end
      results.join
    end

      def encrypt_file(filename)  #arguement that gets passed into the File.open
        input = File.open(filename, "r" )    #opens the file and saves the file to input
          contents = input.read    #takes input and reads it and puts that into contents
          encrypted_contents = encrypt_word(contents)  #taking contents, calling encrypt_word with argument of contents variable
          input.close                      #make sure to close the file
                                                #now we can use this method with a file!

          output = File.open(filename + ".encrypted", "w") #when file is encrypted it will be message.encrypted
          output.write(encrypted_contents)
          output.close
      end
      #puts results.join        # joing the results back into words from single letters
end

=begin
  e = Encryptor.new
  e.encrypt_word("hello")
=end


=begin

1. cut the input string into letters
2. encrypt those letters one at a time, gathering the results
3. join the results back together in one string
lets make an encrypt method
something that will take an arugement
ruby_encryptor(master)$ irb
2.1.2 :001 > require_relative 'encryptor.rb'
 => true
2.1.2 :002 > e = Encryptor.new
 => #<Encryptor:0x000001018bb1e8>
2.1.2 :003 > e.cipher['a']
 => nil
2.1.2 :004 > e.cipher['A']
 => "N"
2.1.2 :005 >
this is our key for cryting and decryting
uryyb jbeyq = hello world
ruby_encryptor(master)$ irb
2.1.2 :001 > "hello world"
 => "hello world"
2.1.2 :002 > word = "hello world"
 => "hello world"
2.1.2 :003 > word.split
 => ["hello", "world"]
2.1.2 :004 > word.split('L')
 => ["hello world"]
2.1.2 :005 > word.split('l')
 => ["he", "", "o wor", "d"]
2.1.2 :006 >

=end
