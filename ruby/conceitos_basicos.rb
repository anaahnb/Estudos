# sa�da de dado
print 'Digite seu n+ome: '
# Recebendo uma entrada do teclado
name = gets.chomp
# sa�da utilizando puts
# use c�digos ruby dentro de uma string com #{code}
puts "Hello #{name}!"


print "Digite o primeiro n�mero inteiro: "
# .to_i transforma a string em um n�mero inteiro
number1 = gets.chomp.to_i
print "Digite o segundo n�mero inteiro: "
number2 = gets.chomp.to_i
addition = number1 + number2
puts "O resultado da adi��o entre os dois n�meros � #{addition}"



number3 = 7 # number3.class retornar� inteiro
number4 = 4.47 # number3.class retornar� float
ruby = true # ruby.class retornar� boolean
word = "hello world" # word.class retornar� string



def hey_ho?
    true
  end
  
puts "let�s go" if hey_ho?



# enquanto a express�o for verdadeira (true), o c�digo do corpo do while � executado. assim, ir� retornar de 1 at� 10:
num = 1
while num <= 10
  puts num
  num += 1
end

# � definida a vari�vel num ao bloco e uma express�o. este c�digo ir� imprimir o mesmo que o c�digo de while (1 at� 10):
for num in 1...10
    puts num
  end

# semelhante ao while, mas com a diferen�a que a condi��o � checada depois de executar as express�es
loop do
    puts "GeeksforGeeks"
    val = '7'
    if val == '8'
        break
    end
end

# vai executar a express�o at� que a condi��o seja verdadeira. basicamente o contr�rio de while
var = 7
until var == 11 do
    puts var * 10
    var = var + 1
end



# Arrays
 
bookshelf = []
bookshelf.push("As vantagens de ser invisivel") # adicionando elementos 
bookshelf << "Speak" # outra forma de adicionar
puts bookshelf[0] # retornando um valor (As vantagens de ser invisivel)
puts bookshelf[1] # (Speak)

# imprimindo arrays
bookshelf.each do |book|
    puts book
end

for i in bookshelf do 
    puts i
end
# a principal diferen�a � que o each mant�m apenas a vari�vel dentro do bloco de itera��o
# enquanto que o for permite que a vari�vel seja chamada no exterior do bloco.

hash = {
    "name" => "Ana",
    "age" => 18
  }
  
puts "Meu nome � #{hash["name"]} e tenho #{hask["age"]} anos" 
# retorna o valor atrav�s da key (Meu nome � Ana e tenho 18 anos)

hash.each do |attribute, value|
    puts "#{attribute}: #{value}"
end

# utilizando gems
require 'os'
def my_os
    if OS.windows?
        "Windows"
    elsif OS.linux?
        "Linux"
    elsif OS.mac?
        "Osx"
    else
        "N�o consegui identificar" 
    end
end
puts "Meu PC possui #{OS.cpu_count} cores, � #{OS.bits} bits e o sistema operacional � #{my_os}"

# https://medium.com/codica/40-best-ruby-gems-we-cant-live-without-8ccf314fcd38
# https://rubygems.org/



# source: https://www.freecodecamp.org/news/learning-ruby-from-zero-to-hero-90ad4eecc82d/